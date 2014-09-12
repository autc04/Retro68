// dwp.cc -- DWARF packaging utility

// Copyright 2012 Free Software Foundation, Inc.
// Written by Cary Coutant <ccoutant@google.com>.

// This file is part of dwp, the DWARF packaging utility.

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

#include "dwp.h"

#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>

#include <vector>
#include <algorithm>

#include "getopt.h"
#include "libiberty.h"
#include "../bfd/bfdver.h"

#include "elfcpp.h"
#include "elfcpp_file.h"
#include "dirsearch.h"
#include "fileread.h"
#include "object.h"
#include "compressed_output.h"
#include "stringpool.h"
#include "dwarf_reader.h"

static void
usage(FILE* fd, int) ATTRIBUTE_NORETURN;

static void
print_version() ATTRIBUTE_NORETURN;

namespace gold {

class Dwp_output_file;

template <int size, bool big_endian>
class Sized_relobj_dwo;

// List of .dwo files to process.
typedef std::vector<std::string> File_list;

// An input file.
// This class may represent a .dwo file, a .dwp file
// produced by an earlier run, or an executable file whose
// debug section identifies a set of .dwo files to read.

class Dwo_file
{
 public:
  Dwo_file(const char* name)
    : name_(name), obj_(NULL), input_file_(NULL), is_compressed_(),
      str_offset_map_()
  { }

  ~Dwo_file();

  // Read the input executable file and extract the list of .dwo files
  // that it references.
  void
  read_executable(File_list* files);

  // Read the input file and send its contents to OUTPUT_FILE.
  void
  read(Dwp_output_file* output_file);

 private:
  // Types for mapping input string offsets to output string offsets.
  typedef std::pair<section_offset_type, section_offset_type>
      Str_offset_map_entry;
  typedef std::vector<Str_offset_map_entry> Str_offset_map;

  // A less-than comparison routine for Str_offset_map.
  struct Offset_compare
  {
    bool
    operator()(const Str_offset_map_entry& i1,
	       const Str_offset_map_entry& i2) const
    { return i1.first < i2.first; }
  };

  // Create a Sized_relobj_dwo of the given size and endianness,
  // and record the target info.  P is a pointer to the ELF header
  // in memory.
  Relobj*
  make_object(Dwp_output_file* output_file);

  template <int size, bool big_endian>
  Relobj*
  sized_make_object(const unsigned char* p, Input_file* input_file,
		    Dwp_output_file* output_file);

  // Return the number of sections in the input object file.
  unsigned int
  shnum() const
  { return this->obj_->shnum(); }

  // Return section type.
  unsigned int
  section_type(unsigned int shndx)
  { return this->obj_->section_type(shndx); }

  // Get the name of a section.
  std::string
  section_name(unsigned int shndx)
  { return this->obj_->section_name(shndx); }

  // Return a view of the contents of a section, decompressed if necessary.
  // Set *PLEN to the size.  Set *IS_NEW to true if the contents need to be
  // deleted by the caller.
  const unsigned char*
  section_contents(unsigned int shndx, section_size_type* plen, bool* is_new)
  { return this->obj_->decompressed_section_contents(shndx, plen, is_new); }

  // Read the .debug_cu_index section of a .dwp file,
  // and process the CU sets.
  void
  read_compunit_index(unsigned int, Dwp_output_file*);

  template <bool big_endian>
  void
  sized_read_compunit_index(unsigned int, Dwp_output_file*);

  // Read the .debug_tu_index section of a .dwp file,
  // and process the TU sets.
  void
  read_typeunit_index(unsigned int, Dwp_output_file*);

  template <bool big_endian>
  void
  sized_read_typeunit_index(unsigned int, Dwp_output_file*);

  // Merge the input string table section into the output file.
  void
  add_strings(Dwp_output_file*, unsigned int);

  // Copy a section from the input file to the output file.
  unsigned int
  copy_section(Dwp_output_file* output_file, unsigned int shndx,
	       const char* section_name, bool is_str_offsets);

  // Remap the string offsets in the .debug_str_offsets.dwo section.
  const unsigned char*
  remap_str_offsets(const unsigned char* contents, section_size_type len);

  template <bool big_endian>
  const unsigned char*
  sized_remap_str_offsets(const unsigned char* contents, section_size_type len);

  // Remap a single string offsets from an offset in the input string table
  // to an offset in the output string table.
  unsigned int
  remap_str_offset(section_offset_type val);

  // Add a set of .debug_info and related sections to OUTPUT_FILE.
  void
  add_cu_set(Dwp_output_file* output_file,
	     uint64_t dwo_id,
	     unsigned int debug_info,
	     unsigned int debug_abbrev,
	     unsigned int debug_line,
	     unsigned int debug_loc,
	     unsigned int debug_str_offsets,
	     unsigned int debug_macinfo,
	     unsigned int debug_macro);

  // Add a set of .debug_types and related sections to OUTPUT_FILE.
  void
  add_tu_set(Dwp_output_file* output_file,
	     uint64_t type_sig,
	     unsigned int debug_types,
	     unsigned int debug_abbrev,
	     unsigned int debug_line,
	     unsigned int debug_str_offsets);

  // The filename.
  const char* name_;
  // The ELF file, represented as a gold Relobj instance.
  Relobj* obj_;
  // The Input_file object.
  Input_file* input_file_;
  // Flags indicating which sections are compressed.
  std::vector<bool> is_compressed_;
  // Map input section index onto output section index.
  std::vector<unsigned int> shndx_map_;
  // Map input string offsets to output string offsets.
  Str_offset_map str_offset_map_;
};

// An ELF input file.
// We derive from Sized_relobj so that we can use interfaces
// in libgold to access the file.

template <int size, bool big_endian>
class Sized_relobj_dwo : public Sized_relobj<size, big_endian>
{
 public:
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Address;
  typedef typename Sized_relobj<size, big_endian>::Symbols Symbols;

  Sized_relobj_dwo(const char* name, Input_file* input_file,
		   const elfcpp::Ehdr<size, big_endian>& ehdr)
    : Sized_relobj<size, big_endian>(name, input_file),
      elf_file_(this, ehdr)
  { }

  ~Sized_relobj_dwo()
  { }

  // Setup the section information.
  void
  setup();

 protected:
  // Return section type.
  unsigned int
  do_section_type(unsigned int shndx)
  { return this->elf_file_.section_type(shndx); }

  // Get the name of a section.
  std::string
  do_section_name(unsigned int shndx)
  { return this->elf_file_.section_name(shndx); }

  // Get the size of a section.
  uint64_t
  do_section_size(unsigned int shndx)
  { return this->elf_file_.section_size(shndx); }

  // Return a view of the contents of a section.
  const unsigned char*
  do_section_contents(unsigned int, section_size_type*, bool);

  // Return a view of the uncompressed contents of a section.  Set *PLEN
  // to the size.  Set *IS_NEW to true if the contents need to be deleted
  // by the caller.
  const unsigned char*
  do_decompressed_section_contents(unsigned int shndx,
				   section_size_type* plen,
				   bool* is_new);

  // The following virtual functions are abstract in the base classes,
  // but are not used here.

  // Read the symbols.
  void
  do_read_symbols(Read_symbols_data*)
  { gold_unreachable(); }

  // Lay out the input sections.
  void
  do_layout(Symbol_table*, Layout*, Read_symbols_data*)
  { gold_unreachable(); }

  // Layout sections whose layout was deferred while waiting for
  // input files from a plugin.
  void
  do_layout_deferred_sections(Layout*)
  { gold_unreachable(); }

  // Add the symbols to the symbol table.
  void
  do_add_symbols(Symbol_table*, Read_symbols_data*, Layout*)
  { gold_unreachable(); }

  Archive::Should_include
  do_should_include_member(Symbol_table*, Layout*, Read_symbols_data*,
                           std::string*)
  { gold_unreachable(); }

  // Iterate over global symbols, calling a visitor class V for each.
  void
  do_for_all_global_symbols(Read_symbols_data*,
			    Library_base::Symbol_visitor_base*)
  { gold_unreachable(); }

  // Return section flags.
  uint64_t
  do_section_flags(unsigned int)
  { gold_unreachable(); }

  // Return section entsize.
  uint64_t
  do_section_entsize(unsigned int)
  { gold_unreachable(); }

  // Return section address.
  uint64_t
  do_section_address(unsigned int)
  { gold_unreachable(); }

  // Return the section link field.
  unsigned int
  do_section_link(unsigned int)
  { gold_unreachable(); }

  // Return the section link field.
  unsigned int
  do_section_info(unsigned int)
  { gold_unreachable(); }

  // Return the section alignment.
  uint64_t
  do_section_addralign(unsigned int)
  { gold_unreachable(); }

  // Return the Xindex structure to use.
  Xindex*
  do_initialize_xindex()
  { gold_unreachable(); }

