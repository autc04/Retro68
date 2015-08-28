// aarch64.cc -- aarch64 target support for gold.

// Copyright (C) 2014 Free Software Foundation, Inc.
// Written by Jing Yu <jingyu@google.com> and Han Shen <shenhan@google.com>.

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

#include <cstring>

#include "elfcpp.h"
#include "dwarf.h"
#include "parameters.h"
#include "reloc.h"
#include "aarch64.h"
#include "object.h"
#include "symtab.h"
#include "layout.h"
#include "output.h"
#include "copy-relocs.h"
#include "target.h"
#include "target-reloc.h"
#include "target-select.h"
#include "tls.h"
#include "freebsd.h"
#include "nacl.h"
#include "gc.h"
#include "icf.h"
#include "aarch64-reloc-property.h"

// The first three .got.plt entries are reserved.
const int32_t AARCH64_GOTPLT_RESERVE_COUNT = 3;

namespace
{

using namespace gold;

template<int size, bool big_endian>
class Output_data_plt_aarch64;

template<int size, bool big_endian>
class Output_data_plt_aarch64_standard;

template<int size, bool big_endian>
class Target_aarch64;

template<int size, bool big_endian>
class AArch64_relocate_functions;

// Output_data_got_aarch64 class.

template<int size, bool big_endian>
class Output_data_got_aarch64 : public Output_data_got<size, big_endian>
{
 public:
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Valtype;
  Output_data_got_aarch64(Symbol_table* symtab, Layout* layout)
    : Output_data_got<size, big_endian>(),
      symbol_table_(symtab), layout_(layout)
  { }

  // Add a static entry for the GOT entry at OFFSET.  GSYM is a global
  // symbol and R_TYPE is the code of a dynamic relocation that needs to be
  // applied in a static link.
  void
  add_static_reloc(unsigned int got_offset, unsigned int r_type, Symbol* gsym)
  { this->static_relocs_.push_back(Static_reloc(got_offset, r_type, gsym)); }


  // Add a static reloc for the GOT entry at OFFSET.  RELOBJ is an object
  // defining a local symbol with INDEX.  R_TYPE is the code of a dynamic
  // relocation that needs to be applied in a static link.
  void
  add_static_reloc(unsigned int got_offset, unsigned int r_type,
		   Sized_relobj_file<size, big_endian>* relobj,
		   unsigned int index)
  {
    this->static_relocs_.push_back(Static_reloc(got_offset, r_type, relobj,
						index));
  }


 protected:
  // Write out the GOT table.
  void
  do_write(Output_file* of) {
    // The first entry in the GOT is the address of the .dynamic section.
    gold_assert(this->data_size() >= size / 8);
    Output_section* dynamic = this->layout_->dynamic_section();
    Valtype dynamic_addr = dynamic == NULL ? 0 : dynamic->address();
    this->replace_constant(0, dynamic_addr);
    Output_data_got<size, big_endian>::do_write(of);

    // Handling static relocs
    if (this->static_relocs_.empty())
      return;

    typedef typename elfcpp::Elf_types<size>::Elf_Addr AArch64_address;

    gold_assert(parameters->doing_static_link());
    const off_t offset = this->offset();
    const section_size_type oview_size =
      convert_to_section_size_type(this->data_size());
    unsigned char* const oview = of->get_output_view(offset, oview_size);

    Output_segment* tls_segment = this->layout_->tls_segment();
    gold_assert(tls_segment != NULL);

    AArch64_address aligned_tcb_address =
      align_address(Target_aarch64<size,big_endian>::TCB_SIZE,
		    tls_segment->maximum_alignment());

    for (size_t i = 0; i < this->static_relocs_.size(); ++i)
      {
	Static_reloc& reloc(this->static_relocs_[i]);
	AArch64_address value;

	if (!reloc.symbol_is_global())
	  {
	    Sized_relobj_file<size, big_endian>* object = reloc.relobj();
	    const Symbol_value<size>* psymval =
	      reloc.relobj()->local_symbol(reloc.index());

	    // We are doing static linking.  Issue an error and skip this
	    // relocation if the symbol is undefined or in a discarded_section.
	    bool is_ordinary;
	    unsigned int shndx = psymval->input_shndx(&is_ordinary);
	    if ((shndx == elfcpp::SHN_UNDEF)
		|| (is_ordinary
		    && shndx != elfcpp::SHN_UNDEF
		    && !object->is_section_included(shndx)
		    && !this->symbol_table_->is_section_folded(object, shndx)))
	      {
		gold_error(_("undefined or discarded local symbol %u from "
			     " object %s in GOT"),
			   reloc.index(), reloc.relobj()->name().c_str());
		continue;
	      }
	    value = psymval->value(object, 0);
	  }
	else
	  {
	    const Symbol* gsym = reloc.symbol();
	    gold_assert(gsym != NULL);
	    if (gsym->is_forwarder())
	      gsym = this->symbol_table_->resolve_forwards(gsym);

	    // We are doing static linking.  Issue an error and skip this
	    // relocation if the symbol is undefined or in a discarded_section
	    // unless it is a weakly_undefined symbol.
	    if ((gsym->is_defined_in_discarded_section()
		 || gsym->is_undefined())
		&& !gsym->is_weak_undefined())
	      {
		gold_error(_("undefined or discarded symbol %s in GOT"),
			   gsym->name());
		continue;
	      }

	    if (!gsym->is_weak_undefined())
	      {
		const Sized_symbol<size>* sym =
		  static_cast<const Sized_symbol<size>*>(gsym);
		value = sym->value();
	      }
	    else
	      value = 0;
	  }

	unsigned got_offset = reloc.got_offset();
	gold_assert(got_offset < oview_size);

	typedef typename elfcpp::Swap<size, big_endian>::Valtype Valtype;
	Valtype* wv = reinterpret_cast<Valtype*>(oview + got_offset);
	Valtype x;
	switch (reloc.r_type())
	  {
	  case elfcpp::R_AARCH64_TLS_DTPREL64:
	    x = value;
	    break;
	  case elfcpp::R_AARCH64_TLS_TPREL64:
	    x = value + aligned_tcb_address;
	    break;
	  default:
	    gold_unreachable();
	  }
	elfcpp::Swap<size, big_endian>::writeval(wv, x);
      }

    of->write_output_view(offset, oview_size, oview);
  }

 private:
  // Symbol table of the output object.
  Symbol_table* symbol_table_;
  // A pointer to the Layout class, so that we can find the .dynamic
  // section when we write out the GOT section.
  Layout* layout_;

  // This class represent dynamic relocations that need to be applied by
  // gold because we are using TLS relocations in a static link.
  class Static_reloc
  {
   public:
    Static_reloc(unsigned int got_offset, unsigned int r_type, Symbol* gsym)
      : got_offset_(got_offset), r_type_(r_type), symbol_is_global_(true)
    { this->u_.global.symbol = gsym; }

    Static_reloc(unsigned int got_offset, unsigned int r_type,
	  Sized_relobj_file<size, big_endian>* relobj, unsigned int index)
      : got_offset_(got_offset), r_type_(r_type), symbol_is_global_(false)
    {
      this->u_.local.relobj = relobj;
      this->u_.local.index = index;
    }

    // Return the GOT offset.
    unsigned int
    got_offset() const
    { return this->got_offset_; }

    // Relocation type.
    unsigned int
    r_type() const
    { return this->r_type_; }

    // Whether the symbol is global or not.
    bool
    symbol_is_global() const
    { return this->symbol_is_global_; }

    // For a relocation against a global symbol, the global symbol.
    Symbol*
    symbol() const
    {
      gold_assert(this->symbol_is_global_);
      return this->u_.global.symbol;
    }

    // For a relocation against a local symbol, the defining object.
    Sized_relobj_file<size, big_endian>*
    relobj() const
    {
      gold_assert(!this->symbol_is_global_);
      return this->u_.local.relobj;
    }

    // For a relocation against a local symbol, the local symbol index.
    unsigned int
    index() const
    {
      gold_assert(!this->symbol_is_global_);
      return this->u_.local.index;
    }

   private:
    // GOT offset of the entry to which this relocation is applied.
    unsigned int got_offset_;
    // Type of relocation.
    unsigned int r_type_;
    // Whether this relocation is against a global symbol.
    bool symbol_is_global_;
    // A global or local symbol.
    union
    {
      struct
      {
	// For a global symbol, the symbol itself.
	Symbol* symbol;
      } global;
      struct
      {
	// For a local symbol, the object defining object.
	Sized_relobj_file<size, big_endian>* relobj;
	// For a local symbol, the symbol index.
	unsigned int index;
      } local;
    } u_;
  };  // End of inner class Static_reloc

  std::vector<Static_reloc> static_relocs_;
};  // End of Output_data_got_aarch64


AArch64_reloc_property_table* aarch64_reloc_property_table = NULL;


// The aarch64 target class.
// See the ABI at
// http://infocenter.arm.com/help/topic/com.arm.doc.ihi0056b/IHI0056B_aaelf64.pdf
template<int size, bool big_endian>
class Target_aarch64 : public Sized_target<size, big_endian>
{
 public:
  typedef Target_aarch64<size,big_endian> This;
  typedef Output_data_reloc<elfcpp::SHT_RELA, true, size, big_endian>
      Reloc_section;
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Address;
  const static int TCB_SIZE = size / 8 * 2;

  Target_aarch64(const Target::Target_info* info = &aarch64_info)
    : Sized_target<size, big_endian>(info),
      got_(NULL), plt_(NULL), got_plt_(NULL), got_irelative_(NULL),
      got_tlsdesc_(NULL), global_offset_table_(NULL), rela_dyn_(NULL),
      rela_irelative_(NULL), copy_relocs_(elfcpp::R_AARCH64_COPY),
      got_mod_index_offset_(-1U), tlsdesc_reloc_info_(),
      tls_base_symbol_defined_(false)
  { }

  // Scan the relocations to determine unreferenced sections for
  // garbage collection.
  void
  gc_process_relocs(Symbol_table* symtab,
		    Layout* layout,
		    Sized_relobj_file<size, big_endian>* object,
		    unsigned int data_shndx,
		    unsigned int sh_type,
		    const unsigned char* prelocs,
		    size_t reloc_count,
		    Output_section* output_section,
		    bool needs_special_offset_handling,
		    size_t local_symbol_count,
		    const unsigned char* plocal_symbols);

  // Scan the relocations to look for symbol adjustments.
  void
  scan_relocs(Symbol_table* symtab,
	      Layout* layout,
	      Sized_relobj_file<size, big_endian>* object,
	      unsigned int data_shndx,
	      unsigned int sh_type,
	      const unsigned char* prelocs,
	      size_t reloc_count,
	      Output_section* output_section,
	      bool needs_special_offset_handling,
	      size_t local_symbol_count,
	      const unsigned char* plocal_symbols);

  // Finalize the sections.
  void
  do_finalize_sections(Layout*, const Input_objects*, Symbol_table*);

  // Return the value to use for a dynamic which requires special
  // treatment.
  uint64_t
  do_dynsym_value(const Symbol*) const;

  // Relocate a section.
  void
  relocate_section(const Relocate_info<size, big_endian>*,
		   unsigned int sh_type,
		   const unsigned char* prelocs,
		   size_t reloc_count,
		   Output_section* output_section,
		   bool needs_special_offset_handling,
		   unsigned char* view,
		   typename elfcpp::Elf_types<size>::Elf_Addr view_address,
		   section_size_type view_size,
		   const Reloc_symbol_changes*);

  // Scan the relocs during a relocatable link.
  void
  scan_relocatable_relocs(Symbol_table* symtab,
			  Layout* layout,
			  Sized_relobj_file<size, big_endian>* object,
			  unsigned int data_shndx,
			  unsigned int sh_type,
			  const unsigned char* prelocs,
			  size_t reloc_count,
			  Output_section* output_section,
			  bool needs_special_offset_handling,
			  size_t local_symbol_count,
			  const unsigned char* plocal_symbols,
			  Relocatable_relocs*);

  // Relocate a section during a relocatable link.
  void
  relocate_relocs(
      const Relocate_info<size, big_endian>*,
      unsigned int sh_type,
      const unsigned char* prelocs,
      size_t reloc_count,
      Output_section* output_section,
      typename elfcpp::Elf_types<size>::Elf_Off offset_in_output_section,
      const Relocatable_relocs*,
      unsigned char* view,
      typename elfcpp::Elf_types<size>::Elf_Addr view_address,
      section_size_type view_size,
      unsigned char* reloc_view,
      section_size_type reloc_view_size);

  // Return the symbol index to use for a target specific relocation.
  // The only target specific relocation is R_AARCH64_TLSDESC for a
  // local symbol, which is an absolute reloc.
  unsigned int
  do_reloc_symbol_index(void*, unsigned int r_type) const
  {
    gold_assert(r_type == elfcpp::R_AARCH64_TLSDESC);
    return 0;
  }

  // Return the addend to use for a target specific relocation.
  typename elfcpp::Elf_types<size>::Elf_Addr
  do_reloc_addend(void* arg, unsigned int r_type,
		  typename elfcpp::Elf_types<size>::Elf_Addr addend) const;

  // Return the PLT section.
  uint64_t
  do_plt_address_for_global(const Symbol* gsym) const
  { return this->plt_section()->address_for_global(gsym); }

  uint64_t
  do_plt_address_for_local(const Relobj* relobj, unsigned int symndx) const
  { return this->plt_section()->address_for_local(relobj, symndx); }

  // Return the number of entries in the PLT.
  unsigned int
  plt_entry_count() const;

  //Return the offset of the first non-reserved PLT entry.
  unsigned int
  first_plt_entry_offset() const;

  // Return the size of each PLT entry.
  unsigned int
  plt_entry_size() const;

  unsigned int
  tcb_size() const { return This::TCB_SIZE; }

 protected:
  void
  do_select_as_default_target()
  {
    gold_assert(aarch64_reloc_property_table == NULL);
    aarch64_reloc_property_table = new AArch64_reloc_property_table();
  }

  // Add a new reloc argument, returning the index in the vector.
  size_t
  add_tlsdesc_info(Sized_relobj_file<size, big_endian>* object,
		   unsigned int r_sym)
  {
    this->tlsdesc_reloc_info_.push_back(Tlsdesc_info(object, r_sym));
    return this->tlsdesc_reloc_info_.size() - 1;
  }

  virtual Output_data_plt_aarch64<size, big_endian>*
  do_make_data_plt(Layout* layout,
		   Output_data_got_aarch64<size, big_endian>* got,
		   Output_data_space* got_plt,
		   Output_data_space* got_irelative)
  {
    return new Output_data_plt_aarch64_standard<size, big_endian>(
      layout, got, got_plt, got_irelative);
  }

  Output_data_plt_aarch64<size, big_endian>*
  make_data_plt(Layout* layout,
		Output_data_got_aarch64<size, big_endian>* got,
		Output_data_space* got_plt,
		Output_data_space* got_irelative)
  {
    return this->do_make_data_plt(layout, got, got_plt, got_irelative);
  }

 private:
  // The class which scans relocations.
  class Scan
  {
  public:
    Scan()
      : issued_non_pic_error_(false)
    { }

    inline void
    local(Symbol_table* symtab, Layout* layout, Target_aarch64* target,
	  Sized_relobj_file<size, big_endian>* object,
	  unsigned int data_shndx,
	  Output_section* output_section,
	  const elfcpp::Rela<size, big_endian>& reloc, unsigned int r_type,
	  const elfcpp::Sym<size, big_endian>& lsym,
	  bool is_discarded);

    inline void
    global(Symbol_table* symtab, Layout* layout, Target_aarch64* target,
	   Sized_relobj_file<size, big_endian>* object,
	   unsigned int data_shndx,
	   Output_section* output_section,
	   const elfcpp::Rela<size, big_endian>& reloc, unsigned int r_type,
	   Symbol* gsym);

    inline bool
    local_reloc_may_be_function_pointer(Symbol_table* , Layout* ,
					Target_aarch64<size, big_endian>* ,
					Sized_relobj_file<size, big_endian>* ,
					unsigned int ,
					Output_section* ,
					const elfcpp::Rela<size, big_endian>& ,
					unsigned int r_type,
					const elfcpp::Sym<size, big_endian>&);

    inline bool
    global_reloc_may_be_function_pointer(Symbol_table* , Layout* ,
					 Target_aarch64<size, big_endian>* ,
					 Sized_relobj_file<size, big_endian>* ,
					 unsigned int ,
					 Output_section* ,
					 const elfcpp::Rela<size, big_endian>& ,
					 unsigned int r_type,
					 Symbol* gsym);

  private:
    static void
    unsupported_reloc_local(Sized_relobj_file<size, big_endian>*,
			    unsigned int r_type);

    static void
    unsupported_reloc_global(Sized_relobj_file<size, big_endian>*,
			     unsigned int r_type, Symbol*);

    inline bool
    possible_function_pointer_reloc(unsigned int r_type);

    void
    check_non_pic(Relobj*, unsigned int r_type);

    // Whether we have issued an error about a non-PIC compilation.
    bool issued_non_pic_error_;
  };

  // The class which implements relocation.
  class Relocate
  {
   public:
    Relocate()
      : skip_call_tls_get_addr_(false)
    { }

    ~Relocate()
    { }

    // Do a relocation.  Return false if the caller should not issue
    // any warnings about this relocation.
    inline bool
    relocate(const Relocate_info<size, big_endian>*, Target_aarch64*,
	     Output_section*,
	     size_t relnum, const elfcpp::Rela<size, big_endian>&,
	     unsigned int r_type, const Sized_symbol<size>*,
	     const Symbol_value<size>*,
	     unsigned char*, typename elfcpp::Elf_types<size>::Elf_Addr,
	     section_size_type);

