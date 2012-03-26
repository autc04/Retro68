// inremental.cc -- incremental linking support for gold

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

#include "gold.h"

#include <cstdarg>

#include "elfcpp.h"
#include "output.h"
#include "incremental.h"
#include "archive.h"
#include "output.h"
#include "target-select.h"

using elfcpp::Convert;

namespace gold {

// Version information. Will change frequently during the development, later
// we could think about backward (and forward?) compatibility.
const unsigned int INCREMENTAL_LINK_VERSION = 1;

namespace internal {

// Header of the .gnu_incremental_input section.
struct Incremental_inputs_header_data
{
  // Incremental linker version.
  elfcpp::Elf_Word version;

  // Numer of input files in the link.
  elfcpp::Elf_Word input_file_count;

  // Offset of command line options in .gnu_incremental_strtab.
  elfcpp::Elf_Word command_line_offset;

  // Padding.
  elfcpp::Elf_Word reserved;
};

// Data stored in .gnu_incremental_input after the header for each of the
// Incremental_input_header_data::input_file_count input entries.
struct Incremental_inputs_entry_data
{
  // Offset of file name in .gnu_incremental_strtab section.
  elfcpp::Elf_Word filename_offset;

  // Offset of data in .gnu_incremental_input.
  elfcpp::Elf_Word data_offset;

  // Timestamp (in seconds).
  elfcpp::Elf_Xword timestamp_sec;

  // Nano-second part of timestamp (if supported).
  elfcpp::Elf_Word timestamp_nsec;

  // Type of the input entry.
  elfcpp::Elf_Half input_type;

  // Padding.
  elfcpp::Elf_Half reserved;
};

}

// Accessors.

// Reader class for .gnu_incremental_inputs header. See
// internal::Incremental_input_header for fields descriptions.

template<int size, bool big_endian>
class Incremental_inputs_header
{
 public:
  Incremental_inputs_header(const unsigned char *p)
    : p_(reinterpret_cast<const internal::Incremental_inputs_header_data*>(p))
  { }

  static const int data_size = sizeof(internal::Incremental_inputs_header_data);

  elfcpp::Elf_Word
  get_version() const
  { return Convert<32, big_endian>::convert_host(this->p_->version); }

  elfcpp::Elf_Word
  get_input_file_count() const
  { return Convert<32, big_endian>::convert_host(this->p_->input_file_count); }

  elfcpp::Elf_Word
  get_command_line_offset() const
  { return Convert<32, big_endian>::convert_host(this->p_->command_line_offset); }

  elfcpp::Elf_Word
  get_reserved() const
  { return Convert<32, big_endian>::convert_host(this->p_->reserved); }

 private:
  const internal::Incremental_inputs_header_data* p_;
};

// Writer class for .gnu_incremental_inputs header. See
// internal::Incremental_input_header for fields descriptions.

template<int size, bool big_endian>
class Incremental_inputs_header_write
{
 public:
  Incremental_inputs_header_write(unsigned char *p)
    : p_(reinterpret_cast<internal::Incremental_inputs_header_data*>(p))
  { }

  static const int data_size = sizeof(internal::Incremental_inputs_header_data);

  void
  put_version(elfcpp::Elf_Word v)
  { this->p_->version = Convert<32, big_endian>::convert_host(v); }

  void
  put_input_file_count(elfcpp::Elf_Word v)
  { this->p_->input_file_count = Convert<32, big_endian>::convert_host(v); }

  void
  put_command_line_offset(elfcpp::Elf_Word v)
  { this->p_->command_line_offset = Convert<32, big_endian>::convert_host(v); }

  void
  put_reserved(elfcpp::Elf_Word v)
  { this->p_->reserved = Convert<32, big_endian>::convert_host(v); }

 private:
  internal::Incremental_inputs_header_data* p_;
};

// Reader class for an .gnu_incremental_inputs entry. See
// internal::Incremental_input_entry for fields descriptions.
template<int size, bool big_endian>
class Incremental_inputs_entry
{
 public:
  Incremental_inputs_entry(const unsigned char *p)
    : p_(reinterpret_cast<const internal::Incremental_inputs_entry_data*>(p))
  { }

  static const int data_size = sizeof(internal::Incremental_inputs_entry_data);

  elfcpp::Elf_Word
  get_filename_offset(elfcpp::Elf_Word v)
  { return Convert<32, big_endian>::convert_host(this->p_->filename_offset); }