  // Get symbol counts.
  void
  do_get_global_symbol_counts(const Symbol_table*, size_t*, size_t*) const
  { gold_unreachable(); }

  // Get global symbols.
  const Symbols*
  do_get_global_symbols() const
  { return NULL; }

  // Return the value of a local symbol.
  uint64_t
  do_local_symbol_value(unsigned int, uint64_t) const
  { gold_unreachable(); }

  unsigned int
  do_local_plt_offset(unsigned int) const
  { gold_unreachable(); }

  // Return whether local symbol SYMNDX is a TLS symbol.
  bool
  do_local_is_tls(unsigned int) const
  { gold_unreachable(); }

  // Return the number of local symbols.
  unsigned int
  do_local_symbol_count() const
  { gold_unreachable(); }

  // Return the number of local symbols in the output symbol table.
  unsigned int
  do_output_local_symbol_count() const
  { gold_unreachable(); }

  // Return the file offset for local symbols in the output symbol table.
  off_t
  do_local_symbol_offset() const
  { gold_unreachable(); }

  // Read the relocs.
  void
  do_read_relocs(Read_relocs_data*)
  { gold_unreachable(); }

  // Process the relocs to find list of referenced sections. Used only
  // during garbage collection.
  void
  do_gc_process_relocs(Symbol_table*, Layout*, Read_relocs_data*)
  { gold_unreachable(); }

  // Scan the relocs and adjust the symbol table.
  void
  do_scan_relocs(Symbol_table*, Layout*, Read_relocs_data*)
  { gold_unreachable(); }

  // Count the local symbols.
  void
  do_count_local_symbols(Stringpool_template<char>*,
			 Stringpool_template<char>*)
  { gold_unreachable(); }

  // Finalize the local symbols.
  unsigned int
  do_finalize_local_symbols(unsigned int, off_t, Symbol_table*)
  { gold_unreachable(); }

  // Set the offset where local dynamic symbol information will be stored.
  unsigned int
  do_set_local_dynsym_indexes(unsigned int)
  { gold_unreachable(); }

  // Set the offset where local dynamic symbol information will be stored.
  unsigned int
  do_set_local_dynsym_offset(off_t)
  { gold_unreachable(); }

  // Relocate the input sections and write out the local symbols.
  void
  do_relocate(const Symbol_table*, const Layout*, Output_file*)
  { gold_unreachable(); }

 private:
  // General access to the ELF file.
  elfcpp::Elf_file<size, big_endian, Object> elf_file_;
};

// The output file.
// This class is responsible for collecting the debug index information
// and writing the .dwp file in ELF format.

class Dwp_output_file
{
 public:
  Dwp_output_file(const char* name)
    : name_(name), machine_(0), size_(0), big_endian_(false), osabi_(0),
      abiversion_(0), fd_(NULL), next_file_offset_(0), shnum_(1), sections_(),
      shoff_(0), shstrndx_(0), have_strings_(false), stringpool_(),
      shstrtab_(), cu_index_(), tu_index_(), last_type_sig_(0),
      last_tu_slot_(0)
  {
    this->stringpool_.set_no_zero_null();
  }

  // Record the target info from an input file.
  void
  record_target_info(const char* name, int machine, int size, bool big_endian,
		     int osabi, int abiversion);

  // Add a string to the debug strings section.
  section_offset_type
  add_string(const char* str, size_t len);

  // Add a section to the output file, and return the new section index.
  unsigned int
  add_section(const char* section_name, const unsigned char* contents,
	      section_size_type len, int align);

  // Add a set of .debug_info and related sections to the output file.
  void
  add_cu_set(uint64_t dwo_id, unsigned int debug_info,
	     unsigned int debug_abbrev, unsigned int debug_line,
	     unsigned int debug_loc, unsigned int debug_str_offsets,
	     unsigned int debug_macinfo, unsigned int debug_macro);

  // Lookup a type signature and return TRUE if we have already seen it.
  bool
  lookup_tu(uint64_t type_sig);

  // Add a set of .debug_types and related sections to the output file.
  void
  add_tu_set(uint64_t type_sig, unsigned int debug_types,
	     unsigned int debug_abbrev, unsigned int debug_line,
	     unsigned int debug_str_offsets);

  // Finalize the file, write the string tables and index sections,
  // and close the file.
  void
  finalize();

 private:
  // Sections in the output file.
  struct Section
  {
    const char* name;
    off_t offset;
    section_size_type size;
    int align;
  };

  // A set of sections for a compilation unit or type unit.
  struct Cu_or_tu_set
  {
    uint64_t signature;
    unsigned int debug_info_or_types;
    unsigned int debug_abbrev;
    unsigned int debug_line;
    unsigned int debug_loc;
    unsigned int debug_str_offsets;
    unsigned int debug_macinfo;
    unsigned int debug_macro;
  };

  // The index sections defined by the DWARF Package File Format spec.
  class Dwp_index
  {
   public:
    // Vector for the section index pool.
    typedef std::vector<unsigned int> Shndx_pool;

    Dwp_index()
      : capacity_(0), used_(0), hash_table_(NULL), shndx_pool_()
    { }

    ~Dwp_index()
    { }

    // Find a slot in the hash table for SIGNATURE.  Return TRUE
    // if the entry already exists.
    bool
    find_or_add(uint64_t signature, unsigned int* slotp);

    // Enter a CU or TU set at the given SLOT in the hash table.
    void
    enter_set(unsigned int slot, const Cu_or_tu_set& set);

    // Return the contents of the given SLOT in the hash table of signatures.
    uint64_t
    hash_table(unsigned int slot) const
    { return this->hash_table_[slot]; }

    // Return the contents of the given SLOT in the parallel table of
    // shndx pool indexes.
    uint32_t
    index_table(unsigned int slot) const
    { return this->index_table_[slot]; }

    // Return the total number of slots in the hash table.
    unsigned int
    hash_table_total_slots() const
    { return this->capacity_; }

    // Return the number of used slots in the hash table.
    unsigned int
    hash_table_used_slots() const
    { return this->used_; }

    // Return an iterator into the shndx pool.
    Shndx_pool::const_iterator
    shndx_pool() const
    { return this->shndx_pool_.begin(); }

    Shndx_pool::const_iterator
    shndx_pool_end() const
    { return this->shndx_pool_.end(); }

    // Return the number of entries in the shndx pool.
    unsigned int
    shndx_pool_size() const
    { return this->shndx_pool_.size(); }

   private:
    // Initialize the hash table.
    void
    initialize();

    // Grow the hash table when we reach 2/3 capacity.
    void
    grow();

    // The number of slots in the table, a power of 2 such that
    // capacity > 3 * size / 2.
    unsigned int capacity_;
    // The current number of used slots in the hash table.
    unsigned int used_;
    // The storage for the hash table of signatures.
    uint64_t* hash_table_;
    // The storage for the parallel table of shndx pool indexes.
    uint32_t* index_table_;
    // The pool of section indexes.
    Shndx_pool shndx_pool_;
  };  // End class Dwp_output_file::Dwp_index.

  // Initialize the output file.
  void
  initialize();

  // Write the ELF header.
  void
  write_ehdr();

  template<unsigned int size, bool big_endian>
  void
  sized_write_ehdr();

  // Write a section header.
  void
  write_shdr(const char* name, unsigned int type, unsigned int flags,
	     uint64_t addr, off_t offset, section_size_type sect_size,
	     unsigned int link, unsigned int info,
	     unsigned int align, unsigned int ent_size);

  template<unsigned int size, bool big_endian>
  void
  sized_write_shdr(const char* name, unsigned int type, unsigned int flags,
		   uint64_t addr, off_t offset, section_size_type sect_size,
		   unsigned int link, unsigned int info,
		   unsigned int align, unsigned int ent_size);

  // Write a CU or TU index section.
  template<bool big_endian>
  void
  write_index(const char* sect_name, const Dwp_index& index);

  // The output filename.
  const char* name_;
  // ELF header parameters.
  int machine_;
  int size_;
  int big_endian_;
  int osabi_;
  int abiversion_;
  // The output file descriptor.
  FILE* fd_;
  // Next available file offset.
  off_t next_file_offset_;
  // The number of sections.
  unsigned int shnum_;
  // Section table. The first entry is shndx 1.
  std::vector<Section> sections_;
  // File offset of the section header table.
  off_t shoff_;
  // Section index of the section string table.
  unsigned int shstrndx_;
  // TRUE if we have added any strings to the string pool.
  bool have_strings_;
  // String pool for the output .debug_str.dwo section.
  Stringpool stringpool_;
  // String pool for the .shstrtab section.
  Stringpool shstrtab_;
  // The compilation unit index.
  Dwp_index cu_index_;
  // The type unit index.
  Dwp_index tu_index_;
  // Cache of the last type signature looked up.
  uint64_t last_type_sig_;
  // Cache of the slot index for the last type signature.
  unsigned int last_tu_slot_;
};

// A specialization of Dwarf_info_reader, for reading dwo_names from
// DWARF CUs.

class Dwo_name_info_reader : public Dwarf_info_reader
{
 public:
  Dwo_name_info_reader(Relobj* object, unsigned int shndx)
    : Dwarf_info_reader(false, object, NULL, 0, shndx, 0, 0),
      files_(NULL)
  { }