  private:
    inline typename AArch64_relocate_functions<size,big_endian>::Status
    relocate_tls(const Relocate_info<size,big_endian>*,
		 Target_aarch64<size, big_endian>*,
		 size_t,
		 const elfcpp::Rela<size, big_endian>&,
		 unsigned int r_type, const Sized_symbol<size>*,
		 const Symbol_value<size>*,
		 unsigned char*,
		 typename elfcpp::Elf_types<size>::Elf_Addr);

    inline typename AArch64_relocate_functions<size,big_endian>::Status
    tls_gd_to_le(
		 const Relocate_info<size,big_endian>*,
		 Target_aarch64<size, big_endian>*,
		 const elfcpp::Rela<size, big_endian>&,
		 unsigned int,
		 unsigned char*,
		 const Symbol_value<size>*);

    inline typename AArch64_relocate_functions<size,big_endian>::Status
    tls_ie_to_le(
		 const Relocate_info<size,big_endian>*,
		 Target_aarch64<size, big_endian>*,
		 const elfcpp::Rela<size, big_endian>&,
		 unsigned int,
		 unsigned char*,
		 const Symbol_value<size>*);

    inline typename AArch64_relocate_functions<size,big_endian>::Status
    tls_desc_gd_to_le(
		 const Relocate_info<size,big_endian>*,
		 Target_aarch64<size, big_endian>*,
		 const elfcpp::Rela<size, big_endian>&,
		 unsigned int,
		 unsigned char*,
		 const Symbol_value<size>*);

    inline typename AArch64_relocate_functions<size,big_endian>::Status
    tls_desc_gd_to_ie(
		 const Relocate_info<size,big_endian>*,
		 Target_aarch64<size, big_endian>*,
		 const elfcpp::Rela<size, big_endian>&,
		 unsigned int,
		 unsigned char*,
		 const Symbol_value<size>*,
		 typename elfcpp::Elf_types<size>::Elf_Addr,
		 typename elfcpp::Elf_types<size>::Elf_Addr);

    bool skip_call_tls_get_addr_;

  };  // End of class Relocate

  // A class which returns the size required for a relocation type,
  // used while scanning relocs during a relocatable link.
  class Relocatable_size_for_reloc
  {
   public:
    unsigned int
    get_size_for_reloc(unsigned int, Relobj*);
  };

  // Adjust TLS relocation type based on the options and whether this
  // is a local symbol.
  static tls::Tls_optimization
  optimize_tls_reloc(bool is_final, int r_type);

  // Get the GOT section, creating it if necessary.
  Output_data_got_aarch64<size, big_endian>*
  got_section(Symbol_table*, Layout*);

  // Get the GOT PLT section.
  Output_data_space*
  got_plt_section() const
  {
    gold_assert(this->got_plt_ != NULL);
    return this->got_plt_;
  }

  // Get the GOT section for TLSDESC entries.
  Output_data_got<size, big_endian>*
  got_tlsdesc_section() const
  {
    gold_assert(this->got_tlsdesc_ != NULL);
    return this->got_tlsdesc_;
  }

  // Create the PLT section.
  void
  make_plt_section(Symbol_table* symtab, Layout* layout);

  // Create a PLT entry for a global symbol.
  void
  make_plt_entry(Symbol_table*, Layout*, Symbol*);

  // Create a PLT entry for a local STT_GNU_IFUNC symbol.
  void
  make_local_ifunc_plt_entry(Symbol_table*, Layout*,
			     Sized_relobj_file<size, big_endian>* relobj,
			     unsigned int local_sym_index);

  // Define the _TLS_MODULE_BASE_ symbol in the TLS segment.
  void
  define_tls_base_symbol(Symbol_table*, Layout*);

  // Create the reserved PLT and GOT entries for the TLS descriptor resolver.
  void
  reserve_tlsdesc_entries(Symbol_table* symtab, Layout* layout);

  // Create a GOT entry for the TLS module index.
  unsigned int
  got_mod_index_entry(Symbol_table* symtab, Layout* layout,
		      Sized_relobj_file<size, big_endian>* object);

  // Get the PLT section.
  Output_data_plt_aarch64<size, big_endian>*
  plt_section() const
  {
    gold_assert(this->plt_ != NULL);
    return this->plt_;
  }

  // Get the dynamic reloc section, creating it if necessary.
  Reloc_section*
  rela_dyn_section(Layout*);

  // Get the section to use for TLSDESC relocations.
  Reloc_section*
  rela_tlsdesc_section(Layout*) const;

  // Get the section to use for IRELATIVE relocations.
  Reloc_section*
  rela_irelative_section(Layout*);

  // Add a potential copy relocation.
  void
  copy_reloc(Symbol_table* symtab, Layout* layout,
	     Sized_relobj_file<size, big_endian>* object,
	     unsigned int shndx, Output_section* output_section,
	     Symbol* sym, const elfcpp::Rela<size, big_endian>& reloc)
  {
    this->copy_relocs_.copy_reloc(symtab, layout,
				  symtab->get_sized_symbol<size>(sym),
				  object, shndx, output_section,
				  reloc, this->rela_dyn_section(layout));
  }

  // Information about this specific target which we pass to the
  // general Target structure.
  static const Target::Target_info aarch64_info;

  // The types of GOT entries needed for this platform.
  // These values are exposed to the ABI in an incremental link.
  // Do not renumber existing values without changing the version
  // number of the .gnu_incremental_inputs section.
  enum Got_type
  {
    GOT_TYPE_STANDARD = 0,      // GOT entry for a regular symbol
    GOT_TYPE_TLS_OFFSET = 1,    // GOT entry for TLS offset
    GOT_TYPE_TLS_PAIR = 2,      // GOT entry for TLS module/offset pair
    GOT_TYPE_TLS_DESC = 3       // GOT entry for TLS_DESC pair
  };

  // This type is used as the argument to the target specific
  // relocation routines.  The only target specific reloc is
  // R_AARCh64_TLSDESC against a local symbol.
  struct Tlsdesc_info
  {
    Tlsdesc_info(Sized_relobj_file<size, big_endian>* a_object,
		 unsigned int a_r_sym)
      : object(a_object), r_sym(a_r_sym)
    { }

    // The object in which the local symbol is defined.
    Sized_relobj_file<size, big_endian>* object;
    // The local symbol index in the object.
    unsigned int r_sym;
  };

  // The GOT section.
  Output_data_got_aarch64<size, big_endian>* got_;
  // The PLT section.
  Output_data_plt_aarch64<size, big_endian>* plt_;
  // The GOT PLT section.
  Output_data_space* got_plt_;
  // The GOT section for IRELATIVE relocations.
  Output_data_space* got_irelative_;
  // The GOT section for TLSDESC relocations.
  Output_data_got<size, big_endian>* got_tlsdesc_;
  // The _GLOBAL_OFFSET_TABLE_ symbol.
  Symbol* global_offset_table_;
  // The dynamic reloc section.
  Reloc_section* rela_dyn_;
  // The section to use for IRELATIVE relocs.
  Reloc_section* rela_irelative_;
  // Relocs saved to avoid a COPY reloc.
  Copy_relocs<elfcpp::SHT_RELA, size, big_endian> copy_relocs_;
  // Offset of the GOT entry for the TLS module index.
  unsigned int got_mod_index_offset_;
  // We handle R_AARCH64_TLSDESC against a local symbol as a target
  // specific relocation. Here we store the object and local symbol
  // index for the relocation.
  std::vector<Tlsdesc_info> tlsdesc_reloc_info_;
  // True if the _TLS_MODULE_BASE_ symbol has been defined.
  bool tls_base_symbol_defined_;
};  // End of Target_aarch64


template<>
const Target::Target_info Target_aarch64<64, false>::aarch64_info =
{
  64,			// size
  false,		// is_big_endian
  elfcpp::EM_AARCH64,	// machine_code
  false,		// has_make_symbol
  false,		// has_resolve
  false,		// has_code_fill
  true,			// is_default_stack_executable
  false,		// can_icf_inline_merge_sections
  '\0',			// wrap_char
  "/lib/ld.so.1",	// program interpreter
  0x400000,		// default_text_segment_address
  0x1000,		// abi_pagesize (overridable by -z max-page-size)
  0x1000,		// common_pagesize (overridable by -z common-page-size)
  false,                // isolate_execinstr
  0,                    // rosegment_gap
  elfcpp::SHN_UNDEF,	// small_common_shndx
  elfcpp::SHN_UNDEF,	// large_common_shndx
  0,			// small_common_section_flags
  0,			// large_common_section_flags
  NULL,			// attributes_section
  NULL,			// attributes_vendor
  "_start"		// entry_symbol_name
};

template<>
const Target::Target_info Target_aarch64<32, false>::aarch64_info =
{
  32,			// size
  false,		// is_big_endian
  elfcpp::EM_AARCH64,	// machine_code
  false,		// has_make_symbol
  false,		// has_resolve
  false,		// has_code_fill
  true,			// is_default_stack_executable
  false,		// can_icf_inline_merge_sections
  '\0',			// wrap_char
  "/lib/ld.so.1",	// program interpreter
  0x400000,		// default_text_segment_address
  0x1000,		// abi_pagesize (overridable by -z max-page-size)
  0x1000,		// common_pagesize (overridable by -z common-page-size)
  false,                // isolate_execinstr
  0,                    // rosegment_gap
  elfcpp::SHN_UNDEF,	// small_common_shndx
  elfcpp::SHN_UNDEF,	// large_common_shndx
  0,			// small_common_section_flags
  0,			// large_common_section_flags
  NULL,			// attributes_section
  NULL,			// attributes_vendor
  "_start"		// entry_symbol_name
};

template<>
const Target::Target_info Target_aarch64<64, true>::aarch64_info =
{
  64,			// size
  true,			// is_big_endian
  elfcpp::EM_AARCH64,	// machine_code
  false,		// has_make_symbol
  false,		// has_resolve
  false,		// has_code_fill
  true,			// is_default_stack_executable
  false,		// can_icf_inline_merge_sections
  '\0',			// wrap_char
  "/lib/ld.so.1",	// program interpreter
  0x400000,		// default_text_segment_address
  0x1000,		// abi_pagesize (overridable by -z max-page-size)
  0x1000,		// common_pagesize (overridable by -z common-page-size)
  false,                // isolate_execinstr
  0,                    // rosegment_gap
  elfcpp::SHN_UNDEF,	// small_common_shndx
  elfcpp::SHN_UNDEF,	// large_common_shndx
  0,			// small_common_section_flags
  0,			// large_common_section_flags
  NULL,			// attributes_section
  NULL,			// attributes_vendor
  "_start"		// entry_symbol_name
};

template<>
const Target::Target_info Target_aarch64<32, true>::aarch64_info =
{
  32,			// size
  true,			// is_big_endian
  elfcpp::EM_AARCH64,	// machine_code
  false,		// has_make_symbol
  false,		// has_resolve
  false,		// has_code_fill
  true,			// is_default_stack_executable
  false,		// can_icf_inline_merge_sections
  '\0',			// wrap_char
  "/lib/ld.so.1",	// program interpreter
  0x400000,		// default_text_segment_address
  0x1000,		// abi_pagesize (overridable by -z max-page-size)
  0x1000,		// common_pagesize (overridable by -z common-page-size)
  false,                // isolate_execinstr
  0,                    // rosegment_gap
  elfcpp::SHN_UNDEF,	// small_common_shndx
  elfcpp::SHN_UNDEF,	// large_common_shndx
  0,			// small_common_section_flags
  0,			// large_common_section_flags
  NULL,			// attributes_section
  NULL,			// attributes_vendor
  "_start"		// entry_symbol_name
};

// Get the GOT section, creating it if necessary.

template<int size, bool big_endian>
Output_data_got_aarch64<size, big_endian>*
Target_aarch64<size, big_endian>::got_section(Symbol_table* symtab,
					      Layout* layout)
{
  if (this->got_ == NULL)
    {
      gold_assert(symtab != NULL && layout != NULL);

      // When using -z now, we can treat .got.plt as a relro section.
      // Without -z now, it is modified after program startup by lazy
      // PLT relocations.
      bool is_got_plt_relro = parameters->options().now();
      Output_section_order got_order = (is_got_plt_relro
					? ORDER_RELRO
					: ORDER_RELRO_LAST);
      Output_section_order got_plt_order = (is_got_plt_relro
					    ? ORDER_RELRO
					    : ORDER_NON_RELRO_FIRST);

      // Layout of .got and .got.plt sections.
      // .got[0] &_DYNAMIC                          <-_GLOBAL_OFFSET_TABLE_
      // ...
      // .gotplt[0] reserved for ld.so (&linkmap)   <--DT_PLTGOT
      // .gotplt[1] reserved for ld.so (resolver)
      // .gotplt[2] reserved

      // Generate .got section.
      this->got_ = new Output_data_got_aarch64<size, big_endian>(symtab,
								 layout);
      layout->add_output_section_data(".got", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC | elfcpp::SHF_WRITE),
				      this->got_, got_order, true);
      // The first word of GOT is reserved for the address of .dynamic.
      // We put 0 here now. The value will be replaced later in
      // Output_data_got_aarch64::do_write.
      this->got_->add_constant(0);

      // Define _GLOBAL_OFFSET_TABLE_ at the start of the PLT.
      // _GLOBAL_OFFSET_TABLE_ value points to the start of the .got section,
      // even if there is a .got.plt section.
      this->global_offset_table_ =
	symtab->define_in_output_data("_GLOBAL_OFFSET_TABLE_", NULL,
				      Symbol_table::PREDEFINED,
				      this->got_,
				      0, 0, elfcpp::STT_OBJECT,
				      elfcpp::STB_LOCAL,
				      elfcpp::STV_HIDDEN, 0,
				      false, false);

      // Generate .got.plt section.
      this->got_plt_ = new Output_data_space(size / 8, "** GOT PLT");
      layout->add_output_section_data(".got.plt", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC
				       | elfcpp::SHF_WRITE),
				      this->got_plt_, got_plt_order,
				      is_got_plt_relro);

      // The first three entries are reserved.
      this->got_plt_->set_current_data_size(
	AARCH64_GOTPLT_RESERVE_COUNT * (size / 8));

      // If there are any IRELATIVE relocations, they get GOT entries
      // in .got.plt after the jump slot entries.
      this->got_irelative_ = new Output_data_space(size / 8,
						   "** GOT IRELATIVE PLT");
      layout->add_output_section_data(".got.plt", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC
				       | elfcpp::SHF_WRITE),
				      this->got_irelative_,
				      got_plt_order,
				      is_got_plt_relro);

      // If there are any TLSDESC relocations, they get GOT entries in
      // .got.plt after the jump slot and IRELATIVE entries.
      this->got_tlsdesc_ = new Output_data_got<size, big_endian>();
      layout->add_output_section_data(".got.plt", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC
				       | elfcpp::SHF_WRITE),
				      this->got_tlsdesc_,
				      got_plt_order,
				      is_got_plt_relro);

      if (!is_got_plt_relro)
	{
	  // Those bytes can go into the relro segment.
	  layout->increase_relro(
	    AARCH64_GOTPLT_RESERVE_COUNT * (size / 8));
	}

    }
  return this->got_;
}

// Get the dynamic reloc section, creating it if necessary.

template<int size, bool big_endian>
typename Target_aarch64<size, big_endian>::Reloc_section*
Target_aarch64<size, big_endian>::rela_dyn_section(Layout* layout)
{
  if (this->rela_dyn_ == NULL)
    {
      gold_assert(layout != NULL);
      this->rela_dyn_ = new Reloc_section(parameters->options().combreloc());
      layout->add_output_section_data(".rela.dyn", elfcpp::SHT_RELA,
				      elfcpp::SHF_ALLOC, this->rela_dyn_,
				      ORDER_DYNAMIC_RELOCS, false);
    }
  return this->rela_dyn_;
}

// Get the section to use for IRELATIVE relocs, creating it if
// necessary.  These go in .rela.dyn, but only after all other dynamic
// relocations.  They need to follow the other dynamic relocations so
// that they can refer to global variables initialized by those
// relocs.

template<int size, bool big_endian>
typename Target_aarch64<size, big_endian>::Reloc_section*
Target_aarch64<size, big_endian>::rela_irelative_section(Layout* layout)
{
  if (this->rela_irelative_ == NULL)
    {
      // Make sure we have already created the dynamic reloc section.
      this->rela_dyn_section(layout);
      this->rela_irelative_ = new Reloc_section(false);
      layout->add_output_section_data(".rela.dyn", elfcpp::SHT_RELA,
				      elfcpp::SHF_ALLOC, this->rela_irelative_,
				      ORDER_DYNAMIC_RELOCS, false);
      gold_assert(this->rela_dyn_->output_section()
		  == this->rela_irelative_->output_section());
    }
  return this->rela_irelative_;
}


// A class to handle the PLT data.
// This is an abstract base class that handles most of the linker details
// but does not know the actual contents of PLT entries.  The derived
// classes below fill in those details.

template<int size, bool big_endian>
class Output_data_plt_aarch64 : public Output_section_data
{
 public:
  typedef Output_data_reloc<elfcpp::SHT_RELA, true, size, big_endian>
      Reloc_section;
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Address;

  Output_data_plt_aarch64(Layout* layout,
			  uint64_t addralign,
			  Output_data_got_aarch64<size, big_endian>* got,
			  Output_data_space* got_plt,
			  Output_data_space* got_irelative)
    : Output_section_data(addralign), tlsdesc_rel_(NULL),
      got_(got), got_plt_(got_plt), got_irelative_(got_irelative),
      count_(0), irelative_count_(0), tlsdesc_got_offset_(-1U)
  { this->init(layout); }

  // Initialize the PLT section.
  void
  init(Layout* layout);

  // Add an entry to the PLT.
  void
  add_entry(Symbol* gsym);

  // Add the reserved TLSDESC_PLT entry to the PLT.
  void
  reserve_tlsdesc_entry(unsigned int got_offset)
  { this->tlsdesc_got_offset_ = got_offset; }

