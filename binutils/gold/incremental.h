// inremental.h -- incremental linking support for gold   -*- C++ -*-

// Copyright 2009 Free Software Foundation, Inc.
// Written by Mikolaj Zalewski <mikolajz@google.com>.

// This file is part of gold.

// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
// MA 02110-1301, USA.

#ifndef GOLD_INCREMENTAL_H
#define GOLD_INCREMENTAL_H

#include <map>
#include <vector>

#include "elfcpp_file.h"
#include "stringpool.h"
#include "workqueue.h"
#include "fileread.h"
#include "output.h"

namespace gold
{

class Archive;
class Input_argument;
class Incremental_inputs_checker;
class Object;
class Output_section_data;

// Incremental input type as stored in .gnu_incremental_inputs.

enum Incremental_input_type
{
  INCREMENTAL_INPUT_INVALID = 0,
  INCREMENTAL_INPUT_OBJECT = 1,
  INCREMENTAL_INPUT_ARCHIVE = 2,
  INCREMENTAL_INPUT_SHARED_LIBRARY = 3,
  INCREMENTAL_INPUT_SCRIPT = 4
};

// An object representing the ELF file we edit during an incremental build.
// Similar to Object or Dynobj, but operates on Output_file and contains
// method specific to file edition (TBD). This is the abstract parent class
// implemented in Sized_incremental_binary<size, big_endian> for a specific
// endianness and size.

class Incremental_binary
{
 public:
  Incremental_binary(Output_file* output, Target* target)
    : output_(output), target_(target)
  { }

  virtual
  ~Incremental_binary()
  { }

  // Functions and types for the elfcpp::Elf_file interface.  This
  // permit us to use Incremental_binary as the File template parameter for
  // elfcpp::Elf_file.

  // The View class is returned by view.  It must support a single
  // method, data().  This is trivial, because Output_file::get_output_view
  // does what we need.
  class View
  {
   public:
    View(const unsigned char* p)
      : p_(p)
    { }

    const unsigned char*
    data() const
    { return this->p_; }

   private:
    const unsigned char* p_;
  };

  // Return a View.
  View
  view(off_t file_offset, section_size_type data_size)
  { return View(this->output_->get_input_view(file_offset, data_size)); }

  // A location in the file.
  struct Location
  {
    off_t file_offset;
    off_t data_size;

    Location(off_t fo, section_size_type ds)
      : file_offset(fo), data_size(ds)
    { }

    Location()
      : file_offset(0), data_size(0)
    { }
  };

  // Get a View given a Location.
  View view(Location loc)
  { return View(this->view(loc.file_offset, loc.data_size)); }

  // Report an error.
  void
  error(const char* format, ...) const ATTRIBUTE_PRINTF_2;

  // Find the .gnu_incremental_inputs section.  It selects the first section
  // of type SHT_GNU_INCREMENTAL_INPUTS.  Returns false if such a section
  // is not found.
  bool
  find_incremental_inputs_section(Location* location,
                                  unsigned int* strtab_shndx)
  { return do_find_incremental_inputs_section(location, strtab_shndx); }

  // Check the .gnu_incremental_inputs section to see whether an incremental
  // build is possible.
  // TODO: on success, should report what files needs to be rebuilt.
  // INCREMENTAL_INPUTS is used to read the canonical form of the command line
  // and read the input arguments.  TODO: for items that don't need to be
  // rebuilt, we should also copy the incremental input information.
  virtual bool
  check_inputs(Incremental_inputs* incremental_inputs)
  { return do_check_inputs(incremental_inputs); }

 protected:
  // Find incremental inputs section.
  virtual bool
  do_find_incremental_inputs_section(Location* location,
                                     unsigned int* strtab_shndx) = 0;

  // Check the .gnu_incremental_inputs section to see whether an incremental
  // build is possible.
  virtual bool
  do_check_inputs(Incremental_inputs* incremental_inputs) = 0;

 private:
  // Edited output file object.
  Output_file* output_;
  // Target of the output file.
  Target* target_;
};

template<int size, bool big_endian>
class Sized_incremental_binary : public Incremental_binary
{
 public:
  Sized_incremental_binary(Output_file* output,
                           const elfcpp::Ehdr<size, big_endian>& ehdr,
                           Target* target)
    : Incremental_binary(output, target), elf_file_(this, ehdr)
  { }

 protected:
  virtual bool
  do_find_incremental_inputs_section(Location* location,
                                     unsigned int* strtab_shndx);

  virtual bool
  do_check_inputs(Incremental_inputs* incremental_inputs);