  ~Dwo_name_info_reader()
  { }

  // Get the dwo_names from the DWARF compilation unit DIEs.
  void
  get_dwo_names(File_list* files)
  { 
    this->files_ = files;
    this->parse();
  }

 protected:
  // Visit a compilation unit.
  virtual void
  visit_compilation_unit(off_t cu_offset, off_t cu_length, Dwarf_die*);

 private:
  // The list of files to populate.
  File_list* files_;
};

// A specialization of Dwarf_info_reader, for reading dwo_ids and
// type signatures from DWARF CUs and TUs.

class Dwo_id_info_reader : public Dwarf_info_reader
{
 public:
  Dwo_id_info_reader(bool is_type_unit,
		     Relobj* object,
		     unsigned int shndx)
    : Dwarf_info_reader(is_type_unit, object, NULL, 0, shndx, 0, 0),
      dwo_id_found_(false), dwo_id_(0), type_sig_found_(false), type_sig_(0)
  { }

  ~Dwo_id_info_reader()
  { }

  // Return the dwo_id from a DWARF compilation unit DIE in *DWO_ID.
  bool
  get_dwo_id(uint64_t* dwo_id)
  {
    this->parse();
    if (!this->dwo_id_found_)
      return false;
    *dwo_id = this->dwo_id_;
    return true;
  }

  // Return the type signature from a DWARF type unit DIE in *TYPE_SIG.
  bool
  get_type_sig(uint64_t* type_sig)
  {
    this->parse();
    if (!this->type_sig_found_)
      return false;
    *type_sig = this->type_sig_;
    return true;
  }

 protected:
  // Visit a compilation unit.
  virtual void
  visit_compilation_unit(off_t cu_offset, off_t cu_length, Dwarf_die*);

  // Visit a type unit.
  virtual void
  visit_type_unit(off_t tu_offset, off_t type_offset, uint64_t signature,
		  Dwarf_die*);

 private:
  // TRUE if we found a dwo_id.
  bool dwo_id_found_;
  // The dwo_id.
  uint64_t dwo_id_;
  // TRUE if we found a type signature.
  bool type_sig_found_;
  // The type signature.
  uint64_t type_sig_;
};

// Class Sized_relobj_dwo.

// Setup the section information.

template <int size, bool big_endian>
void
Sized_relobj_dwo<size, big_endian>::setup()
{
  const unsigned int shnum = this->elf_file_.shnum();
  this->set_shnum(shnum);
  this->section_offsets().resize(shnum);
}

// Return a view of the contents of a section.

template <int size, bool big_endian>
const unsigned char*
Sized_relobj_dwo<size, big_endian>::do_section_contents(
    unsigned int shndx,
    section_size_type* plen,
    bool cache)
{
  Object::Location loc(this->elf_file_.section_contents(shndx));
  *plen = convert_to_section_size_type(loc.data_size);
  if (*plen == 0)
    {
      static const unsigned char empty[1] = { '\0' };
      return empty;
    }
  return this->get_view(loc.file_offset, *plen, true, cache);
}

// Return a view of the uncompressed contents of a section.  Set *PLEN
// to the size.  Set *IS_NEW to true if the contents need to be deleted
// by the caller.

template <int size, bool big_endian>
const unsigned char*
Sized_relobj_dwo<size, big_endian>::do_decompressed_section_contents(
    unsigned int shndx,
    section_size_type* plen,
    bool* is_new)
{
  section_size_type buffer_size;
  const unsigned char* buffer = this->do_section_contents(shndx, &buffer_size,
							  false);

  std::string sect_name = this->do_section_name(shndx);
  if (!is_prefix_of(".zdebug_", sect_name.c_str()))
    {
      *plen = buffer_size;
      *is_new = false;
      return buffer;
    }

  section_size_type uncompressed_size = get_uncompressed_size(buffer,
							      buffer_size);
  unsigned char* uncompressed_data = new unsigned char[uncompressed_size];
  if (!decompress_input_section(buffer,
				buffer_size,
				uncompressed_data,
				uncompressed_size))
    this->error(_("could not decompress section %s"),
		this->section_name(shndx).c_str());
  *plen = uncompressed_size;
  *is_new = true;
  return uncompressed_data;
}

// Class Dwo_file.

Dwo_file::~Dwo_file()
{
  if (this->obj_ != NULL)
    delete this->obj_;
  if (this->input_file_ != NULL)
    delete this->input_file_;
}

// Read the input executable file and extract the list of .dwo files
// that it references.

void
Dwo_file::read_executable(File_list* files)
{
  this->obj_ = this->make_object(NULL);

  unsigned int shnum = this->shnum();
  this->is_compressed_.resize(shnum);
  this->shndx_map_.resize(shnum);

  unsigned int debug_info = 0;
  unsigned int debug_abbrev = 0;

  // Scan the section table and collect the debug sections we need.
  // (Section index 0 is a dummy section; skip it.)
  for (unsigned int i = 1; i < shnum; i++)
    {
      if (this->section_type(i) != elfcpp::SHT_PROGBITS)
	continue;
      std::string sect_name = this->section_name(i);
      const char* suffix = sect_name.c_str();
      if (is_prefix_of(".debug_", suffix))
	suffix += 7;
      else if (is_prefix_of(".zdebug_", suffix))
	{
	  this->is_compressed_[i] = true;
	  suffix += 8;
	}
      else
	continue;
      if (strcmp(suffix, "info") == 0)
	debug_info = i;
      else if (strcmp(suffix, "abbrev") == 0)
	debug_abbrev = i;
    }

  if (debug_info > 0)
    {
      Dwo_name_info_reader dwarf_reader(this->obj_, debug_info);
      dwarf_reader.set_abbrev_shndx(debug_abbrev);
      dwarf_reader.get_dwo_names(files);
    }
}

// Read the input file and send its contents to OUTPUT_FILE.

void
Dwo_file::read(Dwp_output_file* output_file)
{
  this->obj_ = this->make_object(output_file);

  unsigned int shnum = this->shnum();
  this->is_compressed_.resize(shnum);
  this->shndx_map_.resize(shnum);

  typedef std::vector<unsigned int> Types_list;
  Types_list debug_types;
  unsigned int debug_info = 0;
  unsigned int debug_abbrev = 0;
  unsigned int debug_line = 0;
  unsigned int debug_loc = 0;
  unsigned int debug_str = 0;
  unsigned int debug_str_offsets = 0;
  unsigned int debug_macinfo = 0;
  unsigned int debug_macro = 0;
  unsigned int debug_cu_index = 0;
  unsigned int debug_tu_index = 0;

  // Scan the section table and look for .dwp index sections.
  // (Section index 0 is a dummy section; skip it.)
  for (unsigned int i = 1; i < shnum; i++)
    {
      if (this->section_type(i) != elfcpp::SHT_PROGBITS)
	continue;
      std::string sect_name = this->section_name(i);
      const char* suffix = sect_name.c_str();
      if (is_prefix_of(".debug_", suffix))
	suffix += 7;
      else if (is_prefix_of(".zdebug_", suffix))
	{
	  this->is_compressed_[i] = true;
	  suffix += 8;
	}
      else
	continue;
      if (strcmp(suffix, "cu_index") == 0)
	debug_cu_index = i;
      else if (strcmp(suffix, "tu_index") == 0)
	debug_tu_index = i;
      else if (strcmp(suffix, "str.dwo") == 0)
	debug_str = i;
    }

  // Merge the input string table into the output string table.
  this->add_strings(output_file, debug_str);

  // If we found any .dwp index sections, read those and add the section
  // sets to the output file.
  if (debug_cu_index > 0 || debug_tu_index > 0)
    {
      if (debug_cu_index > 0)
	this->read_compunit_index(debug_cu_index, output_file);
      if (debug_tu_index > 0)
	this->read_typeunit_index(debug_tu_index, output_file);
      return;
    }

  // If we found no index sections, this is a .dwo file.
  // Scan the section table and collect the debug sections.
  for (unsigned int i = 1; i < shnum; i++)
    {
      if (this->section_type(i) != elfcpp::SHT_PROGBITS)
	continue;
      std::string sect_name = this->section_name(i);
      const char* suffix = sect_name.c_str();
      if (is_prefix_of(".debug_", suffix))
	suffix += 7;
      else if (is_prefix_of(".zdebug_", suffix))
	suffix += 8;
      else
	continue;
      // TODO: Check for one of each section (except .debug_types).
      if (strcmp(suffix, "info.dwo") == 0)
	debug_info = i;
      else if (strcmp(suffix, "types.dwo") == 0)
	debug_types.push_back(i);
      else if (strcmp(suffix, "abbrev.dwo") == 0)
	debug_abbrev = i;
      else if (strcmp(suffix, "line.dwo") == 0)
	debug_line = i;
      else if (strcmp(suffix, "loc.dwo") == 0)
	debug_loc = i;
      else if (strcmp(suffix, "str_offsets.dwo") == 0)
	debug_str_offsets = i;
      else if (strcmp(suffix, "macinfo.dwo") == 0)
	debug_macinfo = i;
      else if (strcmp(suffix, "macro.dwo") == 0)
	debug_macro = i;
    }

  if (debug_info > 0)
    {
      // Extract the dwo_id from .debug_info.dwo section.
      uint64_t dwo_id;
      Dwo_id_info_reader dwarf_reader(false, this->obj_, debug_info);
      dwarf_reader.set_abbrev_shndx(debug_abbrev);
      if (!dwarf_reader.get_dwo_id(&dwo_id))
	gold_fatal(_("%s: .debug_info.dwo section does not have DW_AT_GNU_dwo_id "
		     "attribute"), this->name_);
      this->add_cu_set(output_file, dwo_id, debug_info, debug_abbrev,
		       debug_line, debug_loc, debug_str_offsets,
		       debug_macinfo, debug_macro);
    }

  for (Types_list::const_iterator tp = debug_types.begin();
       tp != debug_types.end();
       ++tp)
    {
      // Extract the type signature from .debug_types.dwo section.
      uint64_t type_sig;
      gold_assert(*tp > 0);
      Dwo_id_info_reader dwarf_reader(true, this->obj_, *tp);
      dwarf_reader.set_abbrev_shndx(debug_abbrev);
      if (!dwarf_reader.get_type_sig(&type_sig))
	gold_fatal(_("%s: .debug_types.dwo section does not have type signature"),
		   this->name_);
      this->add_tu_set(output_file, type_sig, *tp, debug_abbrev, debug_line,
		       debug_str_offsets);
    }
}

// Create a Sized_relobj_dwo of the given size and endianness,
// and record the target info.

Relobj*
Dwo_file::make_object(Dwp_output_file* output_file)
{
  // Open the input file.
  Input_file* input_file = new Input_file(this->name_);
  this->input_file_ = input_file;
  Dirsearch dirpath;
  int index;
  if (!input_file->open(dirpath, NULL, &index))
    gold_fatal(_("%s: can't open"), this->name_);
  
  // Check that it's an ELF file.
  off_t filesize = input_file->file().filesize();
  int hdrsize = elfcpp::Elf_recognizer::max_header_size;
  if (filesize < hdrsize)
    hdrsize = filesize;
  const unsigned char* elf_header =
      input_file->file().get_view(0, 0, hdrsize, true, false);
  if (!elfcpp::Elf_recognizer::is_elf_file(elf_header, hdrsize))
    gold_fatal(_("%s: not an ELF object file"), this->name_);
  
  // Get the size, endianness, machine, etc. info from the header,
  // make an appropriately-sized Relobj, and pass the target info
  // to the output object.
  int size;
  bool big_endian;
  std::string error;
  if (!elfcpp::Elf_recognizer::is_valid_header(elf_header, hdrsize, &size,
					       &big_endian, &error))
    gold_fatal(_("%s: %s"), this->name_, error.c_str());

  if (size == 32)
    {
      if (big_endian)
#ifdef HAVE_TARGET_32_BIG
	return this->sized_make_object<32, true>(elf_header, input_file,
						 output_file);
#else
	gold_unreachable();
#endif
      else
#ifdef HAVE_TARGET_32_LITTLE
	return this->sized_make_object<32, false>(elf_header, input_file,
						  output_file);
#else
	gold_unreachable();
#endif
    }
  else if (size == 64)
    {
      if (big_endian)
#ifdef HAVE_TARGET_64_BIG
	return this->sized_make_object<64, true>(elf_header, input_file,
						 output_file);
#else
	gold_unreachable();
#endif
      else
#ifdef HAVE_TARGET_64_LITTLE
	return this->sized_make_object<64, false>(elf_header, input_file,
						  output_file);
#else
	gold_unreachable();
#endif
    }
  else
    gold_unreachable();
}

// Function template to create a Sized_relobj_dwo and record the target info.
// P is a pointer to the ELF header in memory.

template <int size, bool big_endian>
Relobj*
Dwo_file::sized_make_object(const unsigned char* p, Input_file* input_file,
			    Dwp_output_file* output_file)
{
  elfcpp::Ehdr<size, big_endian> ehdr(p);
  Sized_relobj_dwo<size, big_endian>* obj =
      new Sized_relobj_dwo<size, big_endian>(this->name_, input_file, ehdr);
  obj->setup();
  if (output_file != NULL)
    output_file->record_target_info(
	this->name_, ehdr.get_e_machine(), size, big_endian,
	ehdr.get_e_ident()[elfcpp::EI_OSABI],
	ehdr.get_e_ident()[elfcpp::EI_ABIVERSION]);
  return obj;
}

// Read the .debug_cu_index section of a .dwp file,
// and process the CU sets.

void
Dwo_file::read_compunit_index(unsigned int shndx, Dwp_output_file* output_file)
{
  if (this->obj_->is_big_endian())
    this->sized_read_compunit_index<true>(shndx, output_file);
  else
    this->sized_read_compunit_index<false>(shndx, output_file);
}

template <bool big_endian>
void
Dwo_file::sized_read_compunit_index(unsigned int shndx,
				    Dwp_output_file* output_file)
{
  section_size_type len;
  bool is_new;
  const unsigned char* contents = this->section_contents(shndx, &len, &is_new);

  unsigned int version =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents);
  if (version != 1)
    gold_fatal(_("%s: .debug_cu_index has unsupported version number %d"),
	       this->name_, version);