  // Return true if a TLSDESC_PLT entry has been reserved.
  bool
  has_tlsdesc_entry() const
  { return this->tlsdesc_got_offset_ != -1U; }

  // Return the GOT offset for the reserved TLSDESC_PLT entry.
  unsigned int
  get_tlsdesc_got_offset() const
  { return this->tlsdesc_got_offset_; }

  // Return the PLT offset of the reserved TLSDESC_PLT entry.
  unsigned int
  get_tlsdesc_plt_offset() const
  {
    return (this->first_plt_entry_offset() +
	    (this->count_ + this->irelative_count_)
	    * this->get_plt_entry_size());
  }

  // Return the .rela.plt section data.
  Reloc_section*
  rela_plt()
  { return this->rel_; }

  // Return where the TLSDESC relocations should go.
  Reloc_section*
  rela_tlsdesc(Layout*);

  // Return where the IRELATIVE relocations should go in the PLT
  // relocations.
  Reloc_section*
  rela_irelative(Symbol_table*, Layout*);

  // Return whether we created a section for IRELATIVE relocations.
  bool
  has_irelative_section() const
  { return this->irelative_rel_ != NULL; }

  // Return the number of PLT entries.
  unsigned int
  entry_count() const
  { return this->count_ + this->irelative_count_; }

  // Return the offset of the first non-reserved PLT entry.
  unsigned int
  first_plt_entry_offset() const
  { return this->do_first_plt_entry_offset(); }

  // Return the size of a PLT entry.
  unsigned int
  get_plt_entry_size() const
  { return this->do_get_plt_entry_size(); }

  // Return the reserved tlsdesc entry size.
  unsigned int
  get_plt_tlsdesc_entry_size() const
  { return this->do_get_plt_tlsdesc_entry_size(); }

  // Return the PLT address to use for a global symbol.
  uint64_t
  address_for_global(const Symbol*);

  // Return the PLT address to use for a local symbol.
  uint64_t
  address_for_local(const Relobj*, unsigned int symndx);

 protected:
  // Fill in the first PLT entry.
  void
  fill_first_plt_entry(unsigned char* pov,
		       Address got_address,
		       Address plt_address)
  { this->do_fill_first_plt_entry(pov, got_address, plt_address); }

  // Fill in a normal PLT entry.
  void
  fill_plt_entry(unsigned char* pov,
		 Address got_address,
		 Address plt_address,
		 unsigned int got_offset,
		 unsigned int plt_offset)
  {
    this->do_fill_plt_entry(pov, got_address, plt_address,
			    got_offset, plt_offset);
  }

  // Fill in the reserved TLSDESC PLT entry.
  void
  fill_tlsdesc_entry(unsigned char* pov,
		     Address gotplt_address,
		     Address plt_address,
		     Address got_base,
		     unsigned int tlsdesc_got_offset,
		     unsigned int plt_offset)
  {
    this->do_fill_tlsdesc_entry(pov, gotplt_address, plt_address, got_base,
				tlsdesc_got_offset, plt_offset);
  }

  virtual unsigned int
  do_first_plt_entry_offset() const = 0;

  virtual unsigned int
  do_get_plt_entry_size() const = 0;

  virtual unsigned int
  do_get_plt_tlsdesc_entry_size() const = 0;

  virtual void
  do_fill_first_plt_entry(unsigned char* pov,
			  Address got_addr,
			  Address plt_addr) = 0;

  virtual void
  do_fill_plt_entry(unsigned char* pov,
		    Address got_address,
		    Address plt_address,
		    unsigned int got_offset,
		    unsigned int plt_offset) = 0;

  virtual void
  do_fill_tlsdesc_entry(unsigned char* pov,
			Address gotplt_address,
			Address plt_address,
			Address got_base,
			unsigned int tlsdesc_got_offset,
			unsigned int plt_offset) = 0;

  void
  do_adjust_output_section(Output_section* os);

  // Write to a map file.
  void
  do_print_to_mapfile(Mapfile* mapfile) const
  { mapfile->print_output_data(this, _("** PLT")); }

 private:
  // Set the final size.
  void
  set_final_data_size();

  // Write out the PLT data.
  void
  do_write(Output_file*);

  // The reloc section.
  Reloc_section* rel_;

  // The TLSDESC relocs, if necessary.  These must follow the regular
  // PLT relocs.
  Reloc_section* tlsdesc_rel_;

  // The IRELATIVE relocs, if necessary.  These must follow the
  // regular PLT relocations.
  Reloc_section* irelative_rel_;

  // The .got section.
  Output_data_got_aarch64<size, big_endian>* got_;

  // The .got.plt section.
  Output_data_space* got_plt_;

  // The part of the .got.plt section used for IRELATIVE relocs.
  Output_data_space* got_irelative_;

  // The number of PLT entries.
  unsigned int count_;

  // Number of PLT entries with R_X86_64_IRELATIVE relocs.  These
  // follow the regular PLT entries.
  unsigned int irelative_count_;

  // GOT offset of the reserved TLSDESC_GOT entry for the lazy trampoline.
  // Communicated to the loader via DT_TLSDESC_GOT. The magic value -1
  // indicates an offset is not allocated.
  unsigned int tlsdesc_got_offset_;
};

// Initialize the PLT section.

template<int size, bool big_endian>
void
Output_data_plt_aarch64<size, big_endian>::init(Layout* layout)
{
  this->rel_ = new Reloc_section(false);
  layout->add_output_section_data(".rela.plt", elfcpp::SHT_RELA,
				  elfcpp::SHF_ALLOC, this->rel_,
				  ORDER_DYNAMIC_PLT_RELOCS, false);
}

template<int size, bool big_endian>
void
Output_data_plt_aarch64<size, big_endian>::do_adjust_output_section(
    Output_section* os)
{
  os->set_entsize(this->get_plt_entry_size());
}

// Add an entry to the PLT.

template<int size, bool big_endian>
void
Output_data_plt_aarch64<size, big_endian>::add_entry(Symbol* gsym)
{
  gold_assert(!gsym->has_plt_offset());

  gsym->set_plt_offset((this->count_) * this->get_plt_entry_size()
		       + this->first_plt_entry_offset());

  ++this->count_;

  section_offset_type got_offset = this->got_plt_->current_data_size();

  // Every PLT entry needs a GOT entry which points back to the PLT
  // entry (this will be changed by the dynamic linker, normally
  // lazily when the function is called).
  this->got_plt_->set_current_data_size(got_offset + size / 8);

  // Every PLT entry needs a reloc.
  gsym->set_needs_dynsym_entry();
  this->rel_->add_global(gsym, elfcpp::R_AARCH64_JUMP_SLOT,
			 this->got_plt_, got_offset, 0);

  // Note that we don't need to save the symbol. The contents of the
  // PLT are independent of which symbols are used. The symbols only
  // appear in the relocations.
}

// Return where the TLSDESC relocations should go, creating it if
// necessary.  These follow the JUMP_SLOT relocations.

template<int size, bool big_endian>
typename Output_data_plt_aarch64<size, big_endian>::Reloc_section*
Output_data_plt_aarch64<size, big_endian>::rela_tlsdesc(Layout* layout)
{
  if (this->tlsdesc_rel_ == NULL)
    {
      this->tlsdesc_rel_ = new Reloc_section(false);
      layout->add_output_section_data(".rela.plt", elfcpp::SHT_RELA,
				      elfcpp::SHF_ALLOC, this->tlsdesc_rel_,
				      ORDER_DYNAMIC_PLT_RELOCS, false);
      gold_assert(this->tlsdesc_rel_->output_section()
		  == this->rel_->output_section());
    }
  return this->tlsdesc_rel_;
}

// Return where the IRELATIVE relocations should go in the PLT.  These
// follow the JUMP_SLOT and the TLSDESC relocations.

template<int size, bool big_endian>
typename Output_data_plt_aarch64<size, big_endian>::Reloc_section*
Output_data_plt_aarch64<size, big_endian>::rela_irelative(Symbol_table* symtab,
							  Layout* layout)
{
  if (this->irelative_rel_ == NULL)
    {
      // Make sure we have a place for the TLSDESC relocations, in
      // case we see any later on.
      this->rela_tlsdesc(layout);
      this->irelative_rel_ = new Reloc_section(false);
      layout->add_output_section_data(".rela.plt", elfcpp::SHT_RELA,
				      elfcpp::SHF_ALLOC, this->irelative_rel_,
				      ORDER_DYNAMIC_PLT_RELOCS, false);
      gold_assert(this->irelative_rel_->output_section()
		  == this->rel_->output_section());

      if (parameters->doing_static_link())
	{
	  // A statically linked executable will only have a .rela.plt
	  // section to hold R_AARCH64_IRELATIVE relocs for
	  // STT_GNU_IFUNC symbols.  The library will use these
	  // symbols to locate the IRELATIVE relocs at program startup
	  // time.
	  symtab->define_in_output_data("__rela_iplt_start", NULL,
					Symbol_table::PREDEFINED,
					this->irelative_rel_, 0, 0,
					elfcpp::STT_NOTYPE, elfcpp::STB_GLOBAL,
					elfcpp::STV_HIDDEN, 0, false, true);
	  symtab->define_in_output_data("__rela_iplt_end", NULL,
					Symbol_table::PREDEFINED,
					this->irelative_rel_, 0, 0,
					elfcpp::STT_NOTYPE, elfcpp::STB_GLOBAL,
					elfcpp::STV_HIDDEN, 0, true, true);
	}
    }
  return this->irelative_rel_;
}

// Return the PLT address to use for a global symbol.

template<int size, bool big_endian>
uint64_t
Output_data_plt_aarch64<size, big_endian>::address_for_global(
  const Symbol* gsym)
{
  uint64_t offset = 0;
  if (gsym->type() == elfcpp::STT_GNU_IFUNC
      && gsym->can_use_relative_reloc(false))
    offset = (this->first_plt_entry_offset() +
	      this->count_ * this->get_plt_entry_size());
  return this->address() + offset + gsym->plt_offset();
}

// Return the PLT address to use for a local symbol.  These are always
// IRELATIVE relocs.

template<int size, bool big_endian>
uint64_t
Output_data_plt_aarch64<size, big_endian>::address_for_local(
    const Relobj* object,
    unsigned int r_sym)
{
  return (this->address()
	  + this->first_plt_entry_offset()
	  + this->count_ * this->get_plt_entry_size()
	  + object->local_plt_offset(r_sym));
}

// Set the final size.

template<int size, bool big_endian>
void
Output_data_plt_aarch64<size, big_endian>::set_final_data_size()
{
  unsigned int count = this->count_ + this->irelative_count_;
  unsigned int extra_size = 0;
  if (this->has_tlsdesc_entry())
    extra_size += this->get_plt_tlsdesc_entry_size();
  this->set_data_size(this->first_plt_entry_offset()
		      + count * this->get_plt_entry_size()
		      + extra_size);
}

template<int size, bool big_endian>
class Output_data_plt_aarch64_standard :
  public Output_data_plt_aarch64<size, big_endian>
{
 public:
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Address;
  Output_data_plt_aarch64_standard(
      Layout* layout,
      Output_data_got_aarch64<size, big_endian>* got,
      Output_data_space* got_plt,
      Output_data_space* got_irelative)
    : Output_data_plt_aarch64<size, big_endian>(layout,
						size == 32 ? 4 : 8,
						got, got_plt,
						got_irelative)
  { }

 protected:
  // Return the offset of the first non-reserved PLT entry.
  virtual unsigned int
  do_first_plt_entry_offset() const
  { return this->first_plt_entry_size; }

  // Return the size of a PLT entry
  virtual unsigned int
  do_get_plt_entry_size() const
  { return this->plt_entry_size; }

  // Return the size of a tlsdesc entry
  virtual unsigned int
  do_get_plt_tlsdesc_entry_size() const
  { return this->plt_tlsdesc_entry_size; }

  virtual void
  do_fill_first_plt_entry(unsigned char* pov,
			  Address got_address,
			  Address plt_address);

  virtual void
  do_fill_plt_entry(unsigned char* pov,
		    Address got_address,
		    Address plt_address,
		    unsigned int got_offset,
		    unsigned int plt_offset);

  virtual void
  do_fill_tlsdesc_entry(unsigned char* pov,
			Address gotplt_address,
			Address plt_address,
			Address got_base,
			unsigned int tlsdesc_got_offset,
			unsigned int plt_offset);

 private:
  // The size of the first plt entry size.
  static const int first_plt_entry_size = 32;
  // The size of the plt entry size.
  static const int plt_entry_size = 16;
  // The size of the plt tlsdesc entry size.
  static const int plt_tlsdesc_entry_size = 32;
  // Template for the first PLT entry.
  static const uint32_t first_plt_entry[first_plt_entry_size / 4];
  // Template for subsequent PLT entries.
  static const uint32_t plt_entry[plt_entry_size / 4];
  // The reserved TLSDESC entry in the PLT for an executable.
  static const uint32_t tlsdesc_plt_entry[plt_tlsdesc_entry_size / 4];
};

// The first entry in the PLT for an executable.