 private:
  // Output as an ELF file.
  elfcpp::Elf_file<size, big_endian, Incremental_binary> elf_file_;
};

// Create an Incremental_binary object for FILE. Returns NULL is this is not
// possible, e.g. FILE is not an ELF file or has an unsupported target.
Incremental_binary*
open_incremental_binary(Output_file* file);

// Code invoked early during an incremental link that checks what files need
// to be relinked.
class Incremental_checker
{
 public:
  // Check if the file named OUTPUT_NAME can be linked incrementally.
  // INCREMENTAL_INPUTS must have the canonical form of the command line
  // and input arguments filled - at this point of linking other fields are
  // probably not filled yet.  TODO: for inputs that don't need to be
  // rebuilt, this function should fill the incremental input information.
  Incremental_checker(const char* output_name,
                      Incremental_inputs* incremental_inputs)
    : output_name_(output_name), incremental_inputs_(incremental_inputs)
  { }

  // Analyzes the output file to check if incremental linking is possible and
  // what files needs to be relinked.
  bool
  can_incrementally_link_output_file();

 private:
  // Name of the output file to analyze.
  const char* output_name_;

  // The Incremental_inputs object. At this stage of link, only the command
  // line and inputs are filled.
  Incremental_inputs* incremental_inputs_;
};

// This class contains the information needed during an incremental
// build about the inputs necessary to build the .gnu_incremental_inputs.
class Incremental_inputs
{
 public:
  Incremental_inputs()
    : lock_(new Lock()), inputs_(NULL), command_line_key_(0),
      strtab_(new Stringpool())
  { }
  ~Incremental_inputs() { delete this->strtab_; }

  // Record the command line.
  void
  report_command_line(int argc, const char* const* argv);

  // Record the input arguments obtained from parsing the command line.
  void
  report_inputs(const Input_arguments& inputs)
  { this->inputs_ = &inputs; }

  // Record that the input argument INPUT is an archive ARCHIVE.
  void
  report_archive(const Input_argument* input, Archive* archive);

  // Record that the input argument INPUT is to an object OBJ.
  void
  report_object(const Input_argument* input, Object* obj);

  // Record that the input argument INPUT is to an script SCRIPT.
  void
  report_script(const Input_argument* input, Timespec mtime,
                Script_info* script);

  // Prepare for layout.  Called from Layout::finalize.
  void
  finalize();

  // Create the content of the .gnu_incremental_inputs section.
  Output_section_data*
  create_incremental_inputs_section_data();

  // Return the .gnu_incremental_strtab stringpool.
  Stringpool*
  get_stringpool()
  { return this->strtab_; }

  // Return the canonical form of the command line, as will be stored in
  // .gnu_incremental_strtab.
  const std::string&
  command_line()
  { return this->command_line_; }

  // Return the input files found in the command line.
  const Input_arguments*
  inputs()
  { return this->inputs_; }

 private:
  // Code for each of the four possible variants of create_inputs_section_data.
  template<int size, bool big_endian>
  Output_section_data*
  sized_create_inputs_section_data();

  // Compute indexes in the order in which the inputs should appear in
  // .gnu_incremental_inputs and put file names to the stringtable.
  // This needs to be done after all the scripts are parsed.

  void
  finalize_inputs(Input_argument_list::const_iterator begin,
		  Input_argument_list::const_iterator end,
		  unsigned int* index);

  // Additional data about an input needed for an incremental link.
  // None of these pointers is owned by the structure.
  struct Input_info
  {
    Input_info()
      : type(INCREMENTAL_INPUT_INVALID), archive(NULL), filename_key(0),
        index(0)
    { }

    // Type of the file pointed by this argument.
    Incremental_input_type type;

    union
    {
      // Present if type == INCREMENTAL_INPUT_ARCHIVE.
      Archive* archive;

      // Present if type == INCREMENTAL_INPUT_OBJECT or
      // INCREMENTAL_INPUT_SHARED_LIBRARY.
      Object* object;

      // Present if type == INCREMENTAL_INPUT_SCRIPT.
      Script_info* script;
    };

    // Key of the filename string in the section stringtable.
    Stringpool::Key filename_key;

    // Position of the entry information in the output section.
    unsigned int index;

    // Last modification time of the file.
    Timespec mtime;
  };

  typedef std::map<const Input_argument*, Input_info> Inputs_info_map;

  // A lock guarding access to inputs_ during the first phase of linking, when
  // report_ function may be called from multiple threads.
  Lock* lock_;

  // The list of input arguments obtained from parsing the command line.
  const Input_arguments* inputs_;

  // A map containing additional information about the input elements.
  Inputs_info_map inputs_map_;

  // Canonical form of the command line, as will be stored in
  // .gnu_incremental_strtab.
  std::string command_line_;

  // The key of the command line string in the string pool.
  Stringpool::Key command_line_key_;

  // The .gnu_incremental_strtab string pool associated with the
  // .gnu_incremental_inputs.
  Stringpool* strtab_;
};

} // End namespace gold.

#endif // !defined(GOLD_INCREMENTAL_H)