  unsigned int nused =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents
						      + 2 * sizeof(uint32_t));
  if (nused == 0)
    return;

  unsigned int nslots =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents
						      + 3 * sizeof(uint32_t));

  const unsigned char* phash = contents + 4 * sizeof(uint32_t);
  const unsigned char* pindex = phash + nslots * sizeof(uint64_t);
  const unsigned char* shndx_pool = pindex + nslots * sizeof(uint32_t);
  const unsigned char* limit = contents + len;

  if (shndx_pool >= limit)
    gold_fatal(_("%s: .debug_cu_index is corrupt"), this->name_);

  // Loop over the slots of the hash table.
  for (unsigned int i = 0; i < nslots; ++i)
    {
      uint64_t dwo_id =
          elfcpp::Swap_unaligned<64, big_endian>::readval(phash);
      if (dwo_id != 0)
	{
	  unsigned int index =
	      elfcpp::Swap_unaligned<32, big_endian>::readval(pindex);
	  const unsigned char* shndx_list =
	      shndx_pool + index * sizeof(uint32_t);

	  // Collect the debug sections for this compilation unit set.
	  unsigned int debug_info = 0;
	  unsigned int debug_abbrev = 0;
	  unsigned int debug_line = 0;
	  unsigned int debug_loc = 0;
	  unsigned int debug_str_offsets = 0;
	  unsigned int debug_macinfo = 0;
	  unsigned int debug_macro = 0;
	  for (;;)
	    {
	      if (shndx_list >= limit)
		gold_fatal(_("%s: .debug_cu_index is corrupt"),
			   this->name_);
	      unsigned int shndx =
		  elfcpp::Swap_unaligned<32, big_endian>::readval(shndx_list);
	      if (shndx == 0)
	        break;
	      if (shndx > this->shnum())
		gold_fatal(_("%s: .debug_cu_index has bad shndx"),
			   this->name_);
	      std::string sect_name = this->section_name(shndx);
	      const char* suffix = sect_name.c_str();
	      if (is_prefix_of(".debug_", suffix))
		suffix += 7;
	      else if (is_prefix_of(".zdebug_", suffix))
		suffix += 8;
	      else
		gold_fatal(_("%s: .debug_cu_index refers to "
			     "non-debug section"), this->name_);
	      if (strcmp(suffix, "info.dwo") == 0)
		debug_info = shndx;
	      else if (strcmp(suffix, "abbrev.dwo") == 0)
		debug_abbrev = shndx;
	      else if (strcmp(suffix, "line.dwo") == 0)
		debug_line = shndx;
	      else if (strcmp(suffix, "loc.dwo") == 0)
		debug_loc = shndx;
	      else if (strcmp(suffix, "str_offsets.dwo") == 0)
		debug_str_offsets = shndx;
	      else if (strcmp(suffix, "macinfo.dwo") == 0)
		debug_macinfo = shndx;
	      else if (strcmp(suffix, "macro.dwo") == 0)
		debug_macro = shndx;
	      shndx_list += sizeof(uint32_t);
	    }
	  this->add_cu_set(output_file, dwo_id, debug_info, debug_abbrev,
			   debug_line, debug_loc, debug_str_offsets,
			   debug_macinfo, debug_macro);
	}
      phash += sizeof(uint64_t);
      pindex += sizeof(uint32_t);
    }

  if (is_new)
    delete[] contents;
}