template<>
const uint32_t
Output_data_plt_aarch64_standard<32, false>::
    first_plt_entry[first_plt_entry_size / 4] =
{
  0xa9bf7bf0,	/* stp x16, x30, [sp, #-16]!  */
  0x90000010,	/* adrp x16, PLT_GOT+0x8  */
  0xb9400A11,	/* ldr w17, [x16, #PLT_GOT+0x8]  */
  0x11002210,	/* add w16, w16,#PLT_GOT+0x8   */
  0xd61f0220,	/* br x17  */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<32, true>::
    first_plt_entry[first_plt_entry_size / 4] =
{
  0xa9bf7bf0,	/* stp x16, x30, [sp, #-16]!  */
  0x90000010,	/* adrp x16, PLT_GOT+0x8  */
  0xb9400A11,	/* ldr w17, [x16, #PLT_GOT+0x8]  */
  0x11002210,	/* add w16, w16,#PLT_GOT+0x8   */
  0xd61f0220,	/* br x17  */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, false>::
    first_plt_entry[first_plt_entry_size / 4] =
{
  0xa9bf7bf0,	/* stp x16, x30, [sp, #-16]!  */
  0x90000010,	/* adrp x16, PLT_GOT+16  */
  0xf9400A11,	/* ldr x17, [x16, #PLT_GOT+0x10]  */
  0x91004210,	/* add x16, x16,#PLT_GOT+0x10   */
  0xd61f0220,	/* br x17  */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, true>::
    first_plt_entry[first_plt_entry_size / 4] =
{
  0xa9bf7bf0,	/* stp x16, x30, [sp, #-16]!  */
  0x90000010,	/* adrp x16, PLT_GOT+16  */
  0xf9400A11,	/* ldr x17, [x16, #PLT_GOT+0x10]  */
  0x91004210,	/* add x16, x16,#PLT_GOT+0x10   */
  0xd61f0220,	/* br x17  */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<32, false>::
    plt_entry[plt_entry_size / 4] =
{
  0x90000010,	/* adrp x16, PLTGOT + n * 4  */
  0xb9400211,	/* ldr w17, [w16, PLTGOT + n * 4] */
  0x11000210,	/* add w16, w16, :lo12:PLTGOT + n * 4  */
  0xd61f0220,	/* br x17.  */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<32, true>::
    plt_entry[plt_entry_size / 4] =
{
  0x90000010,	/* adrp x16, PLTGOT + n * 4  */
  0xb9400211,	/* ldr w17, [w16, PLTGOT + n * 4] */
  0x11000210,	/* add w16, w16, :lo12:PLTGOT + n * 4  */
  0xd61f0220,	/* br x17.  */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, false>::
    plt_entry[plt_entry_size / 4] =
{
  0x90000010,	/* adrp x16, PLTGOT + n * 8  */
  0xf9400211,	/* ldr x17, [x16, PLTGOT + n * 8] */
  0x91000210,	/* add x16, x16, :lo12:PLTGOT + n * 8  */
  0xd61f0220,	/* br x17.  */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, true>::
    plt_entry[plt_entry_size / 4] =
{
  0x90000010,	/* adrp x16, PLTGOT + n * 8  */
  0xf9400211,	/* ldr x17, [x16, PLTGOT + n * 8] */
  0x91000210,	/* add x16, x16, :lo12:PLTGOT + n * 8  */
  0xd61f0220,	/* br x17.  */
};

template<int size, bool big_endian>
void
Output_data_plt_aarch64_standard<size, big_endian>::do_fill_first_plt_entry(
    unsigned char* pov,
    Address got_address,
    Address plt_address)
{
  // PLT0 of the small PLT looks like this in ELF64 -
  // stp x16, x30, [sp, #-16]!	 	Save the reloc and lr on stack.
  // adrp x16, PLT_GOT + 16		Get the page base of the GOTPLT
  // ldr  x17, [x16, #:lo12:PLT_GOT+16]	Load the address of the
  // 					symbol resolver
  // add  x16, x16, #:lo12:PLT_GOT+16	Load the lo12 bits of the
  // 					GOTPLT entry for this.
  // br   x17
  // PLT0 will be slightly different in ELF32 due to different got entry
  // size.
  memcpy(pov, this->first_plt_entry, this->first_plt_entry_size);
  Address gotplt_2nd_ent = got_address + (size / 8) * 2;

  // Fill in the top 21 bits for this: ADRP x16, PLT_GOT + 8 * 2.
  // ADRP:  (PG(S+A)-PG(P)) >> 12) & 0x1fffff.
  // FIXME: This only works for 64bit
  AArch64_relocate_functions<size, big_endian>::adrp(pov + 4,
      gotplt_2nd_ent, plt_address + 4);

  // Fill in R_AARCH64_LDST8_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 8,
      ((this->first_plt_entry[2] & 0xffc003ff)
       | ((gotplt_2nd_ent & 0xff8) << 7)));

  // Fill in R_AARCH64_ADD_ABS_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 12,
      ((this->first_plt_entry[3] & 0xffc003ff)
       | ((gotplt_2nd_ent & 0xfff) << 10)));
}

// Subsequent entries in the PLT for an executable.
// FIXME: This only works for 64bit

template<int size, bool big_endian>
void
Output_data_plt_aarch64_standard<size, big_endian>::do_fill_plt_entry(
    unsigned char* pov,
    Address got_address,
    Address plt_address,
    unsigned int got_offset,
    unsigned int plt_offset)
{
  memcpy(pov, this->plt_entry, this->plt_entry_size);

  Address gotplt_entry_address = got_address + got_offset;
  Address plt_entry_address = plt_address + plt_offset;

  // Fill in R_AARCH64_PCREL_ADR_HI21
  AArch64_relocate_functions<size, big_endian>::adrp(
      pov,
      gotplt_entry_address,
      plt_entry_address);

  // Fill in R_AARCH64_LDST64_ABS_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 4,
      ((this->plt_entry[1] & 0xffc003ff)
       | ((gotplt_entry_address & 0xff8) << 7)));

  // Fill in R_AARCH64_ADD_ABS_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 8,
      ((this->plt_entry[2] & 0xffc003ff)
       | ((gotplt_entry_address & 0xfff) <<10)));

}


template<>
const uint32_t
Output_data_plt_aarch64_standard<32, false>::
    tlsdesc_plt_entry[plt_tlsdesc_entry_size / 4] =
{
  0xa9bf0fe2,	/* stp x2, x3, [sp, #-16]!  */
  0x90000002,	/* adrp x2, 0 */
  0x90000003,	/* adrp x3, 0 */
  0xb9400042,	/* ldr w2, [w2, #0] */
  0x11000063,	/* add w3, w3, 0 */
  0xd61f0040,	/* br x2 */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<32, true>::
    tlsdesc_plt_entry[plt_tlsdesc_entry_size / 4] =
{
  0xa9bf0fe2,	/* stp x2, x3, [sp, #-16]!  */
  0x90000002,	/* adrp x2, 0 */
  0x90000003,	/* adrp x3, 0 */
  0xb9400042,	/* ldr w2, [w2, #0] */
  0x11000063,	/* add w3, w3, 0 */
  0xd61f0040,	/* br x2 */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, false>::
    tlsdesc_plt_entry[plt_tlsdesc_entry_size / 4] =
{
  0xa9bf0fe2,	/* stp x2, x3, [sp, #-16]!  */
  0x90000002,	/* adrp x2, 0 */
  0x90000003,	/* adrp x3, 0 */
  0xf9400042,	/* ldr x2, [x2, #0] */
  0x91000063,	/* add x3, x3, 0 */
  0xd61f0040,	/* br x2 */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<>
const uint32_t
Output_data_plt_aarch64_standard<64, true>::
    tlsdesc_plt_entry[plt_tlsdesc_entry_size / 4] =
{
  0xa9bf0fe2,	/* stp x2, x3, [sp, #-16]!  */
  0x90000002,	/* adrp x2, 0 */
  0x90000003,	/* adrp x3, 0 */
  0xf9400042,	/* ldr x2, [x2, #0] */
  0x91000063,	/* add x3, x3, 0 */
  0xd61f0040,	/* br x2 */
  0xd503201f,	/* nop */
  0xd503201f,	/* nop */
};

template<int size, bool big_endian>
void
Output_data_plt_aarch64_standard<size, big_endian>::do_fill_tlsdesc_entry(
    unsigned char* pov,
    Address gotplt_address,
    Address plt_address,
    Address got_base,
    unsigned int tlsdesc_got_offset,
    unsigned int plt_offset)
{
  memcpy(pov, tlsdesc_plt_entry, plt_tlsdesc_entry_size);

  // move DT_TLSDESC_GOT address into x2
  // move .got.plt address into x3
  Address tlsdesc_got_entry = got_base + tlsdesc_got_offset;
  Address plt_entry_address = plt_address + plt_offset;

  // R_AARCH64_ADR_PREL_PG_HI21
  AArch64_relocate_functions<size, big_endian>::adrp(
      pov + 4,
      tlsdesc_got_entry,
      plt_entry_address + 4);

  // R_AARCH64_ADR_PREL_PG_HI21
  AArch64_relocate_functions<size, big_endian>::adrp(
      pov + 8,
      gotplt_address,
      plt_entry_address + 8);

  // R_AARCH64_LDST64_ABS_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 12,
      ((this->tlsdesc_plt_entry[3] & 0xffc003ff)
       | ((tlsdesc_got_entry & 0xff8) << 7)));

  // R_AARCH64_ADD_ABS_LO12
  elfcpp::Swap<32, big_endian>::writeval(
      pov + 16,
      ((this->tlsdesc_plt_entry[4] & 0xffc003ff)
       | ((gotplt_address & 0xfff) << 10)));
}

// Write out the PLT.  This uses the hand-coded instructions above,
// and adjusts them as needed.  This is specified by the AMD64 ABI.

template<int size, bool big_endian>
void
Output_data_plt_aarch64<size, big_endian>::do_write(Output_file* of)
{
  const off_t offset = this->offset();
  const section_size_type oview_size =
    convert_to_section_size_type(this->data_size());
  unsigned char* const oview = of->get_output_view(offset, oview_size);

  const off_t got_file_offset = this->got_plt_->offset();
  const section_size_type got_size =
    convert_to_section_size_type(this->got_plt_->data_size());
  unsigned char* const got_view = of->get_output_view(got_file_offset,
						      got_size);

  unsigned char* pov = oview;

  // The base address of the .plt section.
  typename elfcpp::Elf_types<size>::Elf_Addr plt_address = this->address();
  // The base address of the PLT portion of the .got section.
  typename elfcpp::Elf_types<size>::Elf_Addr gotplt_address
      = this->got_plt_->address();

  this->fill_first_plt_entry(pov, gotplt_address, plt_address);
  pov += this->first_plt_entry_offset();

  // The first three entries in .got.plt are reserved.
  unsigned char* got_pov = got_view;
  memset(got_pov, 0, size / 8 * AARCH64_GOTPLT_RESERVE_COUNT);
  got_pov += (size / 8) * AARCH64_GOTPLT_RESERVE_COUNT;

  unsigned int plt_offset = this->first_plt_entry_offset();
  unsigned int got_offset = (size / 8) * AARCH64_GOTPLT_RESERVE_COUNT;
  const unsigned int count = this->count_ + this->irelative_count_;
  for (unsigned int plt_index = 0;
       plt_index < count;
       ++plt_index,
	 pov += this->get_plt_entry_size(),
	 got_pov += size / 8,
	 plt_offset += this->get_plt_entry_size(),
	 got_offset += size / 8)
    {
      // Set and adjust the PLT entry itself.
      this->fill_plt_entry(pov, gotplt_address, plt_address,
			   got_offset, plt_offset);

      // Set the entry in the GOT, which points to plt0.
      elfcpp::Swap<size, big_endian>::writeval(got_pov, plt_address);
    }

  if (this->has_tlsdesc_entry())
    {
      // Set and adjust the reserved TLSDESC PLT entry.
      unsigned int tlsdesc_got_offset = this->get_tlsdesc_got_offset();
      // The base address of the .base section.
      typename elfcpp::Elf_types<size>::Elf_Addr got_base =
	  this->got_->address();
      this->fill_tlsdesc_entry(pov, gotplt_address, plt_address, got_base,
			       tlsdesc_got_offset, plt_offset);
      pov += this->get_plt_tlsdesc_entry_size();
    }

  gold_assert(static_cast<section_size_type>(pov - oview) == oview_size);
  gold_assert(static_cast<section_size_type>(got_pov - got_view) == got_size);

  of->write_output_view(offset, oview_size, oview);
  of->write_output_view(got_file_offset, got_size, got_view);
}

// Telling how to update the immediate field of an instruction.
struct AArch64_howto
{
  // The immediate field mask.
  elfcpp::Elf_Xword dst_mask;

  // The offset to apply relocation immediate
  int doffset;

  // The second part offset, if the immediate field has two parts.
  // -1 if the immediate field has only one part.
  int doffset2;
};

static const AArch64_howto aarch64_howto[AArch64_reloc_property::INST_NUM] =
{
  {0, -1, -1},		// DATA
  {0x1fffe0, 5, -1},	// MOVW  [20:5]-imm16
  {0xffffe0, 5, -1},	// LD    [23:5]-imm19
  {0x60ffffe0, 29, 5},	// ADR   [30:29]-immlo  [23:5]-immhi
  {0x60ffffe0, 29, 5},	// ADRP  [30:29]-immlo  [23:5]-immhi
  {0x3ffc00, 10, -1},	// ADD   [21:10]-imm12
  {0x3ffc00, 10, -1},	// LDST  [21:10]-imm12
  {0x7ffe0, 5, -1},	// TBZNZ [18:5]-imm14
  {0xffffe0, 5, -1},	// CONDB [23:5]-imm19
  {0x3ffffff, 0, -1},	// B     [25:0]-imm26
  {0x3ffffff, 0, -1},	// CALL  [25:0]-imm26
};

// AArch64 relocate function class

template<int size, bool big_endian>
class AArch64_relocate_functions
{
 public:
  typedef enum
  {
    STATUS_OKAY,	// No error during relocation.
    STATUS_OVERFLOW,	// Relocation overflow.
    STATUS_BAD_RELOC,	// Relocation cannot be applied.
  } Status;

 private:
  typedef AArch64_relocate_functions<size, big_endian> This;
  typedef typename elfcpp::Elf_types<size>::Elf_Addr Address;

  // Return the page address of the address.
  // Page(address) = address & ~0xFFF

  static inline typename elfcpp::Swap<size, big_endian>::Valtype
  Page(Address address)
  {
    return (address & (~static_cast<Address>(0xFFF)));
  }

  // Update instruction (pointed by view) with selected bits (immed).
  // val = (val & ~dst_mask) | (immed << doffset)

  template<int valsize>
  static inline void
  update_view(unsigned char* view,
	      typename elfcpp::Swap<size, big_endian>::Valtype immed,
	      elfcpp::Elf_Xword doffset,
	      elfcpp::Elf_Xword dst_mask)
  {
    typedef typename elfcpp::Swap<valsize, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<valsize, big_endian>::readval(wv);

    // Clear immediate fields.
    val &= ~dst_mask;
    elfcpp::Swap<valsize, big_endian>::writeval(wv,
      static_cast<Valtype>(val | (immed << doffset)));
  }

  // Update two parts of an instruction (pointed by view) with selected
  // bits (immed1 and immed2).
  // val = (val & ~dst_mask) | (immed1 << doffset1) | (immed2 << doffset2)

  template<int valsize>
  static inline void
  update_view_two_parts(
    unsigned char* view,
    typename elfcpp::Swap<size, big_endian>::Valtype immed1,
    typename elfcpp::Swap<size, big_endian>::Valtype immed2,
    elfcpp::Elf_Xword doffset1,
    elfcpp::Elf_Xword doffset2,
    elfcpp::Elf_Xword dst_mask)
  {
    typedef typename elfcpp::Swap<valsize, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<valsize, big_endian>::readval(wv);
    val &= ~dst_mask;
    elfcpp::Swap<valsize, big_endian>::writeval(wv,
      static_cast<Valtype>(val | (immed1 << doffset1) |
			   (immed2 << doffset2)));
  }

  // Update adr or adrp instruction with [32:12] of X.
  // In adr and adrp: [30:29] immlo   [23:5] immhi

  static inline void
  update_adr(unsigned char* view,
	     typename elfcpp::Swap<size, big_endian>::Valtype x,
	     const AArch64_reloc_property* /* reloc_property */)
  {
    elfcpp::Elf_Xword dst_mask = (0x3 << 29) | (0x7ffff << 5);
    typename elfcpp::Swap<32, big_endian>::Valtype immed =
      (x >> 12) & 0x1fffff;
    This::template update_view_two_parts<32>(
      view,
      immed & 0x3,
      (immed & 0x1ffffc) >> 2,
      29,
      5,
      dst_mask);
  }

  // Update movz/movn instruction with bits immed.
  // Set instruction to movz if is_movz is true, otherwise set instruction
  // to movn.
  static inline void
  update_movnz(unsigned char* view,
	       typename elfcpp::Swap<size, big_endian>::Valtype immed,
	       bool is_movz)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);

    const elfcpp::Elf_Xword doffset =
	aarch64_howto[AArch64_reloc_property::INST_MOVW].doffset;
    const elfcpp::Elf_Xword dst_mask =
	aarch64_howto[AArch64_reloc_property::INST_MOVW].dst_mask;

    // Clear immediate fields and opc code.
    val &= ~(dst_mask | (0x11 << 29));

    // Set instruction to movz or movn.
    // movz: [30:29] is 10   movn: [30:29] is 00
    if (is_movz)
      val |= (0x10 << 29);

    elfcpp::Swap<32, big_endian>::writeval(wv,
      static_cast<Valtype>(val | (immed << doffset)));
  }

 public:

  // Do a simple rela relocation at unaligned addresses.

  template<int valsize>
  static inline typename This::Status
  rela_ua(unsigned char* view,
	  const Sized_relobj_file<size, big_endian>* object,
	  const Symbol_value<size>* psymval,
	  typename elfcpp::Swap<size, big_endian>::Valtype addend,
	  const AArch64_reloc_property* reloc_property)
  {
    typedef typename elfcpp::Swap_unaligned<valsize, big_endian>::Valtype
      Valtype;
    typename elfcpp::Elf_types<size>::Elf_Addr x =
	psymval->value(object, addend);
    elfcpp::Swap_unaligned<valsize, big_endian>::writeval(view,
      static_cast<Valtype>(x));
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Do a simple pc-relative relocation at unaligned addresses.

  template<int valsize>
  static inline typename This::Status
  pcrela_ua(unsigned char* view,
	    const Sized_relobj_file<size, big_endian>* object,
	    const Symbol_value<size>* psymval,
	    typename elfcpp::Swap<size, big_endian>::Valtype addend,
	    Address address,
	    const AArch64_reloc_property* reloc_property)
  {
    typedef typename elfcpp::Swap_unaligned<valsize, big_endian>::Valtype
      Valtype;
    Address x = psymval->value(object, addend) - address;
    elfcpp::Swap_unaligned<valsize, big_endian>::writeval(view,
      static_cast<Valtype>(x));
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Do a simple rela relocation at aligned addresses.

  template<int valsize>
  static inline typename This::Status
  rela(
    unsigned char* view,
    const Sized_relobj_file<size, big_endian>* object,
    const Symbol_value<size>* psymval,
    typename elfcpp::Swap<size, big_endian>::Valtype addend,
    const AArch64_reloc_property* reloc_property)
  {
    typedef typename elfcpp::Swap<valsize, big_endian>::Valtype
      Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Address x = psymval->value(object, addend);
    elfcpp::Swap<valsize, big_endian>::writeval(wv,
      static_cast<Valtype>(x));
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Do relocate. Update selected bits in text.
  // new_val = (val & ~dst_mask) | (immed << doffset)

  template<int valsize>
  static inline typename This::Status
  rela_general(unsigned char* view,
	       const Sized_relobj_file<size, big_endian>* object,
	       const Symbol_value<size>* psymval,
	       typename elfcpp::Swap<size, big_endian>::Valtype addend,
	       const AArch64_reloc_property* reloc_property)
  {
    // Calculate relocation.
    Address x =	psymval->value(object, addend);

    // Select bits from X.
    Address immed = reloc_property->select_x_value(x);

    // Update view.
    const AArch64_reloc_property::Reloc_inst inst =
	reloc_property->reloc_inst();
    // If it is a data relocation or instruction has 2 parts of immediate
    // fields, you should not call rela_general.
    gold_assert(aarch64_howto[inst].doffset2 == -1 &&
		aarch64_howto[inst].doffset != -1);
    This::template update_view<valsize>(view, immed,
					aarch64_howto[inst].doffset,
					aarch64_howto[inst].dst_mask);

    // Do check overflow or alignment if needed.
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Do relocate. Update selected bits in text.
  // new val = (val & ~dst_mask) | (immed << doffset)

  template<int valsize>
  static inline typename This::Status
  rela_general(
    unsigned char* view,
    typename elfcpp::Swap<size, big_endian>::Valtype s,
    typename elfcpp::Swap<size, big_endian>::Valtype addend,
    const AArch64_reloc_property* reloc_property)
  {
    // Calculate relocation.
    Address x = s + addend;

    // Select bits from X.
    Address immed = reloc_property->select_x_value(x);

    // Update view.
    const AArch64_reloc_property::Reloc_inst inst =
	reloc_property->reloc_inst();
    // If it is a data relocation or instruction has 2 parts of immediate
    // fields, you should not call rela_general.
    gold_assert(aarch64_howto[inst].doffset2 == -1 &&
		aarch64_howto[inst].doffset != -1);
    This::template update_view<valsize>(view, immed,
					aarch64_howto[inst].doffset,
					aarch64_howto[inst].dst_mask);

    // Do check overflow or alignment if needed.
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Do address relative relocate. Update selected bits in text.
  // new val = (val & ~dst_mask) | (immed << doffset)

  template<int valsize>
  static inline typename This::Status
  pcrela_general(
    unsigned char* view,
    const Sized_relobj_file<size, big_endian>* object,
    const Symbol_value<size>* psymval,
    typename elfcpp::Swap<size, big_endian>::Valtype addend,
    Address address,
    const AArch64_reloc_property* reloc_property)
  {
    // Calculate relocation.
    Address x = psymval->value(object, addend) - address;

    // Select bits from X.
    Address immed = reloc_property->select_x_value(x);

    // Update view.
    const AArch64_reloc_property::Reloc_inst inst =
      reloc_property->reloc_inst();
    // If it is a data relocation or instruction has 2 parts of immediate
    // fields, you should not call pcrela_general.
    gold_assert(aarch64_howto[inst].doffset2 == -1 &&
		aarch64_howto[inst].doffset != -1);
    This::template update_view<valsize>(view, immed,
					aarch64_howto[inst].doffset,
					aarch64_howto[inst].dst_mask);

    // Do check overflow or alignment if needed.
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Calculate PG(S+A) - PG(address), update adrp instruction.
  // R_AARCH64_ADR_PREL_PG_HI21

  static inline typename This::Status
  adrp(
    unsigned char* view,
    Address sa,
    Address address)
  {
    typename elfcpp::Swap<size, big_endian>::Valtype x =
      This::Page(sa) - This::Page(address);
    update_adr(view, x, NULL);
    return (size == 64 && Bits<32>::has_overflow(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // Calculate PG(S+A) - PG(address), update adrp instruction.
  // R_AARCH64_ADR_PREL_PG_HI21

  static inline typename This::Status
  adrp(unsigned char* view,
       const Sized_relobj_file<size, big_endian>* object,
       const Symbol_value<size>* psymval,
       Address addend,
       Address address,
       const AArch64_reloc_property* reloc_property)
  {
    Address sa = psymval->value(object, addend);
    typename elfcpp::Swap<size, big_endian>::Valtype x =
	This::Page(sa) - This::Page(address);
    update_adr(view, x, reloc_property);
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

  // Update mov[n/z] instruction. Check overflow if needed.
  // If X >=0, set the instruction to movz and its immediate value to the
  // selected bits S.
  // If X < 0, set the instruction to movn and its immediate value to
  // NOT (selected bits of).

  static inline typename This::Status
  movnz(unsigned char* view,
	typename elfcpp::Swap<size, big_endian>::Valtype x,
	const AArch64_reloc_property* reloc_property)
  {
    // Select bits from X.
    Address immed = reloc_property->select_x_value(x);
    bool is_movz = true;
    if (static_cast<int64_t>(x) < 0)
      {
	immed = ~immed;
	is_movz = false;
      }

    // Update movnz instruction.
    update_movnz(view, immed, is_movz);

    // Do check overflow or alignment if needed.
    return (reloc_property->checkup_x_value(x)
	    ? This::STATUS_OKAY
	    : This::STATUS_OVERFLOW);
  }

};  // End of AArch64_relocate_functions


template<int size, bool big_endian>
typename elfcpp::Elf_types<size>::Elf_Addr
Target_aarch64<size, big_endian>::do_reloc_addend(
    void* arg, unsigned int r_type,
    typename elfcpp::Elf_types<size>::Elf_Addr) const
{
  gold_assert(r_type == elfcpp::R_AARCH64_TLSDESC);
  uintptr_t intarg = reinterpret_cast<uintptr_t>(arg);
  gold_assert(intarg < this->tlsdesc_reloc_info_.size());
  const Tlsdesc_info& ti(this->tlsdesc_reloc_info_[intarg]);
  const Symbol_value<size>* psymval = ti.object->local_symbol(ti.r_sym);
  gold_assert(psymval->is_tls_symbol());
  // The value of a TLS symbol is the offset in the TLS segment.
  return psymval->value(ti.object, 0);
}

// Return the number of entries in the PLT.

template<int size, bool big_endian>
unsigned int
Target_aarch64<size, big_endian>::plt_entry_count() const
{
  if (this->plt_ == NULL)
    return 0;
  return this->plt_->entry_count();
}

// Return the offset of the first non-reserved PLT entry.

template<int size, bool big_endian>
unsigned int
Target_aarch64<size, big_endian>::first_plt_entry_offset() const
{
  return this->plt_->first_plt_entry_offset();
}

// Return the size of each PLT entry.

template<int size, bool big_endian>
unsigned int
Target_aarch64<size, big_endian>::plt_entry_size() const
{
  return this->plt_->get_plt_entry_size();
}

// Define the _TLS_MODULE_BASE_ symbol in the TLS segment.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::define_tls_base_symbol(
    Symbol_table* symtab, Layout* layout)
{
  if (this->tls_base_symbol_defined_)
    return;

  Output_segment* tls_segment = layout->tls_segment();
  if (tls_segment != NULL)
    {
      bool is_exec = parameters->options().output_is_executable();
      symtab->define_in_output_segment("_TLS_MODULE_BASE_", NULL,
				       Symbol_table::PREDEFINED,
				       tls_segment, 0, 0,
				       elfcpp::STT_TLS,
				       elfcpp::STB_LOCAL,
				       elfcpp::STV_HIDDEN, 0,
				       (is_exec
					? Symbol::SEGMENT_END
					: Symbol::SEGMENT_START),
				       true);
    }
  this->tls_base_symbol_defined_ = true;
}

// Create the reserved PLT and GOT entries for the TLS descriptor resolver.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::reserve_tlsdesc_entries(
    Symbol_table* symtab, Layout* layout)
{
  if (this->plt_ == NULL)
    this->make_plt_section(symtab, layout);

  if (!this->plt_->has_tlsdesc_entry())
    {
      // Allocate the TLSDESC_GOT entry.
      Output_data_got_aarch64<size, big_endian>* got =
	  this->got_section(symtab, layout);
      unsigned int got_offset = got->add_constant(0);

      // Allocate the TLSDESC_PLT entry.
      this->plt_->reserve_tlsdesc_entry(got_offset);
    }
}

// Create a GOT entry for the TLS module index.

template<int size, bool big_endian>
unsigned int
Target_aarch64<size, big_endian>::got_mod_index_entry(
    Symbol_table* symtab, Layout* layout,
    Sized_relobj_file<size, big_endian>* object)
{
  if (this->got_mod_index_offset_ == -1U)
    {
      gold_assert(symtab != NULL && layout != NULL && object != NULL);
      Reloc_section* rela_dyn = this->rela_dyn_section(layout);
      Output_data_got_aarch64<size, big_endian>* got =
	  this->got_section(symtab, layout);
      unsigned int got_offset = got->add_constant(0);
      rela_dyn->add_local(object, 0, elfcpp::R_AARCH64_TLS_DTPMOD64, got,
			  got_offset, 0);
      got->add_constant(0);
      this->got_mod_index_offset_ = got_offset;
    }
  return this->got_mod_index_offset_;
}

// Optimize the TLS relocation type based on what we know about the
// symbol.  IS_FINAL is true if the final address of this symbol is
// known at link time.

template<int size, bool big_endian>
tls::Tls_optimization
Target_aarch64<size, big_endian>::optimize_tls_reloc(bool is_final,
						     int r_type)
{
  // If we are generating a shared library, then we can't do anything
  // in the linker
  if (parameters->options().shared())
    return tls::TLSOPT_NONE;

  switch (r_type)
    {
    case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:
    case elfcpp::R_AARCH64_TLSDESC_LD_PREL19:
    case elfcpp::R_AARCH64_TLSDESC_ADR_PREL21:
    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
    case elfcpp::R_AARCH64_TLSDESC_OFF_G1:
    case elfcpp::R_AARCH64_TLSDESC_OFF_G0_NC:
    case elfcpp::R_AARCH64_TLSDESC_LDR:
    case elfcpp::R_AARCH64_TLSDESC_ADD:
    case elfcpp::R_AARCH64_TLSDESC_CALL:
      // These are General-Dynamic which permits fully general TLS
      // access.  Since we know that we are generating an executable,
      // we can convert this to Initial-Exec.  If we also know that
      // this is a local symbol, we can further switch to Local-Exec.
      if (is_final)
	return tls::TLSOPT_TO_LE;
      return tls::TLSOPT_TO_IE;

    case elfcpp::R_AARCH64_TLSIE_MOVW_GOTTPREL_G1:
    case elfcpp::R_AARCH64_TLSIE_MOVW_GOTTPREL_G0_NC:
    case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
    case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:
    case elfcpp::R_AARCH64_TLSIE_LD_GOTTPREL_PREL19:
      // These are Initial-Exec relocs which get the thread offset
      // from the GOT. If we know that we are linking against the
      // local symbol, we can switch to Local-Exec, which links the
      // thread offset into the instruction.
      if (is_final)
	return tls::TLSOPT_TO_LE;
      return tls::TLSOPT_NONE;

    case elfcpp::R_AARCH64_TLSLE_MOVW_TPREL_G2:
    case elfcpp::R_AARCH64_TLSLE_MOVW_TPREL_G1:
    case elfcpp::R_AARCH64_TLSLE_MOVW_TPREL_G1_NC:
    case elfcpp::R_AARCH64_TLSLE_MOVW_TPREL_G0:
    case elfcpp::R_AARCH64_TLSLE_MOVW_TPREL_G0_NC:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12_NC:
      // When we already have Local-Exec, there is nothing further we
      // can do.
      return tls::TLSOPT_NONE;

    default:
      gold_unreachable();
    }
}

// Returns true if this relocation type could be that of a function pointer.

template<int size, bool big_endian>
inline bool
Target_aarch64<size, big_endian>::Scan::possible_function_pointer_reloc(
  unsigned int r_type)
{
  switch (r_type)
    {
    case elfcpp::R_AARCH64_ABS64:
    //TODO
      {
	return true;
      }
    }
  return false;
}

// For safe ICF, scan a relocation for a local symbol to check if it
// corresponds to a function pointer being taken.  In that case mark
// the function whose pointer was taken as not foldable.

template<int size, bool big_endian>
inline bool
Target_aarch64<size, big_endian>::Scan::local_reloc_may_be_function_pointer(
  Symbol_table* ,
  Layout* ,
  Target_aarch64<size, big_endian>* ,
  Sized_relobj_file<size, big_endian>* ,
  unsigned int ,
  Output_section* ,
  const elfcpp::Rela<size, big_endian>& ,
  unsigned int r_type,
  const elfcpp::Sym<size, big_endian>&)
{
  // When building a shared library, do not fold any local symbols as it is
  // not possible to distinguish pointer taken versus a call by looking at
  // the relocation types.
  return (parameters->options().shared()
	  || possible_function_pointer_reloc(r_type));
}

// For safe ICF, scan a relocation for a global symbol to check if it
// corresponds to a function pointer being taken.  In that case mark
// the function whose pointer was taken as not foldable.

template<int size, bool big_endian>
inline bool
Target_aarch64<size, big_endian>::Scan::global_reloc_may_be_function_pointer(
  Symbol_table* ,
  Layout* ,
  Target_aarch64<size, big_endian>* ,
  Sized_relobj_file<size, big_endian>* ,
  unsigned int ,
  Output_section* ,
  const elfcpp::Rela<size, big_endian>& ,
  unsigned int r_type,
  Symbol* gsym)
{
  // When building a shared library, do not fold symbols whose visibility
  // is hidden, internal or protected.
  return ((parameters->options().shared()
	   && (gsym->visibility() == elfcpp::STV_INTERNAL
	       || gsym->visibility() == elfcpp::STV_PROTECTED
	       || gsym->visibility() == elfcpp::STV_HIDDEN))
	  || possible_function_pointer_reloc(r_type));
}

// Report an unsupported relocation against a local symbol.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::Scan::unsupported_reloc_local(
     Sized_relobj_file<size, big_endian>* object,
     unsigned int r_type)
{
  gold_error(_("%s: unsupported reloc %u against local symbol"),
	     object->name().c_str(), r_type);
}

// We are about to emit a dynamic relocation of type R_TYPE.  If the
// dynamic linker does not support it, issue an error.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::Scan::check_non_pic(Relobj* object,
						      unsigned int r_type)
{
  gold_assert(r_type != elfcpp::R_AARCH64_NONE);

  switch (r_type)
    {
    // These are the relocation types supported by glibc for AARCH64.
    case elfcpp::R_AARCH64_NONE:
    case elfcpp::R_AARCH64_COPY:
    case elfcpp::R_AARCH64_GLOB_DAT:
    case elfcpp::R_AARCH64_JUMP_SLOT:
    case elfcpp::R_AARCH64_RELATIVE:
    case elfcpp::R_AARCH64_TLS_DTPREL64:
    case elfcpp::R_AARCH64_TLS_DTPMOD64:
    case elfcpp::R_AARCH64_TLS_TPREL64:
    case elfcpp::R_AARCH64_TLSDESC:
    case elfcpp::R_AARCH64_IRELATIVE:
    case elfcpp::R_AARCH64_ABS32:
    case elfcpp::R_AARCH64_ABS64:
      return;

    default:
      break;
    }

  // This prevents us from issuing more than one error per reloc
  // section. But we can still wind up issuing more than one
  // error per object file.
  if (this->issued_non_pic_error_)
    return;
  gold_assert(parameters->options().output_is_position_independent());
  object->error(_("requires unsupported dynamic reloc; "
		  "recompile with -fPIC"));
  this->issued_non_pic_error_ = true;
  return;
}

// Scan a relocation for a local symbol.

template<int size, bool big_endian>
inline void
Target_aarch64<size, big_endian>::Scan::local(
    Symbol_table* symtab,
    Layout* layout,
    Target_aarch64<size, big_endian>* target,
    Sized_relobj_file<size, big_endian>* object,
    unsigned int data_shndx,
    Output_section* output_section,
    const elfcpp::Rela<size, big_endian>& rela,
    unsigned int r_type,
    const elfcpp::Sym<size, big_endian>& /* lsym */,
    bool is_discarded)
{
  if (is_discarded)
    return;

  typedef Output_data_reloc<elfcpp::SHT_RELA, true, size, big_endian>
      Reloc_section;
  Output_data_got_aarch64<size, big_endian>* got =
      target->got_section(symtab, layout);
  unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());

  switch (r_type)
    {
    case elfcpp::R_AARCH64_ABS32:
    case elfcpp::R_AARCH64_ABS16:
      if (parameters->options().output_is_position_independent())
	{
	  gold_error(_("%s: unsupported reloc %u in pos independent link."),
		     object->name().c_str(), r_type);
	}
      break;

    case elfcpp::R_AARCH64_ABS64:
      // If building a shared library or pie, we need to mark this as a dynmic
      // reloction, so that the dynamic loader can relocate it.
      if (parameters->options().output_is_position_independent())
	{
	  Reloc_section* rela_dyn = target->rela_dyn_section(layout);
	  rela_dyn->add_local_relative(object, r_sym,
				       elfcpp::R_AARCH64_RELATIVE,
				       output_section,
				       data_shndx,
				       rela.get_r_offset(),
				       rela.get_r_addend(),
				       false /* is ifunc */);
	}
      break;

    case elfcpp::R_AARCH64_PREL64:
    case elfcpp::R_AARCH64_PREL32:
    case elfcpp::R_AARCH64_PREL16:
      break;

    case elfcpp::R_AARCH64_LD_PREL_LO19:        // 273
    case elfcpp::R_AARCH64_ADR_PREL_LO21:       // 274
    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21:    // 275
    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21_NC: // 276
    case elfcpp::R_AARCH64_ADD_ABS_LO12_NC:     // 277
    case elfcpp::R_AARCH64_LDST8_ABS_LO12_NC:   // 278
    case elfcpp::R_AARCH64_LDST16_ABS_LO12_NC:  // 284
    case elfcpp::R_AARCH64_LDST32_ABS_LO12_NC:  // 285
    case elfcpp::R_AARCH64_LDST64_ABS_LO12_NC:  // 286
    case elfcpp::R_AARCH64_LDST128_ABS_LO12_NC: // 299
       break;

    // Control flow, pc-relative. We don't need to do anything for a relative
    // addressing relocation against a local symbol if it does not reference
    // the GOT.
    case elfcpp::R_AARCH64_TSTBR14:
    case elfcpp::R_AARCH64_CONDBR19:
    case elfcpp::R_AARCH64_JUMP26:
    case elfcpp::R_AARCH64_CALL26:
      break;

    case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
    case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:
      {
	tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
	  optimize_tls_reloc(!parameters->options().shared(), r_type);
	if (tlsopt == tls::TLSOPT_TO_LE)
	  break;

	layout->set_has_static_tls();
	// Create a GOT entry for the tp-relative offset.
	if (!parameters->doing_static_link())
	  {
	    got->add_local_with_rel(object, r_sym, GOT_TYPE_TLS_OFFSET,
				    target->rela_dyn_section(layout),
				    elfcpp::R_AARCH64_TLS_TPREL64);
	  }
	else if (!object->local_has_got_offset(r_sym,
					       GOT_TYPE_TLS_OFFSET))
	  {
	    got->add_local(object, r_sym, GOT_TYPE_TLS_OFFSET);
	    unsigned int got_offset =
		object->local_got_offset(r_sym, GOT_TYPE_TLS_OFFSET);
	    const elfcpp::Elf_Xword addend = rela.get_r_addend();
	    gold_assert(addend == 0);
	    got->add_static_reloc(got_offset, elfcpp::R_AARCH64_TLS_TPREL64,
				  object, r_sym);
	  }
      }
      break;

    case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:
      {
	tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
	    optimize_tls_reloc(!parameters->options().shared(), r_type);
	if (tlsopt == tls::TLSOPT_TO_LE)
	  {
	    layout->set_has_static_tls();
	    break;
	  }
	gold_assert(tlsopt == tls::TLSOPT_NONE);

	got->add_local_pair_with_rel(object,r_sym, data_shndx,
				     GOT_TYPE_TLS_PAIR,
				     target->rela_dyn_section(layout),
				     elfcpp::R_AARCH64_TLS_DTPMOD64);
      }
      break;

    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12_NC:
      {
	layout->set_has_static_tls();
	bool output_is_shared = parameters->options().shared();
	if (output_is_shared)
	  gold_error(_("%s: unsupported TLSLE reloc %u in shared code."),
		     object->name().c_str(), r_type);
      }
      break;

    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
      {
	tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
	    optimize_tls_reloc(!parameters->options().shared(), r_type);
	target->define_tls_base_symbol(symtab, layout);
	if (tlsopt == tls::TLSOPT_NONE)
	  {
	    // Create reserved PLT and GOT entries for the resolver.
	    target->reserve_tlsdesc_entries(symtab, layout);

	    // Generate a double GOT entry with an R_AARCH64_TLSDESC reloc.
	    // The R_AARCH64_TLSDESC reloc is resolved lazily, so the GOT
	    // entry needs to be in an area in .got.plt, not .got. Call
	    // got_section to make sure the section has been created.
	    target->got_section(symtab, layout);
	    Output_data_got<size, big_endian>* got =
		target->got_tlsdesc_section();
	    unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
	    if (!object->local_has_got_offset(r_sym, GOT_TYPE_TLS_DESC))
	      {
		unsigned int got_offset = got->add_constant(0);
		got->add_constant(0);
		object->set_local_got_offset(r_sym, GOT_TYPE_TLS_DESC,
					     got_offset);
		Reloc_section* rt = target->rela_tlsdesc_section(layout);
		// We store the arguments we need in a vector, and use
		// the index into the vector as the parameter to pass
		// to the target specific routines.
		uintptr_t intarg = target->add_tlsdesc_info(object, r_sym);
		void* arg = reinterpret_cast<void*>(intarg);
		rt->add_target_specific(elfcpp::R_AARCH64_TLSDESC, arg,
					got, got_offset, 0);
	      }
	  }
	else if (tlsopt != tls::TLSOPT_TO_LE)
	  unsupported_reloc_local(object, r_type);
      }
      break;

    case elfcpp::R_AARCH64_TLSDESC_CALL:
      break;

    default:
      unsupported_reloc_local(object, r_type);
    }
}


// Report an unsupported relocation against a global symbol.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::Scan::unsupported_reloc_global(
    Sized_relobj_file<size, big_endian>* object,
    unsigned int r_type,
    Symbol* gsym)
{
  gold_error(_("%s: unsupported reloc %u against global symbol %s"),
	     object->name().c_str(), r_type, gsym->demangled_name().c_str());
}

template<int size, bool big_endian>
inline void
Target_aarch64<size, big_endian>::Scan::global(
    Symbol_table* symtab,
    Layout* layout,
    Target_aarch64<size, big_endian>* target,
    Sized_relobj_file<size, big_endian> * object,
    unsigned int data_shndx,
    Output_section* output_section,
    const elfcpp::Rela<size, big_endian>& rela,
    unsigned int r_type,
    Symbol* gsym)
{
  typedef Output_data_reloc<elfcpp::SHT_RELA, true, size, big_endian>
    Reloc_section;
  const AArch64_reloc_property* arp =
      aarch64_reloc_property_table->get_reloc_property(r_type);
  gold_assert(arp != NULL);

  switch (r_type)
    {
    case elfcpp::R_AARCH64_ABS16:
    case elfcpp::R_AARCH64_ABS32:
    case elfcpp::R_AARCH64_ABS64:
      {
	// Make a PLT entry if necessary.
	if (gsym->needs_plt_entry())
	  {
	    target->make_plt_entry(symtab, layout, gsym);
	    // Since this is not a PC-relative relocation, we may be
	    // taking the address of a function. In that case we need to
	    // set the entry in the dynamic symbol table to the address of
	    // the PLT entry.
	    if (gsym->is_from_dynobj() && !parameters->options().shared())
	      gsym->set_needs_dynsym_value();
	  }
	// Make a dynamic relocation if necessary.
	if (gsym->needs_dynamic_reloc(arp->reference_flags()))
	  {
	    if (!parameters->options().output_is_position_independent()
		&& gsym->may_need_copy_reloc())
	      {
		target->copy_reloc(symtab, layout, object,
				   data_shndx, output_section, gsym, rela);
	      }
	    else if (r_type == elfcpp::R_AARCH64_ABS64
		     && gsym->can_use_relative_reloc(false))
	      {
		Reloc_section* rela_dyn = target->rela_dyn_section(layout);
		rela_dyn->add_global_relative(gsym,
					      elfcpp::R_AARCH64_RELATIVE,
					      output_section,
					      object,
					      data_shndx,
					      rela.get_r_offset(),
					      rela.get_r_addend(),
					      false);
	      }
	    else
	      {
		check_non_pic(object, r_type);
		Output_data_reloc<elfcpp::SHT_RELA, true, size, big_endian>*
		    rela_dyn = target->rela_dyn_section(layout);
		rela_dyn->add_global(
		  gsym, r_type, output_section, object,
		  data_shndx, rela.get_r_offset(),rela.get_r_addend());
	      }
	  }
      }
      break;

    case elfcpp::R_AARCH64_PREL16:
    case elfcpp::R_AARCH64_PREL32:
    case elfcpp::R_AARCH64_PREL64:
      // This is used to fill the GOT absolute address.
      if (gsym->needs_plt_entry())
	{
	  target->make_plt_entry(symtab, layout, gsym);
	}
      break;

    case elfcpp::R_AARCH64_LD_PREL_LO19:        // 273
    case elfcpp::R_AARCH64_ADR_PREL_LO21:       // 274
    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21:    // 275
    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21_NC: // 276
    case elfcpp::R_AARCH64_ADD_ABS_LO12_NC:     // 277
    case elfcpp::R_AARCH64_LDST8_ABS_LO12_NC:   // 278
    case elfcpp::R_AARCH64_LDST16_ABS_LO12_NC:  // 284
    case elfcpp::R_AARCH64_LDST32_ABS_LO12_NC:  // 285
    case elfcpp::R_AARCH64_LDST64_ABS_LO12_NC:  // 286
    case elfcpp::R_AARCH64_LDST128_ABS_LO12_NC: // 299
      {
	if (gsym->needs_plt_entry())
	  target->make_plt_entry(symtab, layout, gsym);
	// Make a dynamic relocation if necessary.
	if (gsym->needs_dynamic_reloc(arp->reference_flags()))
	  {
	    if (parameters->options().output_is_executable()
		&& gsym->may_need_copy_reloc())
	      {
		target->copy_reloc(symtab, layout, object,
				   data_shndx, output_section, gsym, rela);
	      }
	  }
	break;
      }

    case elfcpp::R_AARCH64_ADR_GOT_PAGE:
    case elfcpp::R_AARCH64_LD64_GOT_LO12_NC:
      {
	// This pair of relocations is used to access a specific GOT entry.
	// Note a GOT entry is an *address* to a symbol.
	// The symbol requires a GOT entry
	Output_data_got_aarch64<size, big_endian>* got =
	  target->got_section(symtab, layout);
	if (gsym->final_value_is_known())
	  {
	    got->add_global(gsym, GOT_TYPE_STANDARD);
	  }
	else
	  {
	    Reloc_section* rela_dyn = target->rela_dyn_section(layout);
	    if (gsym->is_from_dynobj()
		|| gsym->is_undefined()
		|| gsym->is_preemptible()
		|| (gsym->visibility() == elfcpp::STV_PROTECTED
		    && parameters->options().shared()))
	      got->add_global_with_rel(gsym, GOT_TYPE_STANDARD,
				       rela_dyn, elfcpp::R_AARCH64_GLOB_DAT);
	    else
	      {
		if (got->add_global(gsym, GOT_TYPE_STANDARD))
		  {
		    rela_dyn->add_global_relative(
			gsym, elfcpp::R_AARCH64_RELATIVE,
			got,
			gsym->got_offset(GOT_TYPE_STANDARD),
			0,
			false);
		  }
	      }
	  }
	break;
      }

    case elfcpp::R_AARCH64_TSTBR14:
    case elfcpp::R_AARCH64_CONDBR19:
    case elfcpp::R_AARCH64_JUMP26:
    case elfcpp::R_AARCH64_CALL26:
      {
	if (gsym->final_value_is_known())
	  break;

	if (gsym->is_defined() &&
	    !gsym->is_from_dynobj() &&
	    !gsym->is_preemptible())
	  break;

	// Make plt entry for function call.
	target->make_plt_entry(symtab, layout, gsym);
	break;
      }

    case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:  // General dynamic
      {
	tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
	    optimize_tls_reloc(gsym->final_value_is_known(), r_type);
	if (tlsopt == tls::TLSOPT_TO_LE)
	  {
	    layout->set_has_static_tls();
	    break;
	  }
	gold_assert(tlsopt == tls::TLSOPT_NONE);

	// General dynamic.
	Output_data_got_aarch64<size, big_endian>* got =
	    target->got_section(symtab, layout);
	// Create 2 consecutive entries for module index and offset.
	got->add_global_pair_with_rel(gsym, GOT_TYPE_TLS_PAIR,
				      target->rela_dyn_section(layout),
				      elfcpp::R_AARCH64_TLS_DTPMOD64,
				      elfcpp::R_AARCH64_TLS_DTPREL64);
      }
      break;

    case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
    case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:  // Initial executable
      {
	tls::Tls_optimization tlsopt =Target_aarch64<size, big_endian>::
	  optimize_tls_reloc(gsym->final_value_is_known(), r_type);
	if (tlsopt == tls::TLSOPT_TO_LE)
	  break;

	layout->set_has_static_tls();
	// Create a GOT entry for the tp-relative offset.
	Output_data_got_aarch64<size, big_endian>* got
	  = target->got_section(symtab, layout);
	if (!parameters->doing_static_link())
	  {
	    got->add_global_with_rel(
	      gsym, GOT_TYPE_TLS_OFFSET,
	      target->rela_dyn_section(layout),
	      elfcpp::R_AARCH64_TLS_TPREL64);
	  }
	if (!gsym->has_got_offset(GOT_TYPE_TLS_OFFSET))
	  {
	    got->add_global(gsym, GOT_TYPE_TLS_OFFSET);
	    unsigned int got_offset =
	      gsym->got_offset(GOT_TYPE_TLS_OFFSET);
	    const elfcpp::Elf_Xword addend = rela.get_r_addend();
	    gold_assert(addend == 0);
	    got->add_static_reloc(got_offset,
				  elfcpp::R_AARCH64_TLS_TPREL64, gsym);
	  }
      }
      break;

    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12_NC:  // Local executable
      layout->set_has_static_tls();
      if (parameters->options().shared())
	gold_error(_("%s: unsupported TLSLE reloc type %u in shared objects."),
		   object->name().c_str(), r_type);
      break;

    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:  // TLS descriptor
      {
	target->define_tls_base_symbol(symtab, layout);
	tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
	    optimize_tls_reloc(gsym->final_value_is_known(), r_type);
	if (tlsopt == tls::TLSOPT_NONE)
	  {
	    // Create reserved PLT and GOT entries for the resolver.
	    target->reserve_tlsdesc_entries(symtab, layout);

	    // Create a double GOT entry with an R_AARCH64_TLSDESC
	    // relocation. The R_AARCH64_TLSDESC is resolved lazily, so the GOT
	    // entry needs to be in an area in .got.plt, not .got. Call
	    // got_section to make sure the section has been created.
	    target->got_section(symtab, layout);
	    Output_data_got<size, big_endian>* got =
		target->got_tlsdesc_section();
	    Reloc_section* rt = target->rela_tlsdesc_section(layout);
	    got->add_global_pair_with_rel(gsym, GOT_TYPE_TLS_DESC, rt,
					  elfcpp::R_AARCH64_TLSDESC, 0);
	  }
	else if (tlsopt == tls::TLSOPT_TO_IE)
	  {
	    // Create a GOT entry for the tp-relative offset.
	    Output_data_got<size, big_endian>* got
		= target->got_section(symtab, layout);
	    got->add_global_with_rel(gsym, GOT_TYPE_TLS_OFFSET,
				     target->rela_dyn_section(layout),
				     elfcpp::R_AARCH64_TLS_TPREL64);
	  }
	else if (tlsopt != tls::TLSOPT_TO_LE)
	  unsupported_reloc_global(object, r_type, gsym);
      }
      break;

    case elfcpp::R_AARCH64_TLSDESC_CALL:
      break;

    default:
      gold_error(_("%s: unsupported reloc type in global scan"),
		 aarch64_reloc_property_table->
		 reloc_name_in_error_message(r_type).c_str());
    }
  return;
}  // End of Scan::global


// Create the PLT section.
template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::make_plt_section(
  Symbol_table* symtab, Layout* layout)
{
  if (this->plt_ == NULL)
    {
      // Create the GOT section first.
      this->got_section(symtab, layout);

      this->plt_ = this->make_data_plt(layout, this->got_, this->got_plt_,
				       this->got_irelative_);

      layout->add_output_section_data(".plt", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC
				       | elfcpp::SHF_EXECINSTR),
				      this->plt_, ORDER_PLT, false);

      // Make the sh_info field of .rela.plt point to .plt.
      Output_section* rela_plt_os = this->plt_->rela_plt()->output_section();
      rela_plt_os->set_info_section(this->plt_->output_section());
    }
}

// Return the section for TLSDESC relocations.

template<int size, bool big_endian>
typename Target_aarch64<size, big_endian>::Reloc_section*
Target_aarch64<size, big_endian>::rela_tlsdesc_section(Layout* layout) const
{
  return this->plt_section()->rela_tlsdesc(layout);
}

// Create a PLT entry for a global symbol.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::make_plt_entry(
    Symbol_table* symtab,
    Layout* layout,
    Symbol* gsym)
{
  if (gsym->has_plt_offset())
    return;

  if (this->plt_ == NULL)
    this->make_plt_section(symtab, layout);

  this->plt_->add_entry(gsym);
}

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::gc_process_relocs(
    Symbol_table* symtab,
    Layout* layout,
    Sized_relobj_file<size, big_endian>* object,
    unsigned int data_shndx,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    bool needs_special_offset_handling,
    size_t local_symbol_count,
    const unsigned char* plocal_symbols)
{
  if (sh_type == elfcpp::SHT_REL)
    {
      return;
    }

  gold::gc_process_relocs<
    size, big_endian,
    Target_aarch64<size, big_endian>,
    elfcpp::SHT_RELA,
    typename Target_aarch64<size, big_endian>::Scan,
    typename Target_aarch64<size, big_endian>::Relocatable_size_for_reloc>(
    symtab,
    layout,
    this,
    object,
    data_shndx,
    prelocs,
    reloc_count,
    output_section,
    needs_special_offset_handling,
    local_symbol_count,
    plocal_symbols);
}

// Scan relocations for a section.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::scan_relocs(
    Symbol_table* symtab,
    Layout* layout,
    Sized_relobj_file<size, big_endian>* object,
    unsigned int data_shndx,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    bool needs_special_offset_handling,
    size_t local_symbol_count,
    const unsigned char* plocal_symbols)
{
  if (sh_type == elfcpp::SHT_REL)
    {
      gold_error(_("%s: unsupported REL reloc section"),
		 object->name().c_str());
      return;
    }
  gold::scan_relocs<size, big_endian, Target_aarch64, elfcpp::SHT_RELA, Scan>(
    symtab,
    layout,
    this,
    object,
    data_shndx,
    prelocs,
    reloc_count,
    output_section,
    needs_special_offset_handling,
    local_symbol_count,
    plocal_symbols);
}

// Return the value to use for a dynamic which requires special
// treatment.  This is how we support equality comparisons of function
// pointers across shared library boundaries, as described in the
// processor specific ABI supplement.

template<int size,bool big_endian>
uint64_t
Target_aarch64<size,big_endian>::do_dynsym_value(const Symbol* gsym) const
{
  gold_assert(gsym->is_from_dynobj() && gsym->has_plt_offset());
  return this->plt_address_for_global(gsym);
}

// Finalize the sections.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::do_finalize_sections(
    Layout* layout,
    const Input_objects*,
    Symbol_table* symtab)
{
  const Reloc_section* rel_plt = (this->plt_ == NULL
				  ? NULL
				  : this->plt_->rela_plt());
  layout->add_target_dynamic_tags(false, this->got_plt_, rel_plt,
				  this->rela_dyn_, true, false);

  // Emit any relocs we saved in an attempt to avoid generating COPY
  // relocs.
  if (this->copy_relocs_.any_saved_relocs())
    this->copy_relocs_.emit(this->rela_dyn_section(layout));

  // Fill in some more dynamic tags.
  Output_data_dynamic* const odyn = layout->dynamic_data();
  if (odyn != NULL)
    {
      if (this->plt_ != NULL
	  && this->plt_->output_section() != NULL
	  && this->plt_ ->has_tlsdesc_entry())
	{
	  unsigned int plt_offset = this->plt_->get_tlsdesc_plt_offset();
	  unsigned int got_offset = this->plt_->get_tlsdesc_got_offset();
	  this->got_->finalize_data_size();
	  odyn->add_section_plus_offset(elfcpp::DT_TLSDESC_PLT,
					this->plt_, plt_offset);
	  odyn->add_section_plus_offset(elfcpp::DT_TLSDESC_GOT,
					this->got_, got_offset);
	}
    }

  // Set the size of the _GLOBAL_OFFSET_TABLE_ symbol to the size of
  // the .got.plt section.
  Symbol* sym = this->global_offset_table_;
  if (sym != NULL)
    {
      uint64_t data_size = this->got_plt_->current_data_size();
      symtab->get_sized_symbol<size>(sym)->set_symsize(data_size);

      // If the .got section is more than 0x8000 bytes, we add
      // 0x8000 to the value of _GLOBAL_OFFSET_TABLE_, so that 16
      // bit relocations have a greater chance of working.
      if (data_size >= 0x8000)
	symtab->get_sized_symbol<size>(sym)->set_value(
	  symtab->get_sized_symbol<size>(sym)->value() + 0x8000);
    }

  if (parameters->doing_static_link()
      && (this->plt_ == NULL || !this->plt_->has_irelative_section()))
    {
      // If linking statically, make sure that the __rela_iplt symbols
      // were defined if necessary, even if we didn't create a PLT.
      static const Define_symbol_in_segment syms[] =
	{
	  {
	    "__rela_iplt_start",	// name
	    elfcpp::PT_LOAD,		// segment_type
	    elfcpp::PF_W,		// segment_flags_set
	    elfcpp::PF(0),		// segment_flags_clear
	    0,				// value
	    0,				// size
	    elfcpp::STT_NOTYPE,		// type
	    elfcpp::STB_GLOBAL,		// binding
	    elfcpp::STV_HIDDEN,		// visibility
	    0,				// nonvis
	    Symbol::SEGMENT_START,	// offset_from_base
	    true			// only_if_ref
	  },
	  {
	    "__rela_iplt_end",		// name
	    elfcpp::PT_LOAD,		// segment_type
	    elfcpp::PF_W,		// segment_flags_set
	    elfcpp::PF(0),		// segment_flags_clear
	    0,				// value
	    0,				// size
	    elfcpp::STT_NOTYPE,		// type
	    elfcpp::STB_GLOBAL,		// binding
	    elfcpp::STV_HIDDEN,		// visibility
	    0,				// nonvis
	    Symbol::SEGMENT_START,	// offset_from_base
	    true			// only_if_ref
	  }
	};

      symtab->define_symbols(layout, 2, syms,
			     layout->script_options()->saw_sections_clause());
    }

  return;
}

// Perform a relocation.

template<int size, bool big_endian>
inline bool
Target_aarch64<size, big_endian>::Relocate::relocate(
    const Relocate_info<size, big_endian>* relinfo,
    Target_aarch64<size, big_endian>* target,
    Output_section* ,
    size_t relnum,
    const elfcpp::Rela<size, big_endian>& rela,
    unsigned int r_type,
    const Sized_symbol<size>* gsym,
    const Symbol_value<size>* psymval,
    unsigned char* view,
    typename elfcpp::Elf_types<size>::Elf_Addr address,
    section_size_type /* view_size */)
{
  if (view == NULL)
    return true;

  typedef AArch64_relocate_functions<size, big_endian> Reloc;

  const AArch64_reloc_property* reloc_property =
      aarch64_reloc_property_table->get_reloc_property(r_type);

  if (reloc_property == NULL)
    {
      std::string reloc_name =
	  aarch64_reloc_property_table->reloc_name_in_error_message(r_type);
      gold_error_at_location(relinfo, relnum, rela.get_r_offset(),
			     _("cannot relocate %s in object file"),
			     reloc_name.c_str());
      return true;
    }

  const Sized_relobj_file<size, big_endian>* object = relinfo->object;

  // Pick the value to use for symbols defined in the PLT.
  Symbol_value<size> symval;
  if (gsym != NULL
      && gsym->use_plt_offset(reloc_property->reference_flags()))
    {
      symval.set_output_value(target->plt_address_for_global(gsym));
      psymval = &symval;
    }
  else if (gsym == NULL && psymval->is_ifunc_symbol())
    {
      unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
      if (object->local_has_plt_offset(r_sym))
	{
	  symval.set_output_value(target->plt_address_for_local(object, r_sym));
	  psymval = &symval;
	}
    }

  const elfcpp::Elf_Xword addend = rela.get_r_addend();

  // Get the GOT offset if needed.
  // For aarch64, the GOT pointer points to the start of the GOT section.
  bool have_got_offset = false;
  int got_offset = 0;
  int got_base = (target->got_ != NULL
		  ? (target->got_->current_data_size() >= 0x8000
		     ? 0x8000 : 0)
		  : 0);
  switch (r_type)
    {
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G0:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G0_NC:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G1:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G1_NC:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G2:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G2_NC:
    case elfcpp::R_AARCH64_MOVW_GOTOFF_G3:
    case elfcpp::R_AARCH64_GOTREL64:
    case elfcpp::R_AARCH64_GOTREL32:
    case elfcpp::R_AARCH64_GOT_LD_PREL19:
    case elfcpp::R_AARCH64_LD64_GOTOFF_LO15:
    case elfcpp::R_AARCH64_ADR_GOT_PAGE:
    case elfcpp::R_AARCH64_LD64_GOT_LO12_NC:
    case elfcpp::R_AARCH64_LD64_GOTPAGE_LO15:
      if (gsym != NULL)
	{
	  gold_assert(gsym->has_got_offset(GOT_TYPE_STANDARD));
	  got_offset = gsym->got_offset(GOT_TYPE_STANDARD) - got_base;
	}
      else
	{
	  unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
	  gold_assert(object->local_has_got_offset(r_sym, GOT_TYPE_STANDARD));
	  got_offset = (object->local_got_offset(r_sym, GOT_TYPE_STANDARD)
			- got_base);
	}
      have_got_offset = true;
      break;

    default:
      break;
    }

  typename Reloc::Status reloc_status = Reloc::STATUS_OKAY;
  typename elfcpp::Elf_types<size>::Elf_Addr value;
  switch (r_type)
    {
    case elfcpp::R_AARCH64_NONE:
      break;

    case elfcpp::R_AARCH64_ABS64:
      reloc_status = Reloc::template rela_ua<64>(
	view, object, psymval, addend, reloc_property);
      break;

    case elfcpp::R_AARCH64_ABS32:
      reloc_status = Reloc::template rela_ua<32>(
	view, object, psymval, addend, reloc_property);
      break;

    case elfcpp::R_AARCH64_ABS16:
      reloc_status = Reloc::template rela_ua<16>(
	view, object, psymval, addend, reloc_property);
      break;

    case elfcpp::R_AARCH64_PREL64:
      reloc_status = Reloc::template pcrela_ua<64>(
	view, object, psymval, addend, address, reloc_property);

    case elfcpp::R_AARCH64_PREL32:
      reloc_status = Reloc::template pcrela_ua<32>(
	view, object, psymval, addend, address, reloc_property);

    case elfcpp::R_AARCH64_PREL16:
      reloc_status = Reloc::template pcrela_ua<16>(
	view, object, psymval, addend, address, reloc_property);

    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21_NC:
    case elfcpp::R_AARCH64_ADR_PREL_PG_HI21:
      reloc_status = Reloc::adrp(view, object, psymval, addend, address,
				 reloc_property);
      break;

    case elfcpp::R_AARCH64_LDST8_ABS_LO12_NC:
    case elfcpp::R_AARCH64_LDST16_ABS_LO12_NC:
    case elfcpp::R_AARCH64_LDST32_ABS_LO12_NC:
    case elfcpp::R_AARCH64_LDST64_ABS_LO12_NC:
    case elfcpp::R_AARCH64_LDST128_ABS_LO12_NC:
    case elfcpp::R_AARCH64_ADD_ABS_LO12_NC:
      reloc_status = Reloc::template rela_general<32>(
	view, object, psymval, addend, reloc_property);
      break;

    case elfcpp::R_AARCH64_CALL26:
      if (this->skip_call_tls_get_addr_)
	{
	  // Double check that the TLSGD insn has been optimized away.
	  typedef typename elfcpp::Swap<32, big_endian>::Valtype Insntype;
	  Insntype insn = elfcpp::Swap<32, big_endian>::readval(
	      reinterpret_cast<Insntype*>(view));
	  gold_assert((insn & 0xff000000) == 0x91000000);

	  reloc_status = Reloc::STATUS_OKAY;
	  this->skip_call_tls_get_addr_ = false;
	  // Return false to stop further processing this reloc.
	  return false;
	}
	// Continue.
    case elfcpp::R_AARCH64_TSTBR14:
    case elfcpp::R_AARCH64_CONDBR19:
    case elfcpp::R_AARCH64_JUMP26:
      reloc_status = Reloc::template pcrela_general<32>(
	view, object, psymval, addend, address, reloc_property);
      break;

    case elfcpp::R_AARCH64_ADR_GOT_PAGE:
      gold_assert(have_got_offset);
      value = target->got_->address() + got_base + got_offset;
      reloc_status = Reloc::adrp(view, value + addend, address);
      break;

    case elfcpp::R_AARCH64_LD64_GOT_LO12_NC:
      gold_assert(have_got_offset);
      value = target->got_->address() + got_base + got_offset;
      reloc_status = Reloc::template rela_general<32>(
	view, value, addend, reloc_property);
      break;

    case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:
    case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
    case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12_NC:
    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
    case elfcpp::R_AARCH64_TLSDESC_CALL:
      reloc_status = relocate_tls(relinfo, target, relnum, rela, r_type,
				  gsym, psymval, view, address);
      break;

    // These are dynamic relocations, which are unexpected when linking.
    case elfcpp::R_AARCH64_COPY:
    case elfcpp::R_AARCH64_GLOB_DAT:
    case elfcpp::R_AARCH64_JUMP_SLOT:
    case elfcpp::R_AARCH64_RELATIVE:
    case elfcpp::R_AARCH64_IRELATIVE:
    case elfcpp::R_AARCH64_TLS_DTPREL64:
    case elfcpp::R_AARCH64_TLS_DTPMOD64:
    case elfcpp::R_AARCH64_TLS_TPREL64:
    case elfcpp::R_AARCH64_TLSDESC:
      gold_error_at_location(relinfo, relnum, rela.get_r_offset(),
			     _("unexpected reloc %u in object file"),
			     r_type);
      break;

    default:
      gold_error_at_location(relinfo, relnum, rela.get_r_offset(),
			     _("unsupported reloc %s"),
			     reloc_property->name().c_str());
      break;
    }

  // Report any errors.
  switch (reloc_status)
    {
    case Reloc::STATUS_OKAY:
      break;
    case Reloc::STATUS_OVERFLOW:
      gold_error_at_location(relinfo, relnum, rela.get_r_offset(),
			     _("relocation overflow in %s"),
			     reloc_property->name().c_str());
      break;
    case Reloc::STATUS_BAD_RELOC:
      gold_error_at_location(
	  relinfo,
	  relnum,
	  rela.get_r_offset(),
	  _("unexpected opcode while processing relocation %s"),
	  reloc_property->name().c_str());
      break;
    default:
      gold_unreachable();
    }

  return true;
}


template<int size, bool big_endian>
inline
typename AArch64_relocate_functions<size,big_endian>::Status
Target_aarch64<size, big_endian>::Relocate::relocate_tls(
    const Relocate_info<size,big_endian>* relinfo,
    Target_aarch64<size, big_endian>* target,
    size_t relnum,
    const elfcpp::Rela<size, big_endian>& rela,
    unsigned int r_type, const Sized_symbol<size>* gsym,
    const Symbol_value<size>* psymval,
    unsigned char* view,
    typename elfcpp::Elf_types<size>::Elf_Addr address)
{
  typedef AArch64_relocate_functions<size,big_endian> aarch64_reloc_funcs;
  typedef typename elfcpp::Elf_types<size>::Elf_Addr AArch64_address;

  Output_segment* tls_segment = relinfo->layout->tls_segment();
  const elfcpp::Elf_Xword addend = rela.get_r_addend();
  const AArch64_reloc_property* reloc_property =
      aarch64_reloc_property_table->get_reloc_property(r_type);
  gold_assert(reloc_property != NULL);

  const bool is_final = (gsym == NULL
			 ? !parameters->options().shared()
			 : gsym->final_value_is_known());
  tls::Tls_optimization tlsopt = Target_aarch64<size, big_endian>::
      optimize_tls_reloc(is_final, r_type);

  Sized_relobj_file<size,big_endian>* object = relinfo->object;
  int tls_got_offset_type;
  switch (r_type)
    {
    case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:  // Global-dynamic
      {
	if (tlsopt == tls::TLSOPT_TO_LE)
	  {
	    if (tls_segment == NULL)
	      {
		gold_assert(parameters->errors()->error_count() > 0
			    || issue_undefined_symbol_error(gsym));
		return aarch64_reloc_funcs::STATUS_BAD_RELOC;
	      }
	    return tls_gd_to_le(relinfo, target, rela, r_type, view,
				psymval);
	  }
	else if (tlsopt == tls::TLSOPT_NONE)
	  {
	    tls_got_offset_type = GOT_TYPE_TLS_PAIR;
	    // Firstly get the address for the got entry.
	    typename elfcpp::Elf_types<size>::Elf_Addr got_entry_address;
	    if (gsym != NULL)
	      {
		gold_assert(gsym->has_got_offset(tls_got_offset_type));
		got_entry_address = target->got_->address() +
				    gsym->got_offset(tls_got_offset_type);
	      }
	    else
	      {
		unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
		gold_assert(
		  object->local_has_got_offset(r_sym, tls_got_offset_type));
		got_entry_address = target->got_->address() +
		  object->local_got_offset(r_sym, tls_got_offset_type);
	      }

	    // Relocate the address into adrp/ld, adrp/add pair.
	    switch (r_type)
	      {
	      case elfcpp::R_AARCH64_TLSGD_ADR_PAGE21:
		return aarch64_reloc_funcs::adrp(
		  view, got_entry_address + addend, address);

		break;

	      case elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC:
		return aarch64_reloc_funcs::template rela_general<32>(
		  view, got_entry_address, addend, reloc_property);
		break;

	      default:
		gold_assert(false);
	      }
	  }
	gold_error_at_location(relinfo, relnum, rela.get_r_offset(),
			       _("unsupported gd_to_ie relaxation on %u"),
			       r_type);
      }
      break;

    case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
    case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:  // Initial-exec
      {
	if (tlsopt == tls::TLSOPT_TO_LE)
	  {
	    if (tls_segment == NULL)
	      {
		gold_assert(parameters->errors()->error_count() > 0
			    || issue_undefined_symbol_error(gsym));
		return aarch64_reloc_funcs::STATUS_BAD_RELOC;
	      }
	    return tls_ie_to_le(relinfo, target, rela, r_type, view,
				psymval);
	  }
	tls_got_offset_type = GOT_TYPE_TLS_OFFSET;

	// Firstly get the address for the got entry.
	typename elfcpp::Elf_types<size>::Elf_Addr got_entry_address;
	if (gsym != NULL)
	  {
	    gold_assert(gsym->has_got_offset(tls_got_offset_type));
	    got_entry_address = target->got_->address() +
				gsym->got_offset(tls_got_offset_type);
	  }
	else
	  {
	    unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
	    gold_assert(
		object->local_has_got_offset(r_sym, tls_got_offset_type));
	    got_entry_address = target->got_->address() +
		object->local_got_offset(r_sym, tls_got_offset_type);
	  }
	// Relocate the address into adrp/ld, adrp/add pair.
	switch (r_type)
	  {
	  case elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21:
	    return aarch64_reloc_funcs::adrp(view, got_entry_address + addend,
					     address);
	    break;
	  case elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC:
	    return aarch64_reloc_funcs::template rela_general<32>(
	      view, got_entry_address, addend, reloc_property);
	  default:
	    gold_assert(false);
	  }
      }
      // We shall never reach here.
      break;

    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12:
    case elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12_NC:
      {
	gold_assert(tls_segment != NULL);
	AArch64_address value = psymval->value(object, 0);

	if (!parameters->options().shared())
	  {
	    AArch64_address aligned_tcb_size =
		align_address(target->tcb_size(),
			      tls_segment->maximum_alignment());
	    return aarch64_reloc_funcs::template
		rela_general<32>(view,
				 value + aligned_tcb_size,
				 addend,
				 reloc_property);
	  }
	else
	  gold_error(_("%s: unsupported reloc %u "
		       "in non-static TLSLE mode."),
		     object->name().c_str(), r_type);
      }
      break;

    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
    case elfcpp::R_AARCH64_TLSDESC_CALL:
      {
	if (tlsopt == tls::TLSOPT_TO_LE)
	  {
	    if (tls_segment == NULL)
	      {
		gold_assert(parameters->errors()->error_count() > 0
			    || issue_undefined_symbol_error(gsym));
		return aarch64_reloc_funcs::STATUS_BAD_RELOC;
	      }
	    return tls_desc_gd_to_le(relinfo, target, rela, r_type,
				     view, psymval);
	  }
	else
	  {
	    tls_got_offset_type = (tlsopt == tls::TLSOPT_TO_IE
				   ? GOT_TYPE_TLS_OFFSET
				   : GOT_TYPE_TLS_DESC);
	    unsigned int got_tlsdesc_offset = 0;
	    if (r_type != elfcpp::R_AARCH64_TLSDESC_CALL
		&& tlsopt == tls::TLSOPT_NONE)
	      {
		// We created GOT entries in the .got.tlsdesc portion of the
		// .got.plt section, but the offset stored in the symbol is the
		// offset within .got.tlsdesc.
		got_tlsdesc_offset = (target->got_->data_size()
				      + target->got_plt_section()->data_size());
	      }
	    typename elfcpp::Elf_types<size>::Elf_Addr got_entry_address;
	    if (gsym != NULL)
	      {
		gold_assert(gsym->has_got_offset(tls_got_offset_type));
		got_entry_address = target->got_->address()
				    + got_tlsdesc_offset
				    + gsym->got_offset(tls_got_offset_type);
	      }
	    else
	      {
		unsigned int r_sym = elfcpp::elf_r_sym<size>(rela.get_r_info());
		gold_assert(
		    object->local_has_got_offset(r_sym, tls_got_offset_type));
		got_entry_address = target->got_->address() +
		  got_tlsdesc_offset +
		  object->local_got_offset(r_sym, tls_got_offset_type);
	      }
	    if (tlsopt == tls::TLSOPT_TO_IE)
	      {
		if (tls_segment == NULL)
		  {
		    gold_assert(parameters->errors()->error_count() > 0
				|| issue_undefined_symbol_error(gsym));
		    return aarch64_reloc_funcs::STATUS_BAD_RELOC;
		  }
		return tls_desc_gd_to_ie(relinfo, target, rela, r_type,
					 view, psymval, got_entry_address,
					 address);
	      }

	    // Now do tlsdesc relocation.
	    switch (r_type)
	      {
	      case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
		return aarch64_reloc_funcs::adrp(view,
						 got_entry_address + addend,
						 address);
		break;
	      case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
	      case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
		return aarch64_reloc_funcs::template rela_general<32>(
		  view, got_entry_address, addend, reloc_property);
		break;
	      case elfcpp::R_AARCH64_TLSDESC_CALL:
		return aarch64_reloc_funcs::STATUS_OKAY;
		break;
	      default:
		gold_unreachable();
	      }
	  }
	}
      break;

    default:
      gold_error(_("%s: unsupported TLS reloc %u."),
		 object->name().c_str(), r_type);
    }
  return aarch64_reloc_funcs::STATUS_BAD_RELOC;
}  // End of relocate_tls.


template<int size, bool big_endian>
inline
typename AArch64_relocate_functions<size,big_endian>::Status
Target_aarch64<size, big_endian>::Relocate::tls_gd_to_le(
	     const Relocate_info<size,big_endian>* relinfo,
	     Target_aarch64<size, big_endian>* target,
	     const elfcpp::Rela<size, big_endian>& rela,
	     unsigned int r_type,
	     unsigned char* view,
	     const Symbol_value<size>* psymval)
{
  typedef AArch64_relocate_functions<size,big_endian> aarch64_reloc_funcs;
  typedef typename elfcpp::Swap<32, big_endian>::Valtype Insntype;
  typedef typename elfcpp::Elf_types<size>::Elf_Addr AArch64_address;

  Insntype* ip = reinterpret_cast<Insntype*>(view);
  Insntype insn1 = elfcpp::Swap<32, big_endian>::readval(ip);
  Insntype insn2 = elfcpp::Swap<32, big_endian>::readval(ip + 1);
  Insntype insn3 = elfcpp::Swap<32, big_endian>::readval(ip + 2);

  if (r_type == elfcpp::R_AARCH64_TLSGD_ADD_LO12_NC)
    {
      // This is the 2nd relocs, optimization should already have been
      // done.
      gold_assert((insn1 & 0xfff00000) == 0x91400000);
      return aarch64_reloc_funcs::STATUS_OKAY;
    }

  // The original sequence is -
  //   90000000        adrp    x0, 0 <main>
  //   91000000        add     x0, x0, #0x0
  //   94000000        bl      0 <__tls_get_addr>
  // optimized to sequence -
  //   d53bd040        mrs     x0, tpidr_el0
  //   91400000        add     x0, x0, #0x0, lsl #12
  //   91000000        add     x0, x0, #0x0

  // Unlike tls_ie_to_le, we change the 3 insns in one function call when we
  // encounter the first relocation "R_AARCH64_TLSGD_ADR_PAGE21". Because we
  // have to change "bl tls_get_addr", which does not have a corresponding tls
  // relocation type. So before proceeding, we need to make sure compiler
  // does not change the sequence.
  if(!(insn1 == 0x90000000      // adrp x0,0
       && insn2 == 0x91000000   // add x0, x0, #0x0
       && insn3 == 0x94000000)) // bl 0
    {
      // Ideally we should give up gd_to_le relaxation and do gd access.
      // However the gd_to_le relaxation decision has been made early
      // in the scan stage, where we did not allocate any GOT entry for
      // this symbol. Therefore we have to exit and report error now.
      gold_error(_("unexpected reloc insn sequence while relaxing "
		   "tls gd to le for reloc %u."), r_type);
      return aarch64_reloc_funcs::STATUS_BAD_RELOC;
    }

  // Write new insns.
  insn1 = 0xd53bd040;  // mrs x0, tpidr_el0
  insn2 = 0x91400000;  // add x0, x0, #0x0, lsl #12
  insn3 = 0x91000000;  // add x0, x0, #0x0
  elfcpp::Swap<32, big_endian>::writeval(ip, insn1);
  elfcpp::Swap<32, big_endian>::writeval(ip + 1, insn2);
  elfcpp::Swap<32, big_endian>::writeval(ip + 2, insn3);

  // Calculate tprel value.
  Output_segment* tls_segment = relinfo->layout->tls_segment();
  gold_assert(tls_segment != NULL);
  AArch64_address value = psymval->value(relinfo->object, 0);
  const elfcpp::Elf_Xword addend = rela.get_r_addend();
  AArch64_address aligned_tcb_size =
      align_address(target->tcb_size(), tls_segment->maximum_alignment());
  AArch64_address x = value + aligned_tcb_size;

  // After new insns are written, apply TLSLE relocs.
  const AArch64_reloc_property* rp1 =
      aarch64_reloc_property_table->get_reloc_property(
	  elfcpp::R_AARCH64_TLSLE_ADD_TPREL_HI12);
  const AArch64_reloc_property* rp2 =
      aarch64_reloc_property_table->get_reloc_property(
	  elfcpp::R_AARCH64_TLSLE_ADD_TPREL_LO12);
  gold_assert(rp1 != NULL && rp2 != NULL);

  typename aarch64_reloc_funcs::Status s1 =
      aarch64_reloc_funcs::template rela_general<32>(view + 4,
						     x,
						     addend,
						     rp1);
  if (s1 != aarch64_reloc_funcs::STATUS_OKAY)
    return s1;

  typename aarch64_reloc_funcs::Status s2 =
      aarch64_reloc_funcs::template rela_general<32>(view + 8,
						     x,
						     addend,
						     rp2);

  this->skip_call_tls_get_addr_ = true;
  return s2;
}  // End of tls_gd_to_le


template<int size, bool big_endian>
inline
typename AArch64_relocate_functions<size,big_endian>::Status
Target_aarch64<size, big_endian>::Relocate::tls_ie_to_le(
	     const Relocate_info<size,big_endian>* relinfo,
	     Target_aarch64<size, big_endian>* target,
	     const elfcpp::Rela<size, big_endian>& rela,
	     unsigned int r_type,
	     unsigned char* view,
	     const Symbol_value<size>* psymval)
{
  typedef typename elfcpp::Elf_types<size>::Elf_Addr AArch64_address;
  typedef typename elfcpp::Swap<32, big_endian>::Valtype Insntype;
  typedef AArch64_relocate_functions<size,big_endian> aarch64_reloc_funcs;

  AArch64_address value = psymval->value(relinfo->object, 0);
  Output_segment* tls_segment = relinfo->layout->tls_segment();
  AArch64_address aligned_tcb_address =
      align_address(target->tcb_size(), tls_segment->maximum_alignment());
  const elfcpp::Elf_Xword addend = rela.get_r_addend();
  AArch64_address x = value + addend + aligned_tcb_address;
  // "x" is the offset to tp, we can only do this if x is within
  // range [0, 2^32-1]
  if (!(size == 32 || (size == 64 && (static_cast<uint64_t>(x) >> 32) == 0)))
    {
      gold_error(_("TLS variable referred by reloc %u is too far from TP."),
		 r_type);
      return aarch64_reloc_funcs::STATUS_BAD_RELOC;
    }

  Insntype* ip = reinterpret_cast<Insntype*>(view);
  Insntype insn = elfcpp::Swap<32, big_endian>::readval(ip);
  unsigned int regno;
  Insntype newinsn;
  if (r_type == elfcpp::R_AARCH64_TLSIE_ADR_GOTTPREL_PAGE21)
    {
      // Generate movz.
      regno = (insn & 0x1f);
      newinsn = (0xd2a00000 | regno) | (((x >> 16) & 0xffff) << 5);
    }
  else if (r_type == elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC)
    {
      // Generate movk.
      regno = (insn & 0x1f);
      gold_assert(regno == ((insn >> 5) & 0x1f));
      newinsn = (0xf2800000 | regno) | ((x & 0xffff) << 5);
    }
  else
    gold_assert(false);

  elfcpp::Swap<32, big_endian>::writeval(ip, newinsn);
  return aarch64_reloc_funcs::STATUS_OKAY;
}  // End of tls_ie_to_le


template<int size, bool big_endian>
inline
typename AArch64_relocate_functions<size,big_endian>::Status
Target_aarch64<size, big_endian>::Relocate::tls_desc_gd_to_le(
	     const Relocate_info<size,big_endian>* relinfo,
	     Target_aarch64<size, big_endian>* target,
	     const elfcpp::Rela<size, big_endian>& rela,
	     unsigned int r_type,
	     unsigned char* view,
	     const Symbol_value<size>* psymval)
{
  typedef typename elfcpp::Elf_types<size>::Elf_Addr AArch64_address;
  typedef typename elfcpp::Swap<32, big_endian>::Valtype Insntype;
  typedef AArch64_relocate_functions<size,big_endian> aarch64_reloc_funcs;

  // TLSDESC-GD sequence is like:
  //   adrp  x0, :tlsdesc:v1
  //   ldr   x1, [x0, #:tlsdesc_lo12:v1]
  //   add   x0, x0, :tlsdesc_lo12:v1
  //   .tlsdesccall    v1
  //   blr   x1
  // After desc_gd_to_le optimization, the sequence will be like:
  //   movz  x0, #0x0, lsl #16
  //   movk  x0, #0x10
  //   nop
  //   nop

  // Calculate tprel value.
  Output_segment* tls_segment = relinfo->layout->tls_segment();
  gold_assert(tls_segment != NULL);
  Insntype* ip = reinterpret_cast<Insntype*>(view);
  const elfcpp::Elf_Xword addend = rela.get_r_addend();
  AArch64_address value = psymval->value(relinfo->object, addend);
  AArch64_address aligned_tcb_size =
      align_address(target->tcb_size(), tls_segment->maximum_alignment());
  AArch64_address x = value + aligned_tcb_size;
  // x is the offset to tp, we can only do this if x is within range
  // [0, 2^32-1]. If x is out of range, fail and exit.
  if (size == 64 && (static_cast<uint64_t>(x) >> 32) != 0)
    {
      gold_error(_("TLS variable referred by reloc %u is too far from TP. "
		   "We Can't do gd_to_le relaxation.\n"), r_type);
      return aarch64_reloc_funcs::STATUS_BAD_RELOC;
    }
  Insntype newinsn;
  switch (r_type)
    {
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
    case elfcpp::R_AARCH64_TLSDESC_CALL:
      // Change to nop
      newinsn = 0xd503201f;
      break;

    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
      // Change to movz.
      newinsn = 0xd2a00000 | (((x >> 16) & 0xffff) << 5);
      break;

    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
      // Change to movk.
      newinsn = 0xf2800000 | ((x & 0xffff) << 5);
      break;

    default:
      gold_error(_("unsupported tlsdesc gd_to_le optimization on reloc %u"),
		 r_type);
      gold_unreachable();
    }
  elfcpp::Swap<32, big_endian>::writeval(ip, newinsn);
  return aarch64_reloc_funcs::STATUS_OKAY;
}  // End of tls_desc_gd_to_le


template<int size, bool big_endian>
inline
typename AArch64_relocate_functions<size,big_endian>::Status
Target_aarch64<size, big_endian>::Relocate::tls_desc_gd_to_ie(
	     const Relocate_info<size,big_endian>* /* relinfo */,
	     Target_aarch64<size, big_endian>* /* target */,
	     const elfcpp::Rela<size, big_endian>& rela,
	     unsigned int r_type,
	     unsigned char* view,
	     const Symbol_value<size>* /* psymval */,
	     typename elfcpp::Elf_types<size>::Elf_Addr got_entry_address,
	     typename elfcpp::Elf_types<size>::Elf_Addr address)
{
  typedef typename elfcpp::Swap<32, big_endian>::Valtype Insntype;
  typedef AArch64_relocate_functions<size,big_endian> aarch64_reloc_funcs;

  // TLSDESC-GD sequence is like:
  //   adrp  x0, :tlsdesc:v1
  //   ldr   x1, [x0, #:tlsdesc_lo12:v1]
  //   add   x0, x0, :tlsdesc_lo12:v1
  //   .tlsdesccall    v1
  //   blr   x1
  // After desc_gd_to_ie optimization, the sequence will be like:
  //   adrp  x0, :tlsie:v1
  //   ldr   x0, [x0, :tlsie_lo12:v1]
  //   nop
  //   nop

  Insntype* ip = reinterpret_cast<Insntype*>(view);
  const elfcpp::Elf_Xword addend = rela.get_r_addend();
  Insntype newinsn;
  switch (r_type)
    {
    case elfcpp::R_AARCH64_TLSDESC_ADD_LO12:
    case elfcpp::R_AARCH64_TLSDESC_CALL:
      // Change to nop
      newinsn = 0xd503201f;
      elfcpp::Swap<32, big_endian>::writeval(ip, newinsn);
      break;

    case elfcpp::R_AARCH64_TLSDESC_ADR_PAGE21:
      {
	return aarch64_reloc_funcs::adrp(view, got_entry_address + addend,
					 address);
      }
      break;

    case elfcpp::R_AARCH64_TLSDESC_LD64_LO12:
      {
	const AArch64_reloc_property* reloc_property =
	    aarch64_reloc_property_table->get_reloc_property(
	      elfcpp::R_AARCH64_TLSIE_LD64_GOTTPREL_LO12_NC);
	return aarch64_reloc_funcs::template rela_general<32>(
		 view, got_entry_address, addend, reloc_property);
      }
      break;

    default:
      gold_error(_("Don't support tlsdesc gd_to_ie optimization on reloc %u"),
		 r_type);
      gold_unreachable();
    }
  return aarch64_reloc_funcs::STATUS_OKAY;
}  // End of tls_desc_gd_to_ie

// Relocate section data.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::relocate_section(
    const Relocate_info<size, big_endian>* relinfo,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    bool needs_special_offset_handling,
    unsigned char* view,
    typename elfcpp::Elf_types<size>::Elf_Addr address,
    section_size_type view_size,
    const Reloc_symbol_changes* reloc_symbol_changes)
{
  gold_assert(sh_type == elfcpp::SHT_RELA);
  typedef typename Target_aarch64<size, big_endian>::Relocate AArch64_relocate;
  gold::relocate_section<size, big_endian, Target_aarch64, elfcpp::SHT_RELA,
			 AArch64_relocate, gold::Default_comdat_behavior>(
    relinfo,
    this,
    prelocs,
    reloc_count,
    output_section,
    needs_special_offset_handling,
    view,
    address,
    view_size,
    reloc_symbol_changes);
}

// Return the size of a relocation while scanning during a relocatable
// link.

template<int size, bool big_endian>
unsigned int
Target_aarch64<size, big_endian>::Relocatable_size_for_reloc::
get_size_for_reloc(
    unsigned int ,
    Relobj* )
{
  // We will never support SHT_REL relocations.
  gold_unreachable();
  return 0;
}

// Scan the relocs during a relocatable link.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::scan_relocatable_relocs(
    Symbol_table* symtab,
    Layout* layout,
    Sized_relobj_file<size, big_endian>* object,
    unsigned int data_shndx,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    bool needs_special_offset_handling,
    size_t local_symbol_count,
    const unsigned char* plocal_symbols,
    Relocatable_relocs* rr)
{
  gold_assert(sh_type == elfcpp::SHT_RELA);

  typedef gold::Default_scan_relocatable_relocs<elfcpp::SHT_RELA,
    Relocatable_size_for_reloc> Scan_relocatable_relocs;

  gold::scan_relocatable_relocs<size, big_endian, elfcpp::SHT_RELA,
      Scan_relocatable_relocs>(
    symtab,
    layout,
    object,
    data_shndx,
    prelocs,
    reloc_count,
    output_section,
    needs_special_offset_handling,
    local_symbol_count,
    plocal_symbols,
    rr);
}

// Relocate a section during a relocatable link.

template<int size, bool big_endian>
void
Target_aarch64<size, big_endian>::relocate_relocs(
    const Relocate_info<size, big_endian>* relinfo,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    typename elfcpp::Elf_types<size>::Elf_Off offset_in_output_section,
    const Relocatable_relocs* rr,
    unsigned char* view,
    typename elfcpp::Elf_types<size>::Elf_Addr view_address,
    section_size_type view_size,
    unsigned char* reloc_view,
    section_size_type reloc_view_size)
{
  gold_assert(sh_type == elfcpp::SHT_RELA);

  gold::relocate_relocs<size, big_endian, elfcpp::SHT_RELA>(
    relinfo,
    prelocs,
    reloc_count,
    output_section,
    offset_in_output_section,
    rr,
    view,
    view_address,
    view_size,
    reloc_view,
    reloc_view_size);
}

// The selector for aarch64 object files.

template<int size, bool big_endian>
class Target_selector_aarch64 : public Target_selector
{
 public:
  Target_selector_aarch64();

  virtual Target*
  do_instantiate_target()
  { return new Target_aarch64<size, big_endian>(); }
};

template<>
Target_selector_aarch64<32, true>::Target_selector_aarch64()
  : Target_selector(elfcpp::EM_AARCH64, 32, true,
		    "elf32-bigaarch64", "aarch64_elf32_be_vec")
{ }

template<>
Target_selector_aarch64<32, false>::Target_selector_aarch64()
  : Target_selector(elfcpp::EM_AARCH64, 32, false,
		    "elf32-littleaarch64", "aarch64_elf32_le_vec")
{ }

template<>
Target_selector_aarch64<64, true>::Target_selector_aarch64()
  : Target_selector(elfcpp::EM_AARCH64, 64, true,
		    "elf64-bigaarch64", "aarch64_elf64_be_vec")
{ }

template<>
Target_selector_aarch64<64, false>::Target_selector_aarch64()
  : Target_selector(elfcpp::EM_AARCH64, 64, false,
		    "elf64-littleaarch64", "aarch64_elf64_le_vec")
{ }

Target_selector_aarch64<32, true> target_selector_aarch64elf32b;
Target_selector_aarch64<32, false> target_selector_aarch64elf32;
Target_selector_aarch64<64, true> target_selector_aarch64elfb;
Target_selector_aarch64<64, false> target_selector_aarch64elf;

} // End anonymous namespace.