  elfcpp::Elf_Word
  get_data_offset(elfcpp::Elf_Word v)
  { return Convert<32, big_endian>::convert_host(this->p_->data_offset); }

  elfcpp::Elf_Xword
  get_timestamp_sec(elfcpp::Elf_Xword v)
  { return Convert<64, big_endian>::convert_host(this->p_->timestamp_sec); }

  elfcpp::Elf_Word
  get_timestamp_nsec(elfcpp::Elf_Word v)
  { return Convert<32, big_endian>::convert_host(this->p_->timestamp_nsec); }

  elfcpp::Elf_Word
  get_input_type(elfcpp::Elf_Word v)
  { return Convert<32, big_endian>::convert_host(this->p_->input_type); }

  elfcpp::Elf_Word
  get_reserved(elfcpp::Elf_Word v)
  { return Convert<32, big_endian>::convert_host(this->p_->reserved); }

 private:
  const internal::Incremental_inputs_entry_data* p_;
};

// Writer class for an .gnu_incremental_inputs entry. See
// internal::Incremental_input_entry for fields descriptions.
template<int size, bool big_endian>
class Incremental_inputs_entry_write
{
 public:
  Incremental_inputs_entry_write(unsigned char *p)
    : p_(reinterpret_cast<internal::Incremental_inputs_entry_data*>(p))
  { }

  static const int data_size = sizeof(internal::Incremental_inputs_entry_data);

  void
  put_filename_offset(elfcpp::Elf_Word v)
  { this->p_->filename_offset = Convert<32, big_endian>::convert_host(v); }

  void
  put_data_offset(elfcpp::Elf_Word v)
  { this->p_->data_offset = Convert<32, big_endian>::convert_host(v); }

  void
  put_timestamp_sec(elfcpp::Elf_Xword v)
  { this->p_->timestamp_sec = Convert<64, big_endian>::convert_host(v); }

  void
  put_timestamp_nsec(elfcpp::Elf_Word v)
  { this->p_->timestamp_nsec = Convert<32, big_endian>::convert_host(v); }

  void
  put_input_type(elfcpp::Elf_Word v)
  { this->p_->input_type = Convert<32, big_endian>::convert_host(v); }

  void
  put_reserved(elfcpp::Elf_Word v)
  { this->p_->reserved = Convert<32, big_endian>::convert_host(v); }