// Read the .debug_tu_index section of a .dwp file,
// and process the TU sets.

void
Dwo_file::read_typeunit_index(unsigned int shndx, Dwp_output_file* output_file)
{
  if (this->obj_->is_big_endian())
    this->sized_read_typeunit_index<true>(shndx, output_file);
  else
    this->sized_read_typeunit_index<false>(shndx, output_file);
}

template <bool big_endian>
void
Dwo_file::sized_read_typeunit_index(unsigned int shndx,
				    Dwp_output_file* output_file)
{
  section_size_type len;
  bool is_new;
  const unsigned char* contents = this->section_contents(shndx, &len, &is_new);

  unsigned int version =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents);
  if (version != 1)
    gold_fatal(_("%s: .debug_tu_index has unsupported version number %d"),
	       this->name_, version);

  unsigned int nused =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents
						      + 2 * sizeof(uint32_t));
  if (nused == 0)
    return;

  unsigned int nslots =
      elfcpp::Swap_unaligned<32, big_endian>::readval(contents
						      + 3 * sizeof(uint32_t));

  const unsigned char* phash = contents + 4 * sizeof(uint32_t);
  const unsigned char* pindex = phash + nslots * sizeof(uint64_t);
  const unsigned char* shndx_pool = pindex + nslots * sizeof(uint32_t);
  const unsigned char* limit = contents + len;

  if (shndx_pool >= limit)
    gold_fatal(_("%s: .debug_tu_index is corrupt"), this->name_);

  // Loop over the slots of the hash table.
  for (unsigned int i = 0; i < nslots; ++i)
    {
      uint64_t type_sig =
          elfcpp::Swap_unaligned<64, big_endian>::readval(phash);
      if (type_sig != 0)
	{
	  unsigned int index =
	      elfcpp::Swap_unaligned<32, big_endian>::readval(pindex);
	  const unsigned char* shndx_list =
	      shndx_pool + index * sizeof(uint32_t);

	  // Collect the debug sections for this type unit set.
	  unsigned int debug_types = 0;
	  unsigned int debug_abbrev = 0;
	  unsigned int debug_line = 0;
	  unsigned int debug_str_offsets = 0;
	  for (;;)
	    {
	      if (shndx_list >= limit)
		gold_fatal(_("%s: .debug_tu_index is corrupt"),
			   this->name_);
	      unsigned int shndx =
		  elfcpp::Swap_unaligned<32, big_endian>::readval(shndx_list);
	      if (shndx == 0)
	        break;
	      if (shndx > this->shnum())
		gold_fatal(_("%s: .debug_tu_index has bad shndx"),
			   this->name_);
	      std::string sect_name = this->section_name(shndx);
	      const char* suffix = sect_name.c_str();
	      if (is_prefix_of(".debug_", suffix))
		suffix += 7;
	      else if (is_prefix_of(".zdebug_", suffix))
		suffix += 8;
	      else
		gold_fatal(_("%s: .debug_tu_index refers to "
			     "non-debug section"), this->name_);
	      if (strcmp(suffix, "types.dwo") == 0)
		debug_types = shndx;
	      else if (strcmp(suffix, "abbrev.dwo") == 0)
		debug_abbrev = shndx;
	      else if (strcmp(suffix, "line.dwo") == 0)
		debug_line = shndx;
	      else if (strcmp(suffix, "str_offsets.dwo") == 0)
		debug_str_offsets = shndx;
	      shndx_list += sizeof(uint32_t);
	    }
	  this->add_tu_set(output_file, type_sig, debug_types, debug_abbrev,
			   debug_line, debug_str_offsets);
	}
      phash += sizeof(uint64_t);
      pindex += sizeof(uint32_t);
    }

  if (is_new)
    delete[] contents;
}

// Merge the input string table section into the output file.

void
Dwo_file::add_strings(Dwp_output_file* output_file, unsigned int debug_str)
{
  section_size_type len;
  bool is_new;
  const unsigned char* pdata = this->section_contents(debug_str, &len, &is_new);
  const char* p = reinterpret_cast<const char*>(pdata);
  const char* pend = p + len;

  // Check that the last string is null terminated.
  if (pend[-1] != '\0')
    gold_fatal(_("%s: last entry in string section '%s' "
		 "is not null terminated"),
	       this->name_,
	       this->section_name(debug_str).c_str());

  // Count the number of strings in the section, and size the map.
  size_t count = 0;
  for (const char* pt = p; pt < pend; pt += strlen(pt) + 1)
    ++count;
  this->str_offset_map_.reserve(count + 1);

  // Add the strings to the output string table, and record the new offsets
  // in the map.
  section_offset_type i = 0;
  section_offset_type new_offset;
  while (p < pend)
    {
      size_t len = strlen(p);
      new_offset = output_file->add_string(p, len);
      this->str_offset_map_.push_back(std::make_pair(i, new_offset));
      p += len + 1;
      i += len + 1;
    }
  new_offset = 0;
  this->str_offset_map_.push_back(std::make_pair(i, new_offset));
  if (is_new)
    delete[] pdata;
}

// Copy a section from the input file to the output file.
// If IS_STR_OFFSETS is true, remap the string offsets for the
// output string table.

unsigned int
Dwo_file::copy_section(Dwp_output_file* output_file, unsigned int shndx,
		       const char* section_name, bool is_str_offsets)
{
  // Some sections may be referenced from more than one set.
  // Don't copy a section more than once.
  if (this->shndx_map_[shndx] > 0)
    return this->shndx_map_[shndx];

  section_size_type len;
  bool is_new;
  const unsigned char* contents = this->section_contents(shndx, &len, &is_new);

  if (is_str_offsets)
    {
      const unsigned char* remapped = this->remap_str_offsets(contents, len);
      if (is_new)
	delete[] contents;
      contents = remapped;
      is_new = true;
    }

  this->shndx_map_[shndx] = output_file->add_section(section_name, contents,
						     len, 1);
  if (is_new)
    delete[] contents;

  return this->shndx_map_[shndx];
}

// Remap the 
const unsigned char*
Dwo_file::remap_str_offsets(const unsigned char* contents,
			    section_size_type len)
{
  if ((len & 3) != 0)
    gold_fatal(_("%s: .debug_str_offsets.dwo section size not a multiple of 4"),
	       this->name_);

  if (this->obj_->is_big_endian())
    return this->sized_remap_str_offsets<true>(contents, len);
  else
    return this->sized_remap_str_offsets<false>(contents, len);
}

template <bool big_endian>
const unsigned char*
Dwo_file::sized_remap_str_offsets(const unsigned char* contents,
				  section_size_type len)
{
  unsigned char* remapped = new unsigned char[len];
  const unsigned char* p = contents;
  unsigned char* q = remapped;
  while (len > 0)
    {
      unsigned int val = elfcpp::Swap_unaligned<32, big_endian>::readval(p);
      val = this->remap_str_offset(val);
      elfcpp::Swap_unaligned<32, big_endian>::writeval(q, val);
      len -= 4;
      p += 4;
      q += 4;
    }
  return remapped;
}

unsigned int
Dwo_file::remap_str_offset(section_offset_type val)
{
  Str_offset_map_entry entry;
  entry.first = val;

  Str_offset_map::const_iterator p =
      std::lower_bound(this->str_offset_map_.begin(),
		       this->str_offset_map_.end(),
		       entry, Offset_compare());

  if (p == this->str_offset_map_.end() || p->first > val)
    {
      if (p == this->str_offset_map_.begin())
	return 0;
      --p;
      gold_assert(p->first <= val);
    }

  return p->second + (val - p->first);
}

// Add a set of .debug_info and related sections to OUTPUT_FILE.

void
Dwo_file::add_cu_set(Dwp_output_file* output_file,
		     uint64_t dwo_id,
		     unsigned int debug_info,
		     unsigned int debug_abbrev,
		     unsigned int debug_line,
		     unsigned int debug_loc,
		     unsigned int debug_str_offsets,
		     unsigned int debug_macinfo,
		     unsigned int debug_macro)
{
  if (debug_info == 0)
    gold_fatal(_("%s: no .debug_info.dwo section found"), this->name_);
  if (debug_abbrev == 0)
    gold_fatal(_("%s: no .debug_abbrev.dwo section found"), this->name_);

  debug_abbrev = this->copy_section(output_file, debug_abbrev,
				    ".debug_abbrev.dwo", false);
  if (debug_line > 0)
    debug_line = this->copy_section(output_file, debug_line,
				    ".debug_line.dwo", false);
  if (debug_loc > 0)
    debug_loc = this->copy_section(output_file, debug_loc, ".debug_loc.dwo",
				   false);
  if (debug_macinfo > 0)
    debug_macinfo = this->copy_section(output_file, debug_macinfo,
				       ".debug_macinfo.dwo", false);
  if (debug_macro > 0)
    debug_macro = this->copy_section(output_file, debug_macro,
				     ".debug_macro.dwo", false);

  if (debug_str_offsets > 0)
    debug_str_offsets = this->copy_section(output_file, debug_str_offsets,
					   ".debug_str_offsets.dwo", true);

  debug_info = this->copy_section(output_file, debug_info, ".debug_info.dwo",
				  false);

  output_file->add_cu_set(dwo_id, debug_info, debug_abbrev, debug_line,
			  debug_loc, debug_str_offsets, debug_macinfo,
			  debug_macro);
}

// Add a set of .debug_types and related sections to OUTPUT_FILE.

void
Dwo_file::add_tu_set(Dwp_output_file* output_file,
		     uint64_t type_sig,
		     unsigned int debug_types,
		     unsigned int debug_abbrev,
		     unsigned int debug_line,
		     unsigned int debug_str_offsets)
{
  if (debug_types == 0)
    gold_fatal(_("%s: no .debug_types.dwo section found"), this->name_);
  if (debug_abbrev == 0)
    gold_fatal(_("%s: no .debug_abbrev.dwo section found"), this->name_);

  // Ignore duplicate type signatures.
  if (output_file->lookup_tu(type_sig))
    return;

  debug_abbrev = this->copy_section(output_file, debug_abbrev,
				    ".debug_abbrev.dwo", false);
  if (debug_line > 0)
    debug_line = this->copy_section(output_file, debug_line,
				    ".debug_line.dwo", false);

  if (debug_str_offsets > 0)
    debug_str_offsets = this->copy_section(output_file, debug_str_offsets,
					   ".debug_str_offsets.dwo", true);

  debug_types = this->copy_section(output_file, debug_types,
				   ".debug_types.dwo", false);

  output_file->add_tu_set(type_sig, debug_types, debug_abbrev, debug_line,
			  debug_str_offsets);
}

// Class Dwp_output_file.

// Record the target info from an input file.  On first call, we
// set the ELF header values for the output file.  On subsequent
// calls, we just verify that the values match.

void
Dwp_output_file::record_target_info(const char*, int machine,
				    int size, bool big_endian,
				    int osabi, int abiversion)
{
  // TODO: Check the values on subsequent calls.
  if (this->size_ > 0)
    return;

  this->machine_ = machine;
  this->size_ = size;
  this->big_endian_ = big_endian;
  this->osabi_ = osabi;
  this->abiversion_ = abiversion;

  if (size == 32)
    this->next_file_offset_ = elfcpp::Elf_sizes<32>::ehdr_size;
  else if (size == 64)
    this->next_file_offset_ = elfcpp::Elf_sizes<64>::ehdr_size;
  else
    gold_unreachable();

  this->fd_ = ::fopen(this->name_, "wb");
  if (this->fd_ == NULL)
    gold_fatal(_("%s: %s"), this->name_, strerror(errno));

  // Write zeroes for the ELF header initially.  We'll write
  // the actual header during finalize().
  static const char buf[elfcpp::Elf_sizes<64>::ehdr_size] = { 0 };
  if (::fwrite(buf, 1, this->next_file_offset_, this->fd_)
      < (size_t) this->next_file_offset_)
    gold_fatal(_("%s: %s"), this->name_, strerror(errno));
}

// Add a string to the debug strings section.

section_offset_type
Dwp_output_file::add_string(const char* str, size_t len)
{
  Stringpool::Key key;
  this->stringpool_.add_with_length(str, len, true, &key);
  this->have_strings_ = true;
  // We aren't supposed to call get_offset() until after
  // calling set_string_offsets(), but the offsets will
  // not change unless optimizing the string pool.
  return this->stringpool_.get_offset_from_key(key);
}

// Align the file offset to the given boundary.

static inline off_t
align_offset(off_t off, int align)
{
  return (off + align - 1) & ~(align - 1);
}

// Add a section to the output file, and return the new section index.

unsigned int
Dwp_output_file::add_section(const char* section_name,
			     const unsigned char* contents,
			     section_size_type len,
			     int align)
{
  off_t file_offset = this->next_file_offset_;
  gold_assert(this->size_ > 0 && file_offset > 0);

  file_offset = align_offset(file_offset, align);

  ::fseek(this->fd_, file_offset, SEEK_SET);
  if (::fwrite(contents, 1, len, this->fd_) < len)
    gold_fatal(_("%s: error writing section '%s'"), this->name_, section_name);

  section_name = this->shstrtab_.add_with_length(section_name,
						 strlen(section_name),
						 false, NULL);
  Section sect = { section_name, file_offset, len, align };
  this->sections_.push_back(sect);

  this->next_file_offset_ = file_offset + len;
  return this->shnum_++;
}

// Add a set of .debug_info and related sections to the output file.

void
Dwp_output_file::add_cu_set(uint64_t dwo_id,
			    unsigned int debug_info,
			    unsigned int debug_abbrev,
			    unsigned int debug_line,
			    unsigned int debug_loc,
			    unsigned int debug_str_offsets,
			    unsigned int debug_macinfo,
			    unsigned int debug_macro)
{
  Cu_or_tu_set cu_set = { dwo_id, debug_info, debug_abbrev, debug_line,
			  debug_loc, debug_str_offsets, debug_macinfo,
			  debug_macro };
  unsigned int slot;
  if (!this->cu_index_.find_or_add(dwo_id, &slot))
    this->cu_index_.enter_set(slot, cu_set);
  else
    gold_warning(_("%s: duplicate entry for CU (dwo_id 0x%llx)"),
		 this->name_, (unsigned long long)dwo_id);
}

// Lookup a type signature and return TRUE if we have already seen it.
bool
Dwp_output_file::lookup_tu(uint64_t type_sig)
{
  this->last_type_sig_ = type_sig;
  return this->tu_index_.find_or_add(type_sig, &this->last_tu_slot_);
}

// Add a set of .debug_types and related sections to the output file.

void
Dwp_output_file::add_tu_set(uint64_t type_sig,
			    unsigned int debug_types,
			    unsigned int debug_abbrev,
			    unsigned int debug_line,
			    unsigned int debug_str_offsets)
{
  Cu_or_tu_set tu_set = { type_sig, debug_types, debug_abbrev, debug_line,
			  0, debug_str_offsets, 0, 0 };
  unsigned int slot;
  if (type_sig == this->last_type_sig_)
    slot = this->last_tu_slot_;
  else
    this->tu_index_.find_or_add(type_sig, &slot);
  this->tu_index_.enter_set(slot, tu_set);
}

// Find a slot in the hash table for SIGNATURE.  Return TRUE
// if the entry already exists.

bool
Dwp_output_file::Dwp_index::find_or_add(uint64_t signature,
					unsigned int* slotp)
{
  if (this->capacity_ == 0)
    this->initialize();
  unsigned int slot =
      static_cast<unsigned int>(signature) & (this->capacity_ - 1);
  unsigned int secondary_hash;
  uint64_t probe = this->hash_table_[slot];
  if (probe != 0 && probe != signature)
    {
      secondary_hash = (static_cast<unsigned int>(signature >> 32)
			& (this->capacity_ - 1)) | 1;
      do
	{
	  slot = (slot + secondary_hash) & (this->capacity_ - 1);
	  probe = this->hash_table_[slot];
	} while (probe != 0 && probe != signature);
    }
  *slotp = slot;
  return (probe != 0);
}

// Enter a CU or TU set at the given SLOT in the hash table.

void
Dwp_output_file::Dwp_index::enter_set(unsigned int slot,
				      const Cu_or_tu_set& set)
{
  gold_assert(slot < this->capacity_);
  gold_assert(set.debug_info_or_types > 0);
  gold_assert(set.debug_abbrev > 0);

  // Add the section indexes to the pool.
  uint32_t pool_index = this->shndx_pool_.size();
  this->shndx_pool_.push_back(set.debug_info_or_types);
  this->shndx_pool_.push_back(set.debug_abbrev);
  if (set.debug_line > 0)
    this->shndx_pool_.push_back(set.debug_line);
  if (set.debug_loc > 0)
    this->shndx_pool_.push_back(set.debug_loc);
  if (set.debug_str_offsets > 0)
    this->shndx_pool_.push_back(set.debug_str_offsets);
  if (set.debug_macinfo > 0)
    this->shndx_pool_.push_back(set.debug_macinfo);
  if (set.debug_macro > 0)
    this->shndx_pool_.push_back(set.debug_macro);
  this->shndx_pool_.push_back(0);

  // Enter the signature and pool index into the hash table.
  gold_assert(this->hash_table_[slot] == 0);
  this->hash_table_[slot] = set.signature;
  this->index_table_[slot] = pool_index;
  ++this->used_;

  // Grow the hash table when we exceed 2/3 capacity.
  if (this->used_ * 3 > this->capacity_ * 2)
    this->grow();
}