 private:
  internal::Incremental_inputs_entry_data* p_;
};

// Inform the user why we don't do an incremental link.  Not called in
// the obvious case of missing output file.  TODO: Is this helpful?

void
vexplain_no_incremental(const char* format, va_list args)
{
  char* buf = NULL;
  if (vasprintf(&buf, format, args) < 0)
    gold_nomem();
  gold_info(_("the link might take longer: "
              "cannot perform incremental link: %s"), buf);
  free(buf);
}

void
explain_no_incremental(const char* format, ...)
{
  va_list args;
  va_start(args, format);
  vexplain_no_incremental(format, args);
  va_end(args);
}

// Report an error.

void
Incremental_binary::error(const char* format, ...) const
{
  va_list args;
  va_start(args, format);
  // Current code only checks if the file can be used for incremental linking,
  // so errors shouldn't fail the build, but only result in a fallback to a
  // full build.
  // TODO: when we implement incremental editing of the file, we may need a
  // flag that will cause errors to be treated seriously.
  vexplain_no_incremental(format, args);
  va_end(args);
}

template<int size, bool big_endian>
bool
Sized_incremental_binary<size, big_endian>::do_find_incremental_inputs_section(
    Location* location,
    unsigned int* strtab_shndx)
{
  unsigned int shndx = this->elf_file_.find_section_by_type(
      elfcpp::SHT_GNU_INCREMENTAL_INPUTS);
  if (shndx == elfcpp::SHN_UNDEF)  // Not found.
    return false;
  *strtab_shndx = this->elf_file_.section_link(shndx);
  *location = this->elf_file_.section_contents(shndx);
  return true;
}

template<int size, bool big_endian>
bool
Sized_incremental_binary<size, big_endian>::do_check_inputs(
    Incremental_inputs* incremental_inputs)
{
  const int entry_size =
      Incremental_inputs_entry_write<size, big_endian>::data_size;
  const int header_size =
      Incremental_inputs_header_write<size, big_endian>::data_size;

  unsigned int strtab_shndx;
  Location location;

  if (!do_find_incremental_inputs_section(&location, &strtab_shndx))
    {
      explain_no_incremental(_("no incremental data from previous build"));
      return false;
    }
  if (location.data_size < header_size
      || strtab_shndx >= this->elf_file_.shnum()
      || this->elf_file_.section_type(strtab_shndx) != elfcpp::SHT_STRTAB)
    {
      explain_no_incremental(_("invalid incremental build data"));
      return false;
    }

  Location strtab_location(this->elf_file_.section_contents(strtab_shndx));
  View data_view(view(location));
  View strtab_view(view(strtab_location));
  elfcpp::Elf_strtab strtab(strtab_view.data(), strtab_location.data_size);
  Incremental_inputs_header<size, big_endian> header(data_view.data());

  if (header.get_version() != INCREMENTAL_LINK_VERSION)
    {
      explain_no_incremental(_("different version of incremental build data"));
      return false;
    }

  const char* command_line;
  // We divide instead of multiplying to make sure there is no integer
  // overflow.
  size_t max_input_entries = (location.data_size - header_size) / entry_size;
  if (header.get_input_file_count() > max_input_entries
      || !strtab.get_c_string(header.get_command_line_offset(), &command_line))
    {
      explain_no_incremental(_("invalid incremental build data"));
      return false;
    }

  if (incremental_inputs->command_line() != command_line)
    {
      explain_no_incremental(_("command line changed"));
      return false;
    }

  // TODO: compare incremental_inputs->inputs() with entries in data_view.
  return true;
}

namespace
{

// Create a Sized_incremental_binary object of the specified size and
// endianness. Fails if the target architecture is not supported.

template<int size, bool big_endian>
Incremental_binary*
make_sized_incremental_binary(Output_file* file,
                              const elfcpp::Ehdr<size, big_endian>& ehdr)
{
  Target* target = select_target(ehdr.get_e_machine(), size, big_endian,
                                 ehdr.get_e_ident()[elfcpp::EI_OSABI],
                                 ehdr.get_e_ident()[elfcpp::EI_ABIVERSION]);
  if (target == NULL)
    {
      explain_no_incremental(_("unsupported ELF machine number %d"),
               ehdr.get_e_machine());
      return NULL;
    }

  return new Sized_incremental_binary<size, big_endian>(file, ehdr, target);
}

}  // End of anonymous namespace.

// Create an Incremental_binary object for FILE. Returns NULL is this is not
// possible, e.g. FILE is not an ELF file or has an unsupported target. FILE
// should be opened.

Incremental_binary*
open_incremental_binary(Output_file* file)
{
  off_t filesize = file->filesize();
  int want = elfcpp::Elf_recognizer::max_header_size;
  if (filesize < want)
    want = filesize;

  const unsigned char* p = file->get_input_view(0, want);
  if (!elfcpp::Elf_recognizer::is_elf_file(p, want))
    {
      explain_no_incremental(_("output is not an ELF file."));
      return NULL;
    }

  int size;
  bool big_endian;
  std::string error;
  if (!elfcpp::Elf_recognizer::is_valid_header(p, want, &size, &big_endian,
                                               &error))
    {
      explain_no_incremental(error.c_str());
      return NULL;
    }

  Incremental_binary* result = NULL;
  if (size == 32)
    {
      if (big_endian)
        {
#ifdef HAVE_TARGET_32_BIG
          result = make_sized_incremental_binary<32, true>(
              file, elfcpp::Ehdr<32, true>(p));
#else
          explain_no_incremental(_("unsupported file: 32-bit, big-endian"));
#endif
        }
      else
        {
#ifdef HAVE_TARGET_32_LITTLE
          result = make_sized_incremental_binary<32, false>(
              file, elfcpp::Ehdr<32, false>(p));
#else
          explain_no_incremental(_("unsupported file: 32-bit, little-endian"));
#endif
        }
    }
  else if (size == 64)
    {
      if (big_endian)
        {
#ifdef HAVE_TARGET_64_BIG
          result = make_sized_incremental_binary<64, true>(
              file, elfcpp::Ehdr<64, true>(p));
#else
          explain_no_incremental(_("unsupported file: 64-bit, big-endian"));
#endif
        }
      else
        {
#ifdef HAVE_TARGET_64_LITTLE
          result = make_sized_incremental_binary<64, false>(
              file, elfcpp::Ehdr<64, false>(p));
#else
          explain_no_incremental(_("unsupported file: 64-bit, little-endian"));
#endif
        }
    }
  else
    gold_unreachable();

  return result;
}

// Analyzes the output file to check if incremental linking is possible and
// (to be done) what files need to be relinked.

bool
Incremental_checker::can_incrementally_link_output_file()
{
  Output_file output(this->output_name_);
  if (!output.open_for_modification())
    return false;
  Incremental_binary* binary = open_incremental_binary(&output);
  if (binary == NULL)
    return false;
  return binary->check_inputs(this->incremental_inputs_);
}

// Add the command line to the string table, setting
// command_line_key_.  In incremental builds, the command line is
// stored in .gnu_incremental_inputs so that the next linker run can
// check if the command line options didn't change.

void
Incremental_inputs::report_command_line(int argc, const char* const* argv)
{
  // Always store 'gold' as argv[0] to avoid a full relink if the user used a
  // different path to the linker.
  std::string args("gold");
  // Copied from collect_argv in main.cc.
  for (int i = 1; i < argc; ++i)
    {
      // Adding/removing these options should result in a full relink.
      if (strcmp(argv[i], "--incremental-changed") == 0
	  || strcmp(argv[i], "--incremental-unchanged") == 0
	  || strcmp(argv[i], "--incremental-unknown") == 0)
        continue;

      args.append(" '");
      // Now append argv[i], but with all single-quotes escaped
      const char* argpos = argv[i];
      while (1)
        {
          const int len = strcspn(argpos, "'");
          args.append(argpos, len);
          if (argpos[len] == '\0')
            break;
          args.append("'\"'\"'");
          argpos += len + 1;
        }
      args.append("'");
    }

  this->command_line_ = args;
  this->strtab_->add(this->command_line_.c_str(), false,
                     &this->command_line_key_);
}

// Record that the input argument INPUT is an achive ARCHIVE.  This is
// called by Read_symbols after finding out the type of the file.

void
Incremental_inputs::report_archive(const Input_argument* input,
                                   Archive* archive)
{
  Hold_lock hl(*this->lock_);

  Input_info info;
  info.type = INCREMENTAL_INPUT_ARCHIVE;
  info.archive = archive;
  info.mtime = archive->file().get_mtime();
  this->inputs_map_.insert(std::make_pair(input, info));
}

// Record that the input argument INPUT is an object OBJ.  This is
// called by Read_symbols after finding out the type of the file.

void
Incremental_inputs::report_object(const Input_argument* input,
                                  Object* obj)
{
  Hold_lock hl(*this->lock_);

  Input_info info;
  info.type = (obj->is_dynamic()
	       ? INCREMENTAL_INPUT_SHARED_LIBRARY
	       : INCREMENTAL_INPUT_OBJECT);
  info.object = obj;
  info.mtime = obj->input_file()->file().get_mtime();
  this->inputs_map_.insert(std::make_pair(input, info));
}

// Record that the input argument INPUT is an script SCRIPT.  This is
// called by read_script after parsing the script and reading the list
// of inputs added by this script.

void
Incremental_inputs::report_script(const Input_argument* input,
                                  Timespec mtime,
                                  Script_info* script)
{
  Hold_lock hl(*this->lock_);

  Input_info info;
  info.type = INCREMENTAL_INPUT_SCRIPT;
  info.script = script;
  info.mtime = mtime;
  this->inputs_map_.insert(std::make_pair(input, info));
}

// Compute indexes in the order in which the inputs should appear in
// .gnu_incremental_inputs.  This needs to be done after all the
// scripts are parsed.  The function is first called for the command
// line inputs arguments and may call itself recursively for e.g. a
// list of elements of a group or a list of inputs added by a script.
// The [BEGIN; END) interval to analyze and *INDEX is the current
// value of the index (that will be updated).

void
Incremental_inputs::finalize_inputs(
    Input_argument_list::const_iterator begin,
    Input_argument_list::const_iterator end,
    unsigned int* index)
{
  for (Input_argument_list::const_iterator p = begin; p != end; ++p)
    {
      if (p->is_group())
        {
          finalize_inputs(p->group()->begin(), p->group()->end(), index);
          continue;
        }

      Inputs_info_map::iterator it = this->inputs_map_.find(&(*p));
      // TODO: turn it into an assert when the code will be more stable.
      if (it == this->inputs_map_.end())
        {
          gold_error("internal error: %s: incremental build info not provided",
		     (p->is_file() ? p->file().name() : "[group]"));
          continue;
        }
      Input_info* info = &it->second;
      info->index = *index;
      (*index)++;
      this->strtab_->add(p->file().name(), false, &info->filename_key);
      if (info->type == INCREMENTAL_INPUT_SCRIPT)
        {
          finalize_inputs(info->script->inputs()->begin(),
                          info->script->inputs()->end(),
                          index);
        }
    }
}

// Finalize the incremental link information.  Called from
// Layout::finalize.

void
Incremental_inputs::finalize()
{
  unsigned int index = 0;
  finalize_inputs(this->inputs_->begin(), this->inputs_->end(), &index);

  // Sanity check.
  for (Inputs_info_map::const_iterator p = this->inputs_map_.begin();
       p != this->inputs_map_.end();
       ++p)
    {
      gold_assert(p->second.filename_key != 0);
    }

  this->strtab_->set_string_offsets();
}

// Create the content of the .gnu_incremental_inputs section.

Output_section_data*
Incremental_inputs::create_incremental_inputs_section_data()
{
  switch (parameters->size_and_endianness())
    {
#ifdef HAVE_TARGET_32_LITTLE
    case Parameters::TARGET_32_LITTLE:
      return this->sized_create_inputs_section_data<32, false>();
#endif
#ifdef HAVE_TARGET_32_BIG
    case Parameters::TARGET_32_BIG:
      return this->sized_create_inputs_section_data<32, true>();
#endif
#ifdef HAVE_TARGET_64_LITTLE
    case Parameters::TARGET_64_LITTLE:
      return this->sized_create_inputs_section_data<64, false>();
#endif
#ifdef HAVE_TARGET_64_BIG
    case Parameters::TARGET_64_BIG:
      return this->sized_create_inputs_section_data<64, true>();
#endif
    default:
      gold_unreachable();
    }
}

// Sized creation of .gnu_incremental_inputs section.

template<int size, bool big_endian>
Output_section_data*
Incremental_inputs::sized_create_inputs_section_data()
{
  const int entry_size =
      Incremental_inputs_entry_write<size, big_endian>::data_size;
  const int header_size =
      Incremental_inputs_header_write<size, big_endian>::data_size;

  unsigned int sz = header_size + entry_size * this->inputs_map_.size();
  unsigned char* buffer = new unsigned char[sz];
  unsigned char* inputs_base = buffer + header_size;

  Incremental_inputs_header_write<size, big_endian> header_writer(buffer);
  gold_assert(this->command_line_key_ > 0);
  int cmd_offset = this->strtab_->get_offset_from_key(this->command_line_key_);

  header_writer.put_version(INCREMENTAL_LINK_VERSION);
  header_writer.put_input_file_count(this->inputs_map_.size());
  header_writer.put_command_line_offset(cmd_offset);
  header_writer.put_reserved(0);

  for (Inputs_info_map::const_iterator it = this->inputs_map_.begin();
       it != this->inputs_map_.end();
       ++it)
    {
      gold_assert(it->second.index < this->inputs_map_.size());

      unsigned char* entry_buffer =
          inputs_base + it->second.index * entry_size;
      Incremental_inputs_entry_write<size, big_endian> entry(entry_buffer);
      int filename_offset =
          this->strtab_->get_offset_from_key(it->second.filename_key);
      entry.put_filename_offset(filename_offset);
      // TODO: add per input data and timestamp.  Currently we store
      // an out-of-bounds offset for future version of gold to reject
      // such an incremental_inputs section.
      entry.put_data_offset(0xffffffff);
      entry.put_timestamp_sec(it->second.mtime.seconds);
      entry.put_timestamp_nsec(it->second.mtime.nanoseconds);
      entry.put_input_type(it->second.type);
      entry.put_reserved(0);
    }

  return new Output_data_const_buffer(buffer, sz, 8,
				      "** incremental link inputs list");
}

// Instantiate the templates we need.

#ifdef HAVE_TARGET_32_LITTLE
template
class Sized_incremental_binary<32, false>;
#endif

#ifdef HAVE_TARGET_32_BIG
template
class Sized_incremental_binary<32, true>;
#endif

#ifdef HAVE_TARGET_64_LITTLE
template
class Sized_incremental_binary<64, false>;
#endif

#ifdef HAVE_TARGET_64_BIG
template
class Sized_incremental_binary<64, true>;
#endif

} // End namespace gold.