// Initialize the hash table.

void
Dwp_output_file::Dwp_index::initialize()
{
  this->capacity_ = 16;
  this->hash_table_ = new uint64_t[this->capacity_];
  memset(this->hash_table_, 0, this->capacity_ * sizeof(uint64_t));
  this->index_table_ = new uint32_t[this->capacity_];
  memset(this->index_table_, 0, this->capacity_ * sizeof(uint32_t));
}

// Grow the hash table when we reach 2/3 capacity.

void
Dwp_output_file::Dwp_index::grow()
{
  unsigned int old_capacity = this->capacity_;
  uint64_t* old_hash_table = this->hash_table_;
  uint32_t* old_index_table = this->index_table_;
  unsigned int old_used = this->used_;

  this->capacity_ = old_capacity * 2;
  this->hash_table_ = new uint64_t[this->capacity_];
  memset(this->hash_table_, 0, this->capacity_ * sizeof(uint64_t));
  this->index_table_ = new uint32_t[this->capacity_];
  memset(this->index_table_, 0, this->capacity_ * sizeof(uint32_t));
  this->used_ = 0;

  for (unsigned int i = 0; i < old_capacity; ++i)
    {
      uint64_t signature = old_hash_table[i];
      if (signature != 0)
        {
	  unsigned int slot;
	  bool found = this->find_or_add(signature, &slot);
	  gold_assert(!found);
	  this->hash_table_[slot] = signature;
	  this->index_table_[slot] = old_index_table[i];
	  ++this->used_;
        }
    }
  gold_assert(this->used_ == old_used);

  delete[] old_hash_table;
  delete[] old_index_table;
}

// Initialize the output file.

void
Dwp_output_file::initialize()
{
  // We can't initialize the output file until we've recorded the
  // target info from the first input file.
  gold_assert(this->size_ > 0);
}

// Finalize the file, write the string tables and index sections,
// and close the file.

void
Dwp_output_file::finalize()
{
  unsigned char* buf;

  // Write the debug string table.
  if (this->have_strings_)
    {
      this->stringpool_.set_string_offsets();
      section_size_type len = this->stringpool_.get_strtab_size();
      buf = new unsigned char[len];
      this->stringpool_.write_to_buffer(buf, len);
      this->add_section(".debug_str.dwo", buf, len, 1);
      delete[] buf;
    }

  // Write the CU and TU indexes.
  if (this->big_endian_)
    {
      this->write_index<true>(".debug_cu_index", this->cu_index_);
      this->write_index<true>(".debug_tu_index", this->tu_index_);
    }
  else
    {
      this->write_index<false>(".debug_cu_index", this->cu_index_);
      this->write_index<false>(".debug_tu_index", this->tu_index_);
    }

  off_t file_offset = this->next_file_offset_;

  // Write the section string table.
  this->shstrndx_ = this->shnum_++;
  const char* shstrtab_name =
      this->shstrtab_.add_with_length(".shstrtab",
					   sizeof(".shstrtab") - 1,
					   false, NULL);
  this->shstrtab_.set_string_offsets();
  section_size_type shstrtab_len = this->shstrtab_.get_strtab_size();
  buf = new unsigned char[shstrtab_len];
  this->shstrtab_.write_to_buffer(buf, shstrtab_len);
  off_t shstrtab_off = file_offset;
  ::fseek(this->fd_, file_offset, 0);
  if (::fwrite(buf, 1, shstrtab_len, this->fd_) < shstrtab_len)
    gold_fatal(_("%s: error writing section '.shstrtab'"), this->name_);
  delete[] buf;
  file_offset += shstrtab_len;

  // Write the section header table.  The first entry is a NULL entry.
  // This is followed by the debug sections, and finally we write the
  // .shstrtab section header.
  file_offset = align_offset(file_offset, this->size_ == 32 ? 4 : 8);
  this->shoff_ = file_offset;
  ::fseek(this->fd_, file_offset, 0);
  section_size_type sh0_size = 0;
  unsigned int sh0_link = 0;
  if (this->shnum_ >= elfcpp::SHN_LORESERVE)
    sh0_size = this->shnum_;
  if (this->shstrndx_ >= elfcpp::SHN_LORESERVE)
    sh0_link = this->shstrndx_;
  this->write_shdr(NULL, 0, 0, 0, 0, sh0_size, sh0_link, 0, 0, 0);
  for (unsigned int i = 0; i < this->sections_.size(); ++i)
    {
      Section& sect = this->sections_[i];
      this->write_shdr(sect.name, elfcpp::SHT_PROGBITS, 0, 0, sect.offset,
		       sect.size, 0, 0, sect.align, 0);
    }
  this->write_shdr(shstrtab_name, elfcpp::SHT_STRTAB, 0, 0,
		   shstrtab_off, shstrtab_len, 0, 0, 1, 0);

  // Write the ELF header.
  this->write_ehdr();

  // Close the file.
  if (this->fd_ != NULL)
    {
      if (::fclose(this->fd_) != 0)
	gold_fatal(_("%s: %s"), this->name_, strerror(errno));
    }
  this->fd_ = NULL;
}

// Write a CU or TU index section.
template<bool big_endian>
void
Dwp_output_file::write_index(const char* sect_name, const Dwp_index& index)
{
  const unsigned int nslots = index.hash_table_total_slots();
  const unsigned int nused = index.hash_table_used_slots();
  const unsigned int npool = index.shndx_pool_size();
  const section_size_type index_size = (4 * sizeof(uint32_t)
					+ nslots * sizeof(uint64_t)
					+ nslots * sizeof(uint32_t)
					+ npool * sizeof(uint32_t));

  // Allocate a buffer for the section contents.
  unsigned char* buf = new unsigned char[index_size];
  unsigned char* p = buf;

  // Write the section header: version number, padding,
  // number of used slots and total number of slots.
  elfcpp::Swap_unaligned<32, big_endian>::writeval(p, 1);
  p += sizeof(uint32_t);
  elfcpp::Swap_unaligned<32, big_endian>::writeval(p, 0);
  p += sizeof(uint32_t);
  elfcpp::Swap_unaligned<32, big_endian>::writeval(p, nused);
  p += sizeof(uint32_t);
  elfcpp::Swap_unaligned<32, big_endian>::writeval(p, nslots);
  p += sizeof(uint32_t);

  // Write the hash table.
  for (unsigned int i = 0; i < nslots; ++i)
    {
      elfcpp::Swap_unaligned<64, big_endian>::writeval(p, index.hash_table(i));
      p += sizeof(uint64_t);
    }

  // Write the parallel index table.
  for (unsigned int i = 0; i < nslots; ++i)
    {
      elfcpp::Swap_unaligned<32, big_endian>::writeval(p, index.index_table(i));
      p += sizeof(uint32_t);
    }

  // Write the section index pool.
  Dwp_index::Shndx_pool::const_iterator pool = index.shndx_pool();
  for (unsigned int i = 0; i < npool; ++i)
    {
      gold_assert(pool != index.shndx_pool_end());
      elfcpp::Swap_unaligned<32, big_endian>::writeval(p, *pool);
      p += sizeof(uint32_t);
      ++pool;
    }

  gold_assert(p == buf + index_size);

  this->add_section(sect_name, buf, index_size, sizeof(uint64_t));

  delete[] buf;
}

// Write the ELF header.

void
Dwp_output_file::write_ehdr()
{
  if (this->size_ == 32)
    {
      if (this->big_endian_)
	return this->sized_write_ehdr<32, true>();
      else
	return this->sized_write_ehdr<32, false>();
    }
  else if (this->size_ == 64)
    {
      if (this->big_endian_)
	return this->sized_write_ehdr<64, true>();
      else
	return this->sized_write_ehdr<64, false>();
    }
  else
    gold_unreachable();
}

template<unsigned int size, bool big_endian>
void
Dwp_output_file::sized_write_ehdr()
{
  const unsigned int ehdr_size = elfcpp::Elf_sizes<size>::ehdr_size;
  unsigned char buf[ehdr_size];
  elfcpp::Ehdr_write<size, big_endian> ehdr(buf);

  unsigned char e_ident[elfcpp::EI_NIDENT];
  memset(e_ident, 0, elfcpp::EI_NIDENT);
  e_ident[elfcpp::EI_MAG0] = elfcpp::ELFMAG0;
  e_ident[elfcpp::EI_MAG1] = elfcpp::ELFMAG1;
  e_ident[elfcpp::EI_MAG2] = elfcpp::ELFMAG2;
  e_ident[elfcpp::EI_MAG3] = elfcpp::ELFMAG3;
  if (size == 32)
    e_ident[elfcpp::EI_CLASS] = elfcpp::ELFCLASS32;
  else if (size == 64)
    e_ident[elfcpp::EI_CLASS] = elfcpp::ELFCLASS64;
  else
    gold_unreachable();
  e_ident[elfcpp::EI_DATA] = (big_endian
			      ? elfcpp::ELFDATA2MSB
			      : elfcpp::ELFDATA2LSB);
  e_ident[elfcpp::EI_VERSION] = elfcpp::EV_CURRENT;
  ehdr.put_e_ident(e_ident);

  ehdr.put_e_type(elfcpp::ET_REL);
  ehdr.put_e_machine(this->machine_);
  ehdr.put_e_version(elfcpp::EV_CURRENT);
  ehdr.put_e_entry(0);
  ehdr.put_e_phoff(0);
  ehdr.put_e_shoff(this->shoff_);
  ehdr.put_e_flags(0);
  ehdr.put_e_ehsize(elfcpp::Elf_sizes<size>::ehdr_size);
  ehdr.put_e_phentsize(0);
  ehdr.put_e_phnum(0);
  ehdr.put_e_shentsize(elfcpp::Elf_sizes<size>::shdr_size);
  ehdr.put_e_shnum(this->shnum_ < elfcpp::SHN_LORESERVE ? this->shnum_ : 0);
  ehdr.put_e_shstrndx(this->shstrndx_ < elfcpp::SHN_LORESERVE
		      ? this->shstrndx_
		      : static_cast<unsigned int>(elfcpp::SHN_XINDEX));

  ::fseek(this->fd_, 0, 0);
  if (::fwrite(buf, 1, ehdr_size, this->fd_) < ehdr_size)
    gold_fatal(_("%s: error writing ELF header"), this->name_);
}

// Write a section header.

void
Dwp_output_file::write_shdr(const char* name, unsigned int type,
			    unsigned int flags, uint64_t addr, off_t offset,
			    section_size_type sect_size, unsigned int link,
			    unsigned int info, unsigned int align,
			    unsigned int ent_size)
{
  if (this->size_ == 32)
    {
      if (this->big_endian_)
	return this->sized_write_shdr<32, true>(name, type, flags, addr,
						offset, sect_size, link, info,
						align, ent_size);
      else
	return this->sized_write_shdr<32, false>(name, type, flags, addr,
						 offset, sect_size, link, info,
						 align, ent_size);
    }
  else if (this->size_ == 64)
    {
      if (this->big_endian_)
	return this->sized_write_shdr<64, true>(name, type, flags, addr,
						offset, sect_size, link, info,
						align, ent_size);
      else
	return this->sized_write_shdr<64, false>(name, type, flags, addr,
						 offset, sect_size, link, info,
						 align, ent_size);
    }
  else
    gold_unreachable();
}

template<unsigned int size, bool big_endian>
void
Dwp_output_file::sized_write_shdr(const char* name, unsigned int type,
				  unsigned int flags, uint64_t addr,
				  off_t offset, section_size_type sect_size,
				  unsigned int link, unsigned int info,
				  unsigned int align, unsigned int ent_size)
{
  const unsigned int shdr_size = elfcpp::Elf_sizes<size>::shdr_size;
  unsigned char buf[shdr_size];
  elfcpp::Shdr_write<size, big_endian> shdr(buf);

  shdr.put_sh_name(name == NULL ? 0 : this->shstrtab_.get_offset(name));
  shdr.put_sh_type(type);
  shdr.put_sh_flags(flags);
  shdr.put_sh_addr(addr);
  shdr.put_sh_offset(offset);
  shdr.put_sh_size(sect_size);
  shdr.put_sh_link(link);
  shdr.put_sh_info(info);
  shdr.put_sh_addralign(align);
  shdr.put_sh_entsize(ent_size);
  if (::fwrite(buf, 1, shdr_size, this->fd_) < shdr_size)
    gold_fatal(_("%s: error writing section header table"), this->name_);
}

// Class Dwo_name_info_reader.

// Visit a compilation unit.

void
Dwo_name_info_reader::visit_compilation_unit(off_t, off_t, Dwarf_die* die)
{
  const char* dwo_name = die->string_attribute(elfcpp::DW_AT_GNU_dwo_name);
  if (dwo_name != NULL)
      this->files_->push_back(dwo_name);
}

// Class Dwo_id_info_reader.

// Visit a compilation unit.

void
Dwo_id_info_reader::visit_compilation_unit(off_t, off_t, Dwarf_die* die)
{
  this->dwo_id_ = die->uint_attribute(elfcpp::DW_AT_GNU_dwo_id);
  if (this->dwo_id_ != 0)
    this->dwo_id_found_ = true;
}

// Visit a type unit.

void
Dwo_id_info_reader::visit_type_unit(off_t, off_t, uint64_t signature,
				    Dwarf_die*)
{
  this->type_sig_ = signature;
  this->type_sig_found_ = true;
}

}; // End namespace gold

using namespace gold;

// Options.

struct option dwp_options[] =
  {
    { "exec", required_argument, NULL, 'e' },
    { "help", no_argument, NULL, 'h' },
    { "output", required_argument, NULL, 'o' },
    { "verbose", no_argument, NULL, 'v' },
    { "version", no_argument, NULL, 'V' },
    { NULL, 0, NULL, 0 }
  };

// Print usage message and exit.

static void
usage(FILE* fd, int exit_status)
{
  fprintf(fd, _("Usage: %s [options] [file...]\n"), program_name);
  fprintf(fd, _("  -h, --help               Print this help message\n"));
  fprintf(fd, _("  -e EXE, --exec EXE       Get list of dwo files from EXE"
		" (defaults output to EXE.dwp)\n"));
  fprintf(fd, _("  -o FILE, --output FILE   Set output dwp file name\n"));
  fprintf(fd, _("  -v, --verbose            Verbose output\n"));
  fprintf(fd, _("  -V, --version            Print version number\n"));

  // REPORT_BUGS_TO is defined in bfd/bfdver.h.
  const char* report = REPORT_BUGS_TO;
  if (*report != '\0')
    fprintf(fd, _("\nReport bugs to %s\n"), report);
  exit(exit_status);
}

// Report version information.

static void
print_version()
{
  // This output is intended to follow the GNU standards.
  printf("GNU dwp %s\n", BFD_VERSION_STRING);
  printf(_("Copyright 2012 Free Software Foundation, Inc.\n"));
  printf(_("\
This program is free software; you may redistribute it under the terms of\n\
the GNU General Public License version 3 or (at your option) any later version.\n\
This program has absolutely no warranty.\n"));
  exit(EXIT_SUCCESS);
}

// Main program.

int
main(int argc, char** argv)
{
#if defined (HAVE_SETLOCALE) && defined (HAVE_LC_MESSAGES)
  setlocale(LC_MESSAGES, "");
#endif
#if defined (HAVE_SETLOCALE)
  setlocale(LC_CTYPE, "");
#endif
  bindtextdomain(PACKAGE, LOCALEDIR);
  textdomain(PACKAGE);

  program_name = argv[0];

  // Initialize the global parameters, to let random code get to the
  // errors object.
  Errors errors(program_name);
  set_parameters_errors(&errors);

  // Initialize gold's global options.  We don't use these in
  // this program, but they need to be initialized so that
  // functions we call from libgold work properly.
  General_options options;
  set_parameters_options(&options);

  // In libiberty; expands @filename to the args in "filename".
  expandargv(&argc, &argv);

  // Collect file names and options.
  File_list files;
  std::string output_filename;
  const char* exe_filename = NULL;
  bool verbose = false;
  int c;
  while ((c = getopt_long(argc, argv, "e:ho:vV", dwp_options, NULL)) != -1)
    {
      switch (c)
        {
	  case 'h':
	    usage(stdout, EXIT_SUCCESS);
	  case 'e':
	    exe_filename = optarg;
	    break;
	  case 'o':
	    output_filename.assign(optarg);
	    break;
	  case 'v':
	    verbose = true;
	    break;
	  case 'V':
	    print_version();
	  case '?':
	  default:
	    usage(stderr, EXIT_FAILURE);
	}
    }

  if (output_filename.empty())
    {
      if (exe_filename == NULL)
	gold_fatal(_("no output file specified"));
      output_filename.assign(exe_filename);
      output_filename.append(".dwp");
    }

  Dwp_output_file output_file(output_filename.c_str());

  // Get list of .dwo files from the executable.
  if (exe_filename != NULL)
    {
      Dwo_file exe_file(exe_filename);
      exe_file.read_executable(&files);
    }

  // Add any additional files listed on command line.
  for (int i = optind; i < argc; ++i)
    files.push_back(argv[i]);

  if (exe_filename == NULL && files.empty())
    gold_fatal(_("no input files and no executable specified"));

  // Process each file, adding its contents to the output file.
  for (File_list::const_iterator f = files.begin(); f != files.end(); ++f)
    {
      if (verbose)
        fprintf(stderr, "%s\n", f->c_str());
      Dwo_file dwo_file(f->c_str());
      dwo_file.read(&output_file);
    }

  output_file.finalize();

  return EXIT_SUCCESS;
}
