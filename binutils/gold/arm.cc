// arm.cc -- arm target support for gold.

// Copyright 2009 Free Software Foundation, Inc.
// Written by Doug Kwan <dougkwan@google.com> based on the i386 code
// by Ian Lance Taylor <iant@google.com>.

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
#include <limits>
#include <cstdio>
#include <string>

#include "elfcpp.h"
#include "parameters.h"
#include "reloc.h"
#include "arm.h"
#include "object.h"
#include "symtab.h"
#include "layout.h"
#include "output.h"
#include "copy-relocs.h"
#include "target.h"
#include "target-reloc.h"
#include "target-select.h"
#include "tls.h"
#include "defstd.h"
#include "gc.h"

namespace
{

using namespace gold;

template<bool big_endian>
class Output_data_plt_arm;

// The arm target class.
//
// This is a very simple port of gold for ARM-EABI.  It is intended for
// supporting Android only for the time being.  Only these relocation types
// are supported.
//
// R_ARM_NONE
// R_ARM_ABS32
// R_ARM_ABS32_NOI
// R_ARM_ABS16
// R_ARM_ABS12
// R_ARM_ABS8
// R_ARM_THM_ABS5
// R_ARM_BASE_ABS
// R_ARM_REL32
// R_ARM_THM_CALL
// R_ARM_COPY
// R_ARM_GLOB_DAT
// R_ARM_BASE_PREL
// R_ARM_JUMP_SLOT
// R_ARM_RELATIVE
// R_ARM_GOTOFF32
// R_ARM_GOT_BREL
// R_ARM_GOT_PREL
// R_ARM_PLT32
// R_ARM_CALL
// R_ARM_JUMP24
// R_ARM_TARGET1
// R_ARM_PREL31
// R_ARM_ABS8
// R_ARM_MOVW_ABS_NC
// R_ARM_MOVT_ABS
// R_ARM_THM_MOVW_ABS_NC
// R_ARM_THM_MOVT_ABS
// R_ARM_MOVW_PREL_NC
// R_ARM_MOVT_PREL
// R_ARM_THM_MOVW_PREL_NC
// R_ARM_THM_MOVT_PREL
// 
// TODOs:
// - Generate various branch stubs.
// - Support interworking.
// - Define section symbols __exidx_start and __exidx_stop.
// - Support more relocation types as needed. 
// - Make PLTs more flexible for different architecture features like
//   Thumb-2 and BE8.
// There are probably a lot more.

// Utilities for manipulating integers of up to 32-bits

namespace utils
{
  // Sign extend an n-bit unsigned integer stored in an uint32_t into
  // an int32_t.  NO_BITS must be between 1 to 32.
  template<int no_bits>
  static inline int32_t
  sign_extend(uint32_t bits)
  {
    gold_assert(no_bits >= 0 && no_bits <= 32);
    if (no_bits == 32)
      return static_cast<int32_t>(bits);
    uint32_t mask = (~((uint32_t) 0)) >> (32 - no_bits);
    bits &= mask;
    uint32_t top_bit = 1U << (no_bits - 1);
    int32_t as_signed = static_cast<int32_t>(bits);
    return (bits & top_bit) ? as_signed + (-top_bit * 2) : as_signed;
  }

  // Detects overflow of an NO_BITS integer stored in a uint32_t.
  template<int no_bits>
  static inline bool
  has_overflow(uint32_t bits)
  {
    gold_assert(no_bits >= 0 && no_bits <= 32);
    if (no_bits == 32)
      return false;
    int32_t max = (1 << (no_bits - 1)) - 1;
    int32_t min = -(1 << (no_bits - 1));
    int32_t as_signed = static_cast<int32_t>(bits);
    return as_signed > max || as_signed < min;
  }

  // Detects overflow of an NO_BITS integer stored in a uint32_t when it
  // fits in the given number of bits as either a signed or unsigned value.
  // For example, has_signed_unsigned_overflow<8> would check
  // -128 <= bits <= 255
  template<int no_bits>
  static inline bool
  has_signed_unsigned_overflow(uint32_t bits)
  {
    gold_assert(no_bits >= 2 && no_bits <= 32);
    if (no_bits == 32)
      return false;
    int32_t max = static_cast<int32_t>((1U << no_bits) - 1);
    int32_t min = -(1 << (no_bits - 1));
    int32_t as_signed = static_cast<int32_t>(bits);
    return as_signed > max || as_signed < min;
  }

  // Select bits from A and B using bits in MASK.  For each n in [0..31],
  // the n-th bit in the result is chosen from the n-th bits of A and B.
  // A zero selects A and a one selects B.
  static inline uint32_t
  bit_select(uint32_t a, uint32_t b, uint32_t mask)
  { return (a & ~mask) | (b & mask); }
};

template<bool big_endian>
class Target_arm : public Sized_target<32, big_endian>
{
 public:
  typedef Output_data_reloc<elfcpp::SHT_REL, true, 32, big_endian>
    Reloc_section;

  Target_arm()
    : Sized_target<32, big_endian>(&arm_info),
      got_(NULL), plt_(NULL), got_plt_(NULL), rel_dyn_(NULL),
      copy_relocs_(elfcpp::R_ARM_COPY), dynbss_(NULL)
  { }

  // Process the relocations to determine unreferenced sections for 
  // garbage collection.
  void
  gc_process_relocs(const General_options& options,
		    Symbol_table* symtab,
		    Layout* layout,
		    Sized_relobj<32, big_endian>* object,
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
  scan_relocs(const General_options& options,
	      Symbol_table* symtab,
	      Layout* layout,
	      Sized_relobj<32, big_endian>* object,
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
  do_finalize_sections(Layout*);

  // Return the value to use for a dynamic symbol which requires special
  // treatment.
  uint64_t
  do_dynsym_value(const Symbol*) const;

  // Relocate a section.
  void
  relocate_section(const Relocate_info<32, big_endian>*,
		   unsigned int sh_type,
		   const unsigned char* prelocs,
		   size_t reloc_count,
		   Output_section* output_section,
		   bool needs_special_offset_handling,
		   unsigned char* view,
		   elfcpp::Elf_types<32>::Elf_Addr view_address,
		   section_size_type view_size,
		   const Reloc_symbol_changes*);

  // Scan the relocs during a relocatable link.
  void
  scan_relocatable_relocs(const General_options& options,
			  Symbol_table* symtab,
			  Layout* layout,
			  Sized_relobj<32, big_endian>* object,
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
  relocate_for_relocatable(const Relocate_info<32, big_endian>*,
			   unsigned int sh_type,
			   const unsigned char* prelocs,
			   size_t reloc_count,
			   Output_section* output_section,
			   off_t offset_in_output_section,
			   const Relocatable_relocs*,
			   unsigned char* view,
			   elfcpp::Elf_types<32>::Elf_Addr view_address,
			   section_size_type view_size,
			   unsigned char* reloc_view,
			   section_size_type reloc_view_size);

  // Return whether SYM is defined by the ABI.
  bool
  do_is_defined_by_abi(Symbol* sym) const
  { return strcmp(sym->name(), "__tls_get_addr") == 0; }

  // Return the size of the GOT section.
  section_size_type
  got_size()
  {
    gold_assert(this->got_ != NULL);
    return this->got_->data_size();
  }

  // Map platform-specific reloc types
  static unsigned int
  get_real_reloc_type (unsigned int r_type);

 private:
  // The class which scans relocations.
  class Scan
  {
   public:
    Scan()
      : issued_non_pic_error_(false)
    { }

    inline void
    local(const General_options& options, Symbol_table* symtab,
	  Layout* layout, Target_arm* target,
	  Sized_relobj<32, big_endian>* object,
	  unsigned int data_shndx,
	  Output_section* output_section,
	  const elfcpp::Rel<32, big_endian>& reloc, unsigned int r_type,
	  const elfcpp::Sym<32, big_endian>& lsym);

    inline void
    global(const General_options& options, Symbol_table* symtab,
	   Layout* layout, Target_arm* target,
	   Sized_relobj<32, big_endian>* object,
	   unsigned int data_shndx,
	   Output_section* output_section,
	   const elfcpp::Rel<32, big_endian>& reloc, unsigned int r_type,
	   Symbol* gsym);

   private:
    static void
    unsupported_reloc_local(Sized_relobj<32, big_endian>*,
			    unsigned int r_type);

    static void
    unsupported_reloc_global(Sized_relobj<32, big_endian>*,
			     unsigned int r_type, Symbol*);

    void
    check_non_pic(Relobj*, unsigned int r_type);

    // Almost identical to Symbol::needs_plt_entry except that it also
    // handles STT_ARM_TFUNC.
    static bool
    symbol_needs_plt_entry(const Symbol* sym)
    {
      // An undefined symbol from an executable does not need a PLT entry.
      if (sym->is_undefined() && !parameters->options().shared())
	return false;

      return (!parameters->doing_static_link()
	      && (sym->type() == elfcpp::STT_FUNC
		  || sym->type() == elfcpp::STT_ARM_TFUNC)
	      && (sym->is_from_dynobj()
		  || sym->is_undefined()
		  || sym->is_preemptible()));
    }

    // Whether we have issued an error about a non-PIC compilation.
    bool issued_non_pic_error_;
  };

  // The class which implements relocation.
  class Relocate
  {
   public:
    Relocate()
    { }

    ~Relocate()
    { }

    // Return whether the static relocation needs to be applied.
    inline bool
    should_apply_static_reloc(const Sized_symbol<32>* gsym,
			      int ref_flags,
			      bool is_32bit,
			      Output_section* output_section);

    // Do a relocation.  Return false if the caller should not issue
    // any warnings about this relocation.
    inline bool
    relocate(const Relocate_info<32, big_endian>*, Target_arm*,
	     Output_section*,  size_t relnum,
	     const elfcpp::Rel<32, big_endian>&,
	     unsigned int r_type, const Sized_symbol<32>*,
	     const Symbol_value<32>*,
	     unsigned char*, elfcpp::Elf_types<32>::Elf_Addr,
	     section_size_type);

    // Return whether we want to pass flag NON_PIC_REF for this
    // reloc.
    static inline bool
    reloc_is_non_pic (unsigned int r_type)
    {
      switch (r_type)
	{
	case elfcpp::R_ARM_REL32:
	case elfcpp::R_ARM_THM_CALL:
	case elfcpp::R_ARM_CALL:
	case elfcpp::R_ARM_JUMP24:
	case elfcpp::R_ARM_PREL31:
	case elfcpp::R_ARM_THM_ABS5:
	case elfcpp::R_ARM_ABS8:
	case elfcpp::R_ARM_ABS12:
	case elfcpp::R_ARM_ABS16:
	case elfcpp::R_ARM_BASE_ABS:
	  return true;
	default:
	  return false;
	}
    }
  };

  // A class which returns the size required for a relocation type,
  // used while scanning relocs during a relocatable link.
  class Relocatable_size_for_reloc
  {
   public:
    unsigned int
    get_size_for_reloc(unsigned int, Relobj*);
  };

  // Get the GOT section, creating it if necessary.
  Output_data_got<32, big_endian>*
  got_section(Symbol_table*, Layout*);

  // Get the GOT PLT section.
  Output_data_space*
  got_plt_section() const
  {
    gold_assert(this->got_plt_ != NULL);
    return this->got_plt_;
  }

  // Create a PLT entry for a global symbol.
  void
  make_plt_entry(Symbol_table*, Layout*, Symbol*);

  // Get the PLT section.
  const Output_data_plt_arm<big_endian>*
  plt_section() const
  {
    gold_assert(this->plt_ != NULL);
    return this->plt_;
  }

  // Get the dynamic reloc section, creating it if necessary.
  Reloc_section*
  rel_dyn_section(Layout*);

  // Return true if the symbol may need a COPY relocation.
  // References from an executable object to non-function symbols
  // defined in a dynamic object may need a COPY relocation.
  bool
  may_need_copy_reloc(Symbol* gsym)
  {
    return (gsym->type() != elfcpp::STT_ARM_TFUNC
	    && gsym->may_need_copy_reloc());
  }

  // Add a potential copy relocation.
  void
  copy_reloc(Symbol_table* symtab, Layout* layout,
	     Sized_relobj<32, big_endian>* object,
	     unsigned int shndx, Output_section* output_section,
	     Symbol* sym, const elfcpp::Rel<32, big_endian>& reloc)
  {
    this->copy_relocs_.copy_reloc(symtab, layout,
				  symtab->get_sized_symbol<32>(sym),
				  object, shndx, output_section, reloc,
				  this->rel_dyn_section(layout));
  }

  // Information about this specific target which we pass to the
  // general Target structure.
  static const Target::Target_info arm_info;

  // The types of GOT entries needed for this platform.
  enum Got_type
  {
    GOT_TYPE_STANDARD = 0	// GOT entry for a regular symbol
  };

  // The GOT section.
  Output_data_got<32, big_endian>* got_;
  // The PLT section.
  Output_data_plt_arm<big_endian>* plt_;
  // The GOT PLT section.
  Output_data_space* got_plt_;
  // The dynamic reloc section.
  Reloc_section* rel_dyn_;
  // Relocs saved to avoid a COPY reloc.
  Copy_relocs<elfcpp::SHT_REL, 32, big_endian> copy_relocs_;
  // Space for variables copied with a COPY reloc.
  Output_data_space* dynbss_;
};

template<bool big_endian>
const Target::Target_info Target_arm<big_endian>::arm_info =
{
  32,			// size
  big_endian,		// is_big_endian
  elfcpp::EM_ARM,	// machine_code
  false,		// has_make_symbol
  false,		// has_resolve
  false,		// has_code_fill
  true,			// is_default_stack_executable
  '\0',			// wrap_char
  "/usr/lib/libc.so.1",	// dynamic_linker
  0x8000,		// default_text_segment_address
  0x1000,		// abi_pagesize (overridable by -z max-page-size)
  0x1000,		// common_pagesize (overridable by -z common-page-size)
  elfcpp::SHN_UNDEF,	// small_common_shndx
  elfcpp::SHN_UNDEF,	// large_common_shndx
  0,			// small_common_section_flags
  0			// large_common_section_flags
};

// Arm relocate functions class
//

template<bool big_endian>
class Arm_relocate_functions : public Relocate_functions<32, big_endian>
{
 public:
  typedef enum
  {
    STATUS_OKAY,	// No error during relocation.
    STATUS_OVERFLOW,	// Relocation oveflow.
    STATUS_BAD_RELOC	// Relocation cannot be applied.
  } Status;

 private:
  typedef Relocate_functions<32, big_endian> Base;
  typedef Arm_relocate_functions<big_endian> This;

  // Get an symbol value of *PSYMVAL with an ADDEND.  This is a wrapper
  // to Symbol_value::value().  If HAS_THUMB_BIT is true, that LSB is used
  // to distinguish ARM and THUMB functions and it is treated specially.
  static inline Symbol_value<32>::Value
  arm_symbol_value (const Sized_relobj<32, big_endian> *object,
		    const Symbol_value<32>* psymval,
		    Symbol_value<32>::Value addend,
		    bool has_thumb_bit)
  {
    typedef Symbol_value<32>::Value Valtype;

    if (has_thumb_bit)
      {
	Valtype raw = psymval->value(object, 0);
	Valtype thumb_bit = raw & 1;
	return ((raw & ~((Valtype) 1)) + addend) | thumb_bit;
      }
    else
      return psymval->value(object, addend);
  }

  // Encoding of imm16 argument for movt and movw ARM instructions
  // from ARM ARM:
  //     
  //     imm16 := imm4 | imm12
  //
  //  f e d c b a 9 8 7 6 5 4 3 2 1 0 f e d c b a 9 8 7 6 5 4 3 2 1 0 
  // +-------+---------------+-------+-------+-----------------------+
  // |       |               |imm4   |       |imm12                  |
  // +-------+---------------+-------+-------+-----------------------+

  // Extract the relocation addend from VAL based on the ARM
  // instruction encoding described above.
  static inline typename elfcpp::Swap<32, big_endian>::Valtype
  extract_arm_movw_movt_addend(
      typename elfcpp::Swap<32, big_endian>::Valtype val)
  {
    // According to the Elf ABI for ARM Architecture the immediate
    // field is sign-extended to form the addend.
    return utils::sign_extend<16>(((val >> 4) & 0xf000) | (val & 0xfff));
  }

  // Insert X into VAL based on the ARM instruction encoding described
  // above.
  static inline typename elfcpp::Swap<32, big_endian>::Valtype
  insert_val_arm_movw_movt(
      typename elfcpp::Swap<32, big_endian>::Valtype val,
      typename elfcpp::Swap<32, big_endian>::Valtype x)
  {
    val &= 0xfff0f000;
    val |= x & 0x0fff;
    val |= (x & 0xf000) << 4;
    return val;
  }

  // Encoding of imm16 argument for movt and movw Thumb2 instructions
  // from ARM ARM:
  //     
  //     imm16 := imm4 | i | imm3 | imm8
  //
  //  f e d c b a 9 8 7 6 5 4 3 2 1 0  f e d c b a 9 8 7 6 5 4 3 2 1 0 
  // +---------+-+-----------+-------++-+-----+-------+---------------+
  // |         |i|           |imm4   || |imm3 |       |imm8           |
  // +---------+-+-----------+-------++-+-----+-------+---------------+

  // Extract the relocation addend from VAL based on the Thumb2
  // instruction encoding described above.
  static inline typename elfcpp::Swap<32, big_endian>::Valtype
  extract_thumb_movw_movt_addend(
      typename elfcpp::Swap<32, big_endian>::Valtype val)
  {
    // According to the Elf ABI for ARM Architecture the immediate
    // field is sign-extended to form the addend.
    return utils::sign_extend<16>(((val >> 4) & 0xf000)
				  | ((val >> 15) & 0x0800)
				  | ((val >> 4) & 0x0700)
				  | (val & 0x00ff));
  }

  // Insert X into VAL based on the Thumb2 instruction encoding
  // described above.
  static inline typename elfcpp::Swap<32, big_endian>::Valtype
  insert_val_thumb_movw_movt(
      typename elfcpp::Swap<32, big_endian>::Valtype val,
      typename elfcpp::Swap<32, big_endian>::Valtype x)
  {
    val &= 0xfbf08f00;
    val |= (x & 0xf000) << 4;
    val |= (x & 0x0800) << 15;
    val |= (x & 0x0700) << 4;
    val |= (x & 0x00ff);
    return val;
  }

  // FIXME: This probably only works for Android on ARM v5te. We should
  // following GNU ld for the general case.
  template<unsigned r_type>
  static inline typename This::Status
  arm_branch_common(unsigned char *view,
		    const Sized_relobj<32, big_endian>* object,
		    const Symbol_value<32>* psymval,
		    elfcpp::Elf_types<32>::Elf_Addr address,
		    bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
     
    bool insn_is_b = (((val >> 28) & 0xf) <= 0xe)
		      && ((val & 0x0f000000UL) == 0x0a000000UL);
    bool insn_is_uncond_bl = (val & 0xff000000UL) == 0xeb000000UL;
    bool insn_is_cond_bl = (((val >> 28) & 0xf) < 0xe)
			    && ((val & 0x0f000000UL) == 0x0b000000UL);
    bool insn_is_blx = (val & 0xfe000000UL) == 0xfa000000UL;
    bool insn_is_any_branch = (val & 0x0e000000UL) == 0x0a000000UL;

    if (r_type == elfcpp::R_ARM_CALL)
      {
	if (!insn_is_uncond_bl && !insn_is_blx)
	  return This::STATUS_BAD_RELOC;
      }
    else if (r_type == elfcpp::R_ARM_JUMP24)
      {
	if (!insn_is_b && !insn_is_cond_bl)
	  return This::STATUS_BAD_RELOC;
      }
    else if (r_type == elfcpp::R_ARM_PLT32)
      {
	if (!insn_is_any_branch)
	  return This::STATUS_BAD_RELOC;
      }
    else
      gold_unreachable();

    Valtype addend = utils::sign_extend<26>(val << 2);
    Valtype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit)
		 - address);

    // If target has thumb bit set, we need to either turn the BL
    // into a BLX (for ARMv5 or above) or generate a stub.
    if (x & 1)
      {
	// Turn BL to BLX.
	if (insn_is_uncond_bl)
	  val = (val & 0xffffff) | 0xfa000000 | ((x & 2) << 23);
	else
	  return This::STATUS_BAD_RELOC;
      }
    else
      gold_assert(!insn_is_blx);

    val = utils::bit_select(val, (x >> 2), 0xffffffUL);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return (utils::has_overflow<26>(x)
	    ? This::STATUS_OVERFLOW : This::STATUS_OKAY);
  }

 public:

  // R_ARM_ABS8: S + A
  static inline typename This::Status
  abs8(unsigned char *view,
       const Sized_relobj<32, big_endian>* object,
       const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<8, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<8, big_endian>::readval(wv);
    Reltype addend = utils::sign_extend<8>(val);
    Reltype x = This::arm_symbol_value(object, psymval, addend, false);
    val = utils::bit_select(val, x, 0xffU);
    elfcpp::Swap<8, big_endian>::writeval(wv, val);
    return (utils::has_signed_unsigned_overflow<8>(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // R_ARM_THM_ABS5: S + A
  static inline typename This::Status
  thm_abs5(unsigned char *view,
       const Sized_relobj<32, big_endian>* object,
       const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<16, big_endian>::readval(wv);
    Reltype addend = (val & 0x7e0U) >> 6;
    Reltype x = This::arm_symbol_value(object, psymval, addend, false);
    val = utils::bit_select(val, x << 6, 0x7e0U);
    elfcpp::Swap<16, big_endian>::writeval(wv, val);
    return (utils::has_overflow<5>(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // R_ARM_ABS12: S + A
  static inline typename This::Status
  abs12(unsigned char *view,
       const Sized_relobj<32, big_endian>* object,
       const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Reltype addend = val & 0x0fffU;
    Reltype x = This::arm_symbol_value(object, psymval, addend, false);
    val = utils::bit_select(val, x, 0x0fffU);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return (utils::has_overflow<12>(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // R_ARM_ABS16: S + A
  static inline typename This::Status
  abs16(unsigned char *view,
       const Sized_relobj<32, big_endian>* object,
       const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<16, big_endian>::readval(wv);
    Reltype addend = utils::sign_extend<16>(val);
    Reltype x = This::arm_symbol_value(object, psymval, addend, false);
    val = utils::bit_select(val, x, 0xffffU);
    elfcpp::Swap<16, big_endian>::writeval(wv, val);
    return (utils::has_signed_unsigned_overflow<16>(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // R_ARM_ABS32: (S + A) | T
  static inline typename This::Status
  abs32(unsigned char *view,
	const Sized_relobj<32, big_endian>* object,
	const Symbol_value<32>* psymval,
	bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype addend = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype x = This::arm_symbol_value(object, psymval, addend, has_thumb_bit);
    elfcpp::Swap<32, big_endian>::writeval(wv, x);
    return This::STATUS_OKAY;
  }

  // R_ARM_REL32: (S + A) | T - P
  static inline typename This::Status
  rel32(unsigned char *view,
	const Sized_relobj<32, big_endian>* object,
	const Symbol_value<32>* psymval,
	elfcpp::Elf_types<32>::Elf_Addr address,
	bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype addend = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit) 
		 - address);
    elfcpp::Swap<32, big_endian>::writeval(wv, x);
    return This::STATUS_OKAY;
  }

  // R_ARM_THM_CALL: (S + A) | T - P
  static inline typename This::Status
  thm_call(unsigned char *view,
	   const Sized_relobj<32, big_endian>* object,
	   const Symbol_value<32>* psymval,
	   elfcpp::Elf_types<32>::Elf_Addr address,
	   bool has_thumb_bit)
  {
    // A thumb call consists of two instructions.
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype hi = elfcpp::Swap<16, big_endian>::readval(wv);
    Valtype lo = elfcpp::Swap<16, big_endian>::readval(wv + 1);
    // Must be a BL instruction. lo == 11111xxxxxxxxxxx.
    gold_assert((lo & 0xf800) == 0xf800);
    Reltype addend = utils::sign_extend<23>(((hi & 0x7ff) << 12)
					   | ((lo & 0x7ff) << 1));
    Reltype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit)
		 - address);

    // If target has no thumb bit set, we need to either turn the BL
    // into a BLX (for ARMv5 or above) or generate a stub.
    if ((x & 1) == 0)
      {
	// This only works for ARMv5 and above with interworking enabled.
	lo &= 0xefff;
      }
    hi = utils::bit_select(hi, (x >> 12), 0x7ffU);
    lo = utils::bit_select(lo, (x >> 1), 0x7ffU);
    elfcpp::Swap<16, big_endian>::writeval(wv, hi);
    elfcpp::Swap<16, big_endian>::writeval(wv + 1, lo);
    return (utils::has_overflow<23>(x)
	    ? This::STATUS_OVERFLOW
	    : This::STATUS_OKAY);
  }

  // R_ARM_BASE_PREL: B(S) + A - P
  static inline typename This::Status
  base_prel(unsigned char* view,
	    elfcpp::Elf_types<32>::Elf_Addr origin,
	    elfcpp::Elf_types<32>::Elf_Addr address)
  {
    Base::rel32(view, origin - address);
    return STATUS_OKAY;
  }

  // R_ARM_BASE_ABS: B(S) + A
  static inline typename This::Status
  base_abs(unsigned char* view,
	    elfcpp::Elf_types<32>::Elf_Addr origin)
  {
    Base::rel32(view, origin);
    return STATUS_OKAY;
  }

  // R_ARM_GOT_BREL: GOT(S) + A - GOT_ORG
  static inline typename This::Status
  got_brel(unsigned char* view,
	   typename elfcpp::Swap<32, big_endian>::Valtype got_offset)
  {
    Base::rel32(view, got_offset);
    return This::STATUS_OKAY;
  }

  // R_ARM_GOT_PREL: GOT(S) + A – P
  static inline typename This::Status
  got_prel(unsigned char* view,
	   typename elfcpp::Swap<32, big_endian>::Valtype got_offset,
	   elfcpp::Elf_types<32>::Elf_Addr address)
  {
    Base::rel32(view, got_offset - address);
    return This::STATUS_OKAY;
  }

  // R_ARM_PLT32: (S + A) | T - P
  static inline typename This::Status
  plt32(unsigned char *view,
	const Sized_relobj<32, big_endian>* object,
	const Symbol_value<32>* psymval,
	elfcpp::Elf_types<32>::Elf_Addr address,
	bool has_thumb_bit)
  {
    return arm_branch_common<elfcpp::R_ARM_PLT32>(view, object, psymval,
						  address, has_thumb_bit);
  }

  // R_ARM_CALL: (S + A) | T - P
  static inline typename This::Status
  call(unsigned char *view,
       const Sized_relobj<32, big_endian>* object,
       const Symbol_value<32>* psymval,
       elfcpp::Elf_types<32>::Elf_Addr address,
       bool has_thumb_bit)
  {
    return arm_branch_common<elfcpp::R_ARM_CALL>(view, object, psymval,
						 address, has_thumb_bit);
  }

  // R_ARM_JUMP24: (S + A) | T - P
  static inline typename This::Status
  jump24(unsigned char *view,
	 const Sized_relobj<32, big_endian>* object,
	 const Symbol_value<32>* psymval,
	 elfcpp::Elf_types<32>::Elf_Addr address,
	 bool has_thumb_bit)
  {
    return arm_branch_common<elfcpp::R_ARM_JUMP24>(view, object, psymval,
						   address, has_thumb_bit);
  }

  // R_ARM_PREL: (S + A) | T - P
  static inline typename This::Status
  prel31(unsigned char *view,
	 const Sized_relobj<32, big_endian>* object,
	 const Symbol_value<32>* psymval,
	 elfcpp::Elf_types<32>::Elf_Addr address,
	 bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype addend = utils::sign_extend<31>(val);
    Valtype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit)
		 - address);
    val = utils::bit_select(val, x, 0x7fffffffU);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return (utils::has_overflow<31>(x) ?
	    This::STATUS_OVERFLOW : This::STATUS_OKAY);
  }

  // R_ARM_MOVW_ABS_NC: (S + A) | T
  static inline typename This::Status 
  movw_abs_nc(unsigned char *view,
	      const Sized_relobj<32, big_endian>* object,
	      const Symbol_value<32>* psymval,
	      bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype addend =  This::extract_arm_movw_movt_addend(val);
    Valtype x = This::arm_symbol_value(object, psymval, addend, has_thumb_bit);
    val = This::insert_val_arm_movw_movt(val, x);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return This::STATUS_OKAY;
  }

  // R_ARM_MOVT_ABS: S + A
  static inline typename This::Status
  movt_abs(unsigned char *view,
	   const Sized_relobj<32, big_endian>* object,
           const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype addend = This::extract_arm_movw_movt_addend(val);
    Valtype x = This::arm_symbol_value(object, psymval, addend, 0) >> 16;
    val = This::insert_val_arm_movw_movt(val, x);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return This::STATUS_OKAY;
  }

  //  R_ARM_THM_MOVW_ABS_NC: S + A | T
  static inline typename This::Status 
  thm_movw_abs_nc(unsigned char *view,
	          const Sized_relobj<32, big_endian>* object,
	          const Symbol_value<32>* psymval,
	          bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Reltype val = ((elfcpp::Swap<16, big_endian>::readval(wv) << 16)
		   | elfcpp::Swap<16, big_endian>::readval(wv + 1));
    Reltype addend = extract_thumb_movw_movt_addend(val);
    Reltype x = This::arm_symbol_value(object, psymval, addend, has_thumb_bit);
    val = This::insert_val_thumb_movw_movt(val, x);
    elfcpp::Swap<16, big_endian>::writeval(wv, val >> 16);
    elfcpp::Swap<16, big_endian>::writeval(wv + 1, val & 0xffff);
    return This::STATUS_OKAY;
  }

  //  R_ARM_THM_MOVT_ABS: S + A
  static inline typename This::Status 
  thm_movt_abs(unsigned char *view,
	       const Sized_relobj<32, big_endian>* object,
	       const Symbol_value<32>* psymval)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Reltype val = ((elfcpp::Swap<16, big_endian>::readval(wv) << 16)
		   | elfcpp::Swap<16, big_endian>::readval(wv + 1));
    Reltype addend = This::extract_thumb_movw_movt_addend(val);
    Reltype x = This::arm_symbol_value(object, psymval, addend, 0) >> 16;
    val = This::insert_val_thumb_movw_movt(val, x);
    elfcpp::Swap<16, big_endian>::writeval(wv, val >> 16);
    elfcpp::Swap<16, big_endian>::writeval(wv + 1, val & 0xffff);
    return This::STATUS_OKAY;
  }

  // R_ARM_MOVW_PREL_NC: (S + A) | T - P
  static inline typename This::Status
  movw_prel_nc(unsigned char *view,
	       const Sized_relobj<32, big_endian>* object,
	       const Symbol_value<32>* psymval,
	       elfcpp::Elf_types<32>::Elf_Addr address,
	       bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype addend = This::extract_arm_movw_movt_addend(val);
    Valtype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit)
                 - address);
    val = This::insert_val_arm_movw_movt(val, x);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return This::STATUS_OKAY;
  }

  // R_ARM_MOVT_PREL: S + A - P
  static inline typename This::Status
  movt_prel(unsigned char *view,
	    const Sized_relobj<32, big_endian>* object,
	    const Symbol_value<32>* psymval,
            elfcpp::Elf_types<32>::Elf_Addr address)
  {
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Valtype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Valtype val = elfcpp::Swap<32, big_endian>::readval(wv);
    Valtype addend = This::extract_arm_movw_movt_addend(val);
    Valtype x = (This::arm_symbol_value(object, psymval, addend, 0)
                 - address) >> 16;
    val = This::insert_val_arm_movw_movt(val, x);
    elfcpp::Swap<32, big_endian>::writeval(wv, val);
    return This::STATUS_OKAY;
  }

  // R_ARM_THM_MOVW_PREL_NC: (S + A) | T - P
  static inline typename This::Status
  thm_movw_prel_nc(unsigned char *view,
	           const Sized_relobj<32, big_endian>* object,
	           const Symbol_value<32>* psymval,
	           elfcpp::Elf_types<32>::Elf_Addr address,
	           bool has_thumb_bit)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Reltype val = (elfcpp::Swap<16, big_endian>::readval(wv) << 16)
		  | elfcpp::Swap<16, big_endian>::readval(wv + 1);
    Reltype addend = This::extract_thumb_movw_movt_addend(val);
    Reltype x = (This::arm_symbol_value(object, psymval, addend, has_thumb_bit)
                 - address);
    val = This::insert_val_thumb_movw_movt(val, x);
    elfcpp::Swap<16, big_endian>::writeval(wv, val >> 16);
    elfcpp::Swap<16, big_endian>::writeval(wv + 1, val & 0xffff);
    return This::STATUS_OKAY;
  }

  // R_ARM_THM_MOVT_PREL: S + A - P
  static inline typename This::Status
  thm_movt_prel(unsigned char *view,
	        const Sized_relobj<32, big_endian>* object,
	        const Symbol_value<32>* psymval,
	        elfcpp::Elf_types<32>::Elf_Addr address)
  {
    typedef typename elfcpp::Swap<16, big_endian>::Valtype Valtype;
    typedef typename elfcpp::Swap<32, big_endian>::Valtype Reltype;
    Valtype* wv = reinterpret_cast<Valtype*>(view);
    Reltype val = (elfcpp::Swap<16, big_endian>::readval(wv) << 16)
		  | elfcpp::Swap<16, big_endian>::readval(wv + 1);
    Reltype addend = This::extract_thumb_movw_movt_addend(val);
    Reltype x = (This::arm_symbol_value(object, psymval, addend, 0)
                 - address) >> 16;
    val = This::insert_val_thumb_movw_movt(val, x);
    elfcpp::Swap<16, big_endian>::writeval(wv, val >> 16);
    elfcpp::Swap<16, big_endian>::writeval(wv + 1, val & 0xffff);
    return This::STATUS_OKAY;
  }
};

// Get the GOT section, creating it if necessary.

template<bool big_endian>
Output_data_got<32, big_endian>*
Target_arm<big_endian>::got_section(Symbol_table* symtab, Layout* layout)
{
  if (this->got_ == NULL)
    {
      gold_assert(symtab != NULL && layout != NULL);

      this->got_ = new Output_data_got<32, big_endian>();

      Output_section* os;
      os = layout->add_output_section_data(".got", elfcpp::SHT_PROGBITS,
					   (elfcpp::SHF_ALLOC
					    | elfcpp::SHF_WRITE),
					   this->got_, false);
      os->set_is_relro();

      // The old GNU linker creates a .got.plt section.  We just
      // create another set of data in the .got section.  Note that we
      // always create a PLT if we create a GOT, although the PLT
      // might be empty.
      this->got_plt_ = new Output_data_space(4, "** GOT PLT");
      os = layout->add_output_section_data(".got", elfcpp::SHT_PROGBITS,
					   (elfcpp::SHF_ALLOC
					    | elfcpp::SHF_WRITE),
					   this->got_plt_, false);
      os->set_is_relro();

      // The first three entries are reserved.
      this->got_plt_->set_current_data_size(3 * 4);

      // Define _GLOBAL_OFFSET_TABLE_ at the start of the PLT.
      symtab->define_in_output_data("_GLOBAL_OFFSET_TABLE_", NULL,
				    this->got_plt_,
				    0, 0, elfcpp::STT_OBJECT,
				    elfcpp::STB_LOCAL,
				    elfcpp::STV_HIDDEN, 0,
				    false, false);
    }
  return this->got_;
}

// Get the dynamic reloc section, creating it if necessary.

template<bool big_endian>
typename Target_arm<big_endian>::Reloc_section*
Target_arm<big_endian>::rel_dyn_section(Layout* layout)
{
  if (this->rel_dyn_ == NULL)
    {
      gold_assert(layout != NULL);
      this->rel_dyn_ = new Reloc_section(parameters->options().combreloc());
      layout->add_output_section_data(".rel.dyn", elfcpp::SHT_REL,
				      elfcpp::SHF_ALLOC, this->rel_dyn_, true);
    }
  return this->rel_dyn_;
}

// A class to handle the PLT data.

template<bool big_endian>
class Output_data_plt_arm : public Output_section_data
{
 public:
  typedef Output_data_reloc<elfcpp::SHT_REL, true, 32, big_endian>
    Reloc_section;

  Output_data_plt_arm(Layout*, Output_data_space*);

  // Add an entry to the PLT.
  void
  add_entry(Symbol* gsym);

  // Return the .rel.plt section data.
  const Reloc_section*
  rel_plt() const
  { return this->rel_; }

 protected:
  void
  do_adjust_output_section(Output_section* os);

  // Write to a map file.
  void
  do_print_to_mapfile(Mapfile* mapfile) const
  { mapfile->print_output_data(this, _("** PLT")); }

 private:
  // Template for the first PLT entry.
  static const uint32_t first_plt_entry[5];

  // Template for subsequent PLT entries. 
  static const uint32_t plt_entry[3];

  // Set the final size.
  void
  set_final_data_size()
  {
    this->set_data_size(sizeof(first_plt_entry)
			+ this->count_ * sizeof(plt_entry));
  }

  // Write out the PLT data.
  void
  do_write(Output_file*);

  // The reloc section.
  Reloc_section* rel_;
  // The .got.plt section.
  Output_data_space* got_plt_;
  // The number of PLT entries.
  unsigned int count_;
};

// Create the PLT section.  The ordinary .got section is an argument,
// since we need to refer to the start.  We also create our own .got
// section just for PLT entries.

template<bool big_endian>
Output_data_plt_arm<big_endian>::Output_data_plt_arm(Layout* layout,
						     Output_data_space* got_plt)
  : Output_section_data(4), got_plt_(got_plt), count_(0)
{
  this->rel_ = new Reloc_section(false);
  layout->add_output_section_data(".rel.plt", elfcpp::SHT_REL,
				  elfcpp::SHF_ALLOC, this->rel_, true);
}

template<bool big_endian>
void
Output_data_plt_arm<big_endian>::do_adjust_output_section(Output_section* os)
{
  os->set_entsize(0);
}

// Add an entry to the PLT.

template<bool big_endian>
void
Output_data_plt_arm<big_endian>::add_entry(Symbol* gsym)
{
  gold_assert(!gsym->has_plt_offset());

  // Note that when setting the PLT offset we skip the initial
  // reserved PLT entry.
  gsym->set_plt_offset((this->count_) * sizeof(plt_entry)
		       + sizeof(first_plt_entry));

  ++this->count_;

  section_offset_type got_offset = this->got_plt_->current_data_size();

  // Every PLT entry needs a GOT entry which points back to the PLT
  // entry (this will be changed by the dynamic linker, normally
  // lazily when the function is called).
  this->got_plt_->set_current_data_size(got_offset + 4);

  // Every PLT entry needs a reloc.
  gsym->set_needs_dynsym_entry();
  this->rel_->add_global(gsym, elfcpp::R_ARM_JUMP_SLOT, this->got_plt_,
			 got_offset);

  // Note that we don't need to save the symbol.  The contents of the
  // PLT are independent of which symbols are used.  The symbols only
  // appear in the relocations.
}

// ARM PLTs.
// FIXME:  This is not very flexible.  Right now this has only been tested
// on armv5te.  If we are to support additional architecture features like
// Thumb-2 or BE8, we need to make this more flexible like GNU ld.

// The first entry in the PLT.
template<bool big_endian>
const uint32_t Output_data_plt_arm<big_endian>::first_plt_entry[5] =
{
  0xe52de004,	// str   lr, [sp, #-4]!
  0xe59fe004,   // ldr   lr, [pc, #4]
  0xe08fe00e,	// add   lr, pc, lr 
  0xe5bef008,	// ldr   pc, [lr, #8]!
  0x00000000,	// &GOT[0] - .
};

// Subsequent entries in the PLT.

template<bool big_endian>
const uint32_t Output_data_plt_arm<big_endian>::plt_entry[3] =
{
  0xe28fc600,	// add   ip, pc, #0xNN00000
  0xe28cca00,	// add   ip, ip, #0xNN000
  0xe5bcf000,	// ldr   pc, [ip, #0xNNN]!
};

// Write out the PLT.  This uses the hand-coded instructions above,
// and adjusts them as needed.  This is all specified by the arm ELF
// Processor Supplement.

template<bool big_endian>
void
Output_data_plt_arm<big_endian>::do_write(Output_file* of)
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

  elfcpp::Elf_types<32>::Elf_Addr plt_address = this->address();
  elfcpp::Elf_types<32>::Elf_Addr got_address = this->got_plt_->address();

  // Write first PLT entry.  All but the last word are constants.
  const size_t num_first_plt_words = (sizeof(first_plt_entry)
				      / sizeof(plt_entry[0]));
  for (size_t i = 0; i < num_first_plt_words - 1; i++)
    elfcpp::Swap<32, big_endian>::writeval(pov + i * 4, first_plt_entry[i]);
  // Last word in first PLT entry is &GOT[0] - .
  elfcpp::Swap<32, big_endian>::writeval(pov + 16,
					 got_address - (plt_address + 16));
  pov += sizeof(first_plt_entry);

  unsigned char* got_pov = got_view;

  memset(got_pov, 0, 12);
  got_pov += 12;

  const int rel_size = elfcpp::Elf_sizes<32>::rel_size;
  unsigned int plt_offset = sizeof(first_plt_entry);
  unsigned int plt_rel_offset = 0;
  unsigned int got_offset = 12;
  const unsigned int count = this->count_;
  for (unsigned int i = 0;
       i < count;
       ++i,
	 pov += sizeof(plt_entry),
	 got_pov += 4,
	 plt_offset += sizeof(plt_entry),
	 plt_rel_offset += rel_size,
	 got_offset += 4)
    {
      // Set and adjust the PLT entry itself.
      int32_t offset = ((got_address + got_offset)
			 - (plt_address + plt_offset + 8));

      gold_assert(offset >= 0 && offset < 0x0fffffff);
      uint32_t plt_insn0 = plt_entry[0] | ((offset >> 20) & 0xff);
      elfcpp::Swap<32, big_endian>::writeval(pov, plt_insn0);
      uint32_t plt_insn1 = plt_entry[1] | ((offset >> 12) & 0xff);
      elfcpp::Swap<32, big_endian>::writeval(pov + 4, plt_insn1);
      uint32_t plt_insn2 = plt_entry[2] | (offset & 0xfff);
      elfcpp::Swap<32, big_endian>::writeval(pov + 8, plt_insn2);

      // Set the entry in the GOT.
      elfcpp::Swap<32, big_endian>::writeval(got_pov, plt_address);
    }

  gold_assert(static_cast<section_size_type>(pov - oview) == oview_size);
  gold_assert(static_cast<section_size_type>(got_pov - got_view) == got_size);

  of->write_output_view(offset, oview_size, oview);
  of->write_output_view(got_file_offset, got_size, got_view);
}

// Create a PLT entry for a global symbol.

template<bool big_endian>
void
Target_arm<big_endian>::make_plt_entry(Symbol_table* symtab, Layout* layout,
				       Symbol* gsym)
{
  if (gsym->has_plt_offset())
    return;

  if (this->plt_ == NULL)
    {
      // Create the GOT sections first.
      this->got_section(symtab, layout);

      this->plt_ = new Output_data_plt_arm<big_endian>(layout, this->got_plt_);
      layout->add_output_section_data(".plt", elfcpp::SHT_PROGBITS,
				      (elfcpp::SHF_ALLOC
				       | elfcpp::SHF_EXECINSTR),
				      this->plt_, false);
    }
  this->plt_->add_entry(gsym);
}

// Report an unsupported relocation against a local symbol.

template<bool big_endian>
void
Target_arm<big_endian>::Scan::unsupported_reloc_local(
    Sized_relobj<32, big_endian>* object,
    unsigned int r_type)
{
  gold_error(_("%s: unsupported reloc %u against local symbol"),
	     object->name().c_str(), r_type);
}

// We are about to emit a dynamic relocation of type R_TYPE.  If the
// dynamic linker does not support it, issue an error.  The GNU linker
// only issues a non-PIC error for an allocated read-only section.
// Here we know the section is allocated, but we don't know that it is
// read-only.  But we check for all the relocation types which the
// glibc dynamic linker supports, so it seems appropriate to issue an
// error even if the section is not read-only.

template<bool big_endian>
void
Target_arm<big_endian>::Scan::check_non_pic(Relobj* object,
					    unsigned int r_type)
{
  switch (r_type)
    {
    // These are the relocation types supported by glibc for ARM.
    case elfcpp::R_ARM_RELATIVE:
    case elfcpp::R_ARM_COPY:
    case elfcpp::R_ARM_GLOB_DAT:
    case elfcpp::R_ARM_JUMP_SLOT:
    case elfcpp::R_ARM_ABS32:
    case elfcpp::R_ARM_ABS32_NOI:
    case elfcpp::R_ARM_PC24:
    // FIXME: The following 3 types are not supported by Android's dynamic
    // linker.
    case elfcpp::R_ARM_TLS_DTPMOD32:
    case elfcpp::R_ARM_TLS_DTPOFF32:
    case elfcpp::R_ARM_TLS_TPOFF32:
      return;

    default:
      // This prevents us from issuing more than one error per reloc
      // section.  But we can still wind up issuing more than one
      // error per object file.
      if (this->issued_non_pic_error_)
	return;
      object->error(_("requires unsupported dynamic reloc; "
		      "recompile with -fPIC"));
      this->issued_non_pic_error_ = true;
      return;

    case elfcpp::R_ARM_NONE:
      gold_unreachable();
    }
}

// Scan a relocation for a local symbol.
// FIXME: This only handles a subset of relocation types used by Android
// on ARM v5te devices.

template<bool big_endian>
inline void
Target_arm<big_endian>::Scan::local(const General_options&,
				    Symbol_table* symtab,
				    Layout* layout,
				    Target_arm* target,
				    Sized_relobj<32, big_endian>* object,
				    unsigned int data_shndx,
				    Output_section* output_section,
				    const elfcpp::Rel<32, big_endian>& reloc,
				    unsigned int r_type,
				    const elfcpp::Sym<32, big_endian>&)
{
  r_type = get_real_reloc_type(r_type);
  switch (r_type)
    {
    case elfcpp::R_ARM_NONE:
      break;

    case elfcpp::R_ARM_ABS32:
    case elfcpp::R_ARM_ABS32_NOI:
      // If building a shared library (or a position-independent
      // executable), we need to create a dynamic relocation for
      // this location. The relocation applied at link time will
      // apply the link-time value, so we flag the location with
      // an R_ARM_RELATIVE relocation so the dynamic loader can
      // relocate it easily.
      if (parameters->options().output_is_position_independent())
	{
	  Reloc_section* rel_dyn = target->rel_dyn_section(layout);
	  unsigned int r_sym = elfcpp::elf_r_sym<32>(reloc.get_r_info());
   	  // If we are to add more other reloc types than R_ARM_ABS32,
   	  // we need to add check_non_pic(object, r_type) here.
	  rel_dyn->add_local_relative(object, r_sym, elfcpp::R_ARM_RELATIVE,
				      output_section, data_shndx,
				      reloc.get_r_offset());
	}
      break;

    case elfcpp::R_ARM_REL32:
    case elfcpp::R_ARM_THM_CALL:
    case elfcpp::R_ARM_CALL:
    case elfcpp::R_ARM_PREL31:
    case elfcpp::R_ARM_JUMP24:
    case elfcpp::R_ARM_PLT32:
    case elfcpp::R_ARM_THM_ABS5:
    case elfcpp::R_ARM_ABS8:
    case elfcpp::R_ARM_ABS12:
    case elfcpp::R_ARM_ABS16:
    case elfcpp::R_ARM_BASE_ABS:
    case elfcpp::R_ARM_MOVW_ABS_NC:
    case elfcpp::R_ARM_MOVT_ABS:
    case elfcpp::R_ARM_THM_MOVW_ABS_NC:
    case elfcpp::R_ARM_THM_MOVT_ABS:
    case elfcpp::R_ARM_MOVW_PREL_NC:
    case elfcpp::R_ARM_MOVT_PREL:
    case elfcpp::R_ARM_THM_MOVW_PREL_NC:
    case elfcpp::R_ARM_THM_MOVT_PREL:
      break;

    case elfcpp::R_ARM_GOTOFF32:
      // We need a GOT section:
      target->got_section(symtab, layout);
      break;

    case elfcpp::R_ARM_BASE_PREL:
      // FIXME: What about this?
      break;

    case elfcpp::R_ARM_GOT_BREL:
    case elfcpp::R_ARM_GOT_PREL:
      {
	// The symbol requires a GOT entry.
	Output_data_got<32, big_endian>* got =
	  target->got_section(symtab, layout);
	unsigned int r_sym = elfcpp::elf_r_sym<32>(reloc.get_r_info());
	if (got->add_local(object, r_sym, GOT_TYPE_STANDARD))
	  {
	    // If we are generating a shared object, we need to add a
	    // dynamic RELATIVE relocation for this symbol's GOT entry.
	    if (parameters->options().output_is_position_independent())
	      {
		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
		unsigned int r_sym = elfcpp::elf_r_sym<32>(reloc.get_r_info());
		rel_dyn->add_local_relative(
		    object, r_sym, elfcpp::R_ARM_RELATIVE, got,
		    object->local_got_offset(r_sym, GOT_TYPE_STANDARD));
	      }
	  }
      }
      break;

    case elfcpp::R_ARM_TARGET1:
      // This should have been mapped to another type already.
      // Fall through.
    case elfcpp::R_ARM_COPY:
    case elfcpp::R_ARM_GLOB_DAT:
    case elfcpp::R_ARM_JUMP_SLOT:
    case elfcpp::R_ARM_RELATIVE:
      // These are relocations which should only be seen by the
      // dynamic linker, and should never be seen here.
      gold_error(_("%s: unexpected reloc %u in object file"),
		 object->name().c_str(), r_type);
      break;

    default:
      unsupported_reloc_local(object, r_type);
      break;
    }
}

// Report an unsupported relocation against a global symbol.

template<bool big_endian>
void
Target_arm<big_endian>::Scan::unsupported_reloc_global(
    Sized_relobj<32, big_endian>* object,
    unsigned int r_type,
    Symbol* gsym)
{
  gold_error(_("%s: unsupported reloc %u against global symbol %s"),
	     object->name().c_str(), r_type, gsym->demangled_name().c_str());
}

// Scan a relocation for a global symbol.
// FIXME: This only handles a subset of relocation types used by Android
// on ARM v5te devices.

template<bool big_endian>
inline void
Target_arm<big_endian>::Scan::global(const General_options&,
				     Symbol_table* symtab,
				     Layout* layout,
				     Target_arm* target,
				     Sized_relobj<32, big_endian>* object,
				     unsigned int data_shndx,
				     Output_section* output_section,
				     const elfcpp::Rel<32, big_endian>& reloc,
				     unsigned int r_type,
				     Symbol* gsym)
{
  r_type = get_real_reloc_type(r_type);
  switch (r_type)
    {
    case elfcpp::R_ARM_NONE:
      break;

    case elfcpp::R_ARM_ABS32:
    case elfcpp::R_ARM_ABS32_NOI:
      {
	// Make a dynamic relocation if necessary.
	if (gsym->needs_dynamic_reloc(Symbol::ABSOLUTE_REF))
	  {
	    if (target->may_need_copy_reloc(gsym))
	      {
		target->copy_reloc(symtab, layout, object,
				   data_shndx, output_section, gsym, reloc);
	      }
	    else if (gsym->can_use_relative_reloc(false))
	      {
   		// If we are to add more other reloc types than R_ARM_ABS32,
   		// we need to add check_non_pic(object, r_type) here.
		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
		rel_dyn->add_global_relative(gsym, elfcpp::R_ARM_RELATIVE,
					     output_section, object,
					     data_shndx, reloc.get_r_offset());
	      }
	    else
	      {
   		// If we are to add more other reloc types than R_ARM_ABS32,
   		// we need to add check_non_pic(object, r_type) here.
		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
		rel_dyn->add_global(gsym, r_type, output_section, object,
				    data_shndx, reloc.get_r_offset());
	      }
	  }
      }
      break;

    case elfcpp::R_ARM_MOVW_ABS_NC:
    case elfcpp::R_ARM_MOVT_ABS:
    case elfcpp::R_ARM_THM_MOVW_ABS_NC:
    case elfcpp::R_ARM_THM_MOVT_ABS:
    case elfcpp::R_ARM_MOVW_PREL_NC:
    case elfcpp::R_ARM_MOVT_PREL:
    case elfcpp::R_ARM_THM_MOVW_PREL_NC:
    case elfcpp::R_ARM_THM_MOVT_PREL:
      break;

    case elfcpp::R_ARM_THM_ABS5:
    case elfcpp::R_ARM_ABS8:
    case elfcpp::R_ARM_ABS12:
    case elfcpp::R_ARM_ABS16:
    case elfcpp::R_ARM_BASE_ABS:
      {
	// No dynamic relocs of this kinds.
	// Report the error in case of PIC.
	int flags = Symbol::NON_PIC_REF;
	if (gsym->type() == elfcpp::STT_FUNC
	    || gsym->type() == elfcpp::STT_ARM_TFUNC)
	  flags |= Symbol::FUNCTION_CALL;
	if (gsym->needs_dynamic_reloc(flags))
	  check_non_pic(object, r_type);
      }
      break;

    case elfcpp::R_ARM_REL32:
    case elfcpp::R_ARM_PREL31:
      {
	// Make a dynamic relocation if necessary.
	int flags = Symbol::NON_PIC_REF;
	if (gsym->needs_dynamic_reloc(flags))
	  {
	    if (target->may_need_copy_reloc(gsym))
	      {
		target->copy_reloc(symtab, layout, object,
				   data_shndx, output_section, gsym, reloc);
	      }
	    else
	      {
		check_non_pic(object, r_type);
		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
		rel_dyn->add_global(gsym, r_type, output_section, object,
				    data_shndx, reloc.get_r_offset());
	      }
	  }
      }
      break;

    case elfcpp::R_ARM_JUMP24:
    case elfcpp::R_ARM_THM_CALL:
    case elfcpp::R_ARM_CALL:
      {
	if (Target_arm<big_endian>::Scan::symbol_needs_plt_entry(gsym))
	  target->make_plt_entry(symtab, layout, gsym);
	// Make a dynamic relocation if necessary.
	int flags = Symbol::NON_PIC_REF;
	if (gsym->type() == elfcpp::STT_FUNC
	    || gsym->type() == elfcpp::STT_ARM_TFUNC)
	  flags |= Symbol::FUNCTION_CALL;
	if (gsym->needs_dynamic_reloc(flags))
	  {
	    if (target->may_need_copy_reloc(gsym))
	      {
		target->copy_reloc(symtab, layout, object,
				   data_shndx, output_section, gsym,
				   reloc);
	      }
	    else
	      {
		check_non_pic(object, r_type);
		Reloc_section* rel_dyn = target->rel_dyn_section(layout);
		rel_dyn->add_global(gsym, r_type, output_section, object,
				    data_shndx, reloc.get_r_offset());
	      }
	  }
      }
      break;

    case elfcpp::R_ARM_PLT32:
      // If the symbol is fully resolved, this is just a relative
      // local reloc.  Otherwise we need a PLT entry.
      if (gsym->final_value_is_known())
	break;
      // If building a shared library, we can also skip the PLT entry
      // if the symbol is defined in the output file and is protected
      // or hidden.
      if (gsym->is_defined()
	  && !gsym->is_from_dynobj()
	  && !gsym->is_preemptible())
	break;
      target->make_plt_entry(symtab, layout, gsym);
      break;

    case elfcpp::R_ARM_GOTOFF32:
      // We need a GOT section.
      target->got_section(symtab, layout);
      break;

    case elfcpp::R_ARM_BASE_PREL:
      // FIXME: What about this?
      break;
      
    case elfcpp::R_ARM_GOT_BREL:
    case elfcpp::R_ARM_GOT_PREL:
      {
	// The symbol requires a GOT entry.
	Output_data_got<32, big_endian>* got =
	  target->got_section(symtab, layout);
	if (gsym->final_value_is_known())
	  got->add_global(gsym, GOT_TYPE_STANDARD);
	else
	  {
	    // If this symbol is not fully resolved, we need to add a
	    // GOT entry with a dynamic relocation.
	    Reloc_section* rel_dyn = target->rel_dyn_section(layout);
	    if (gsym->is_from_dynobj()
		|| gsym->is_undefined()
		|| gsym->is_preemptible())
	      got->add_global_with_rel(gsym, GOT_TYPE_STANDARD,
				       rel_dyn, elfcpp::R_ARM_GLOB_DAT);
	    else
	      {
		if (got->add_global(gsym, GOT_TYPE_STANDARD))
		  rel_dyn->add_global_relative(
		      gsym, elfcpp::R_ARM_RELATIVE, got,
		      gsym->got_offset(GOT_TYPE_STANDARD));
	      }
	  }
      }
      break;

    case elfcpp::R_ARM_TARGET1:
      // This should have been mapped to another type already.
      // Fall through.
    case elfcpp::R_ARM_COPY:
    case elfcpp::R_ARM_GLOB_DAT:
    case elfcpp::R_ARM_JUMP_SLOT:
    case elfcpp::R_ARM_RELATIVE:
      // These are relocations which should only be seen by the
      // dynamic linker, and should never be seen here.
      gold_error(_("%s: unexpected reloc %u in object file"),
		 object->name().c_str(), r_type);
      break;

    default:
      unsupported_reloc_global(object, r_type, gsym);
      break;
    }
}

// Process relocations for gc.

template<bool big_endian>
void
Target_arm<big_endian>::gc_process_relocs(const General_options& options,
					  Symbol_table* symtab,
					  Layout* layout,
					  Sized_relobj<32, big_endian>* object,
					  unsigned int data_shndx,
					  unsigned int,
					  const unsigned char* prelocs,
					  size_t reloc_count,
					  Output_section* output_section,
					  bool needs_special_offset_handling,
					  size_t local_symbol_count,
					  const unsigned char* plocal_symbols)
{
  typedef Target_arm<big_endian> Arm;
  typedef typename Target_arm<big_endian>::Scan Scan;

  gold::gc_process_relocs<32, big_endian, Arm, elfcpp::SHT_REL, Scan>(
    options,
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

template<bool big_endian>
void
Target_arm<big_endian>::scan_relocs(const General_options& options,
				    Symbol_table* symtab,
				    Layout* layout,
				    Sized_relobj<32, big_endian>* object,
				    unsigned int data_shndx,
				    unsigned int sh_type,
				    const unsigned char* prelocs,
				    size_t reloc_count,
				    Output_section* output_section,
				    bool needs_special_offset_handling,
				    size_t local_symbol_count,
				    const unsigned char* plocal_symbols)
{
  typedef typename Target_arm<big_endian>::Scan Scan;
  if (sh_type == elfcpp::SHT_RELA)
    {
      gold_error(_("%s: unsupported RELA reloc section"),
		 object->name().c_str());
      return;
    }

  gold::scan_relocs<32, big_endian, Target_arm, elfcpp::SHT_REL, Scan>(
    options,
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

// Finalize the sections.

template<bool big_endian>
void
Target_arm<big_endian>::do_finalize_sections(Layout* layout)
{
  // Fill in some more dynamic tags.
  Output_data_dynamic* const odyn = layout->dynamic_data();
  if (odyn != NULL)
    {
      if (this->got_plt_ != NULL
	  && this->got_plt_->output_section() != NULL)
	odyn->add_section_address(elfcpp::DT_PLTGOT, this->got_plt_);

      if (this->plt_ != NULL
	  && this->plt_->output_section() != NULL)
	{
	  const Output_data* od = this->plt_->rel_plt();
	  odyn->add_section_size(elfcpp::DT_PLTRELSZ, od);
	  odyn->add_section_address(elfcpp::DT_JMPREL, od);
	  odyn->add_constant(elfcpp::DT_PLTREL, elfcpp::DT_REL);
	}

      if (this->rel_dyn_ != NULL
	  && this->rel_dyn_->output_section() != NULL)
	{
	  const Output_data* od = this->rel_dyn_;
	  odyn->add_section_address(elfcpp::DT_REL, od);
	  odyn->add_section_size(elfcpp::DT_RELSZ, od);
	  odyn->add_constant(elfcpp::DT_RELENT,
			     elfcpp::Elf_sizes<32>::rel_size);
	}

      if (!parameters->options().shared())
	{
	  // The value of the DT_DEBUG tag is filled in by the dynamic
	  // linker at run time, and used by the debugger.
	  odyn->add_constant(elfcpp::DT_DEBUG, 0);
	}
    }

  // Emit any relocs we saved in an attempt to avoid generating COPY
  // relocs.
  if (this->copy_relocs_.any_saved_relocs())
    this->copy_relocs_.emit(this->rel_dyn_section(layout));

  // For the ARM target, we need to add a PT_ARM_EXIDX segment for
  // the .ARM.exidx section.
  if (!layout->script_options()->saw_phdrs_clause()
      && !parameters->options().relocatable())
    {
      Output_section* exidx_section =
	layout->find_output_section(".ARM.exidx");

      if (exidx_section != NULL
	  && exidx_section->type() == elfcpp::SHT_ARM_EXIDX)
	{
	  gold_assert(layout->find_output_segment(elfcpp::PT_ARM_EXIDX, 0, 0)
		      == NULL);
	  Output_segment*  exidx_segment =
	    layout->make_output_segment(elfcpp::PT_ARM_EXIDX, elfcpp::PF_R);
	  exidx_segment->add_output_section(exidx_section, elfcpp::PF_R,
					    false);
	}
    }
}

// Return whether a direct absolute static relocation needs to be applied.
// In cases where Scan::local() or Scan::global() has created
// a dynamic relocation other than R_ARM_RELATIVE, the addend
// of the relocation is carried in the data, and we must not
// apply the static relocation.

template<bool big_endian>
inline bool
Target_arm<big_endian>::Relocate::should_apply_static_reloc(
    const Sized_symbol<32>* gsym,
    int ref_flags,
    bool is_32bit,
    Output_section* output_section)
{
  // If the output section is not allocated, then we didn't call
  // scan_relocs, we didn't create a dynamic reloc, and we must apply
  // the reloc here.
  if ((output_section->flags() & elfcpp::SHF_ALLOC) == 0)
      return true;

  // For local symbols, we will have created a non-RELATIVE dynamic
  // relocation only if (a) the output is position independent,
  // (b) the relocation is absolute (not pc- or segment-relative), and
  // (c) the relocation is not 32 bits wide.
  if (gsym == NULL)
    return !(parameters->options().output_is_position_independent()
	     && (ref_flags & Symbol::ABSOLUTE_REF)
	     && !is_32bit);

  // For global symbols, we use the same helper routines used in the
  // scan pass.  If we did not create a dynamic relocation, or if we
  // created a RELATIVE dynamic relocation, we should apply the static
  // relocation.
  bool has_dyn = gsym->needs_dynamic_reloc(ref_flags);
  bool is_rel = (ref_flags & Symbol::ABSOLUTE_REF)
		 && gsym->can_use_relative_reloc(ref_flags
						 & Symbol::FUNCTION_CALL);
  return !has_dyn || is_rel;
}

// Perform a relocation.

template<bool big_endian>
inline bool
Target_arm<big_endian>::Relocate::relocate(
    const Relocate_info<32, big_endian>* relinfo,
    Target_arm* target,
    Output_section *output_section,
    size_t relnum,
    const elfcpp::Rel<32, big_endian>& rel,
    unsigned int r_type,
    const Sized_symbol<32>* gsym,
    const Symbol_value<32>* psymval,
    unsigned char* view,
    elfcpp::Elf_types<32>::Elf_Addr address,
    section_size_type /* view_size */ )
{
  typedef Arm_relocate_functions<big_endian> Arm_relocate_functions;

  r_type = get_real_reloc_type(r_type);

  // If this the symbol may be a Thumb function, set thumb bit to 1.
  bool has_thumb_bit = ((gsym != NULL)
			&& (gsym->type() == elfcpp::STT_FUNC
			    || gsym->type() == elfcpp::STT_ARM_TFUNC));

  // Pick the value to use for symbols defined in shared objects.
  Symbol_value<32> symval;
  if (gsym != NULL
      && gsym->use_plt_offset(reloc_is_non_pic(r_type)))
    {
      symval.set_output_value(target->plt_section()->address()
			      + gsym->plt_offset());
      psymval = &symval;
      has_thumb_bit = 0;
    }

  const Sized_relobj<32, big_endian>* object = relinfo->object;
  
  // Get the GOT offset if needed.
  // The GOT pointer points to the end of the GOT section.
  // We need to subtract the size of the GOT section to get
  // the actual offset to use in the relocation.
  bool have_got_offset = false;
  unsigned int got_offset = 0;
  switch (r_type)
    {
    case elfcpp::R_ARM_GOT_BREL:
    case elfcpp::R_ARM_GOT_PREL:
      if (gsym != NULL)
	{
	  gold_assert(gsym->has_got_offset(GOT_TYPE_STANDARD));
	  got_offset = (gsym->got_offset(GOT_TYPE_STANDARD)
			- target->got_size());
	}
      else
	{
	  unsigned int r_sym = elfcpp::elf_r_sym<32>(rel.get_r_info());
	  gold_assert(object->local_has_got_offset(r_sym, GOT_TYPE_STANDARD));
	  got_offset = (object->local_got_offset(r_sym, GOT_TYPE_STANDARD)
			- target->got_size());
	}
      have_got_offset = true;
      break;

    default:
      break;
    }

  typename Arm_relocate_functions::Status reloc_status =
	Arm_relocate_functions::STATUS_OKAY;
  switch (r_type)
    {
    case elfcpp::R_ARM_NONE:
      break;

    case elfcpp::R_ARM_ABS8:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, false,
				    output_section))
	reloc_status = Arm_relocate_functions::abs8(view, object, psymval);
      break;

    case elfcpp::R_ARM_ABS12:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, false,
				    output_section))
	reloc_status = Arm_relocate_functions::abs12(view, object, psymval);
      break;

    case elfcpp::R_ARM_ABS16:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, false,
				    output_section))
	reloc_status = Arm_relocate_functions::abs16(view, object, psymval);
      break;

    case elfcpp::R_ARM_ABS32:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	reloc_status = Arm_relocate_functions::abs32(view, object, psymval,
						     has_thumb_bit);
      break;

    case elfcpp::R_ARM_ABS32_NOI:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	// No thumb bit for this relocation: (S + A)
	reloc_status = Arm_relocate_functions::abs32(view, object, psymval,
						     false);
      break;

    case elfcpp::R_ARM_MOVW_ABS_NC:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	reloc_status = Arm_relocate_functions::movw_abs_nc(view, object,
							   psymval,
       						           has_thumb_bit);
      else
	gold_error(_("relocation R_ARM_MOVW_ABS_NC cannot be used when making"
		     "a shared object; recompile with -fPIC"));
      break;

    case elfcpp::R_ARM_MOVT_ABS:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	reloc_status = Arm_relocate_functions::movt_abs(view, object, psymval);
      else
	gold_error(_("relocation R_ARM_MOVT_ABS cannot be used when making"
		     "a shared object; recompile with -fPIC"));
      break;

    case elfcpp::R_ARM_THM_MOVW_ABS_NC:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	reloc_status = Arm_relocate_functions::thm_movw_abs_nc(view, object,
							       psymval,
       						               has_thumb_bit);
      else
	gold_error(_("relocation R_ARM_THM_MOVW_ABS_NC cannot be used when"
		     "making a shared object; recompile with -fPIC"));
      break;

    case elfcpp::R_ARM_THM_MOVT_ABS:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				    output_section))
	reloc_status = Arm_relocate_functions::thm_movt_abs(view, object,
							    psymval);
      else
	gold_error(_("relocation R_ARM_THM_MOVT_ABS cannot be used when"
		     "making a shared object; recompile with -fPIC"));
      break;

    case elfcpp::R_ARM_MOVW_PREL_NC:
      reloc_status = Arm_relocate_functions::movw_prel_nc(view, object,
							  psymval, address,
							  has_thumb_bit);
      break;

    case elfcpp::R_ARM_MOVT_PREL:
      reloc_status = Arm_relocate_functions::movt_prel(view, object,
                                                       psymval, address);
      break;

    case elfcpp::R_ARM_THM_MOVW_PREL_NC:
      reloc_status = Arm_relocate_functions::thm_movw_prel_nc(view, object,
							      psymval, address,
							      has_thumb_bit);
      break;

    case elfcpp::R_ARM_THM_MOVT_PREL:
      reloc_status = Arm_relocate_functions::thm_movt_prel(view, object,
							   psymval, address);
      break;
	
    case elfcpp::R_ARM_REL32:
      reloc_status = Arm_relocate_functions::rel32(view, object, psymval,
						   address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_THM_ABS5:
      if (should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, false,
				    output_section))
	reloc_status = Arm_relocate_functions::thm_abs5(view, object, psymval);
      break;

    case elfcpp::R_ARM_THM_CALL:
      reloc_status = Arm_relocate_functions::thm_call(view, object, psymval,
						      address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_GOTOFF32:
      {
	elfcpp::Elf_types<32>::Elf_Addr got_origin;
	got_origin = target->got_plt_section()->address();
	reloc_status = Arm_relocate_functions::rel32(view, object, psymval,
						     got_origin, has_thumb_bit);
      }
      break;

    case elfcpp::R_ARM_BASE_PREL:
      {
	uint32_t origin;
	// Get the addressing origin of the output segment defining the 
	// symbol gsym (AAELF 4.6.1.2 Relocation types)
	gold_assert(gsym != NULL); 
	if (gsym->source() == Symbol::IN_OUTPUT_SEGMENT)
	  origin = gsym->output_segment()->vaddr();
	else if (gsym->source () == Symbol::IN_OUTPUT_DATA)
	  origin = gsym->output_data()->address();
	else
	  {
            gold_error_at_location(relinfo, relnum, rel.get_r_offset(),
				   _("cannot find origin of R_ARM_BASE_PREL"));
	    return true;
	  }
	reloc_status = Arm_relocate_functions::base_prel(view, origin, address);
      }
      break;

    case elfcpp::R_ARM_BASE_ABS:
      {
	if (!should_apply_static_reloc(gsym, Symbol::ABSOLUTE_REF, true,
				      output_section))
	  break;

	uint32_t origin;
	// Get the addressing origin of the output segment defining
	// the symbol gsym (AAELF 4.6.1.2 Relocation types).
	if (gsym == NULL)
	  // R_ARM_BASE_ABS with the NULL symbol will give the
	  // absolute address of the GOT origin (GOT_ORG) (see ARM IHI
	  // 0044C (AAELF): 4.6.1.8 Proxy generating relocations).
	  origin = target->got_plt_section()->address();
	else if (gsym->source() == Symbol::IN_OUTPUT_SEGMENT)
	  origin = gsym->output_segment()->vaddr();
	else if (gsym->source () == Symbol::IN_OUTPUT_DATA)
	  origin = gsym->output_data()->address();
	else
	  {
            gold_error_at_location(relinfo, relnum, rel.get_r_offset(),
				   _("cannot find origin of R_ARM_BASE_ABS"));
	    return true;
	  }

	reloc_status = Arm_relocate_functions::base_abs(view, origin);
      }
      break;

    case elfcpp::R_ARM_GOT_BREL:
      gold_assert(have_got_offset);
      reloc_status = Arm_relocate_functions::got_brel(view, got_offset);
      break;

    case elfcpp::R_ARM_GOT_PREL:
      gold_assert(have_got_offset);
      // Get the address origin for GOT PLT, which is allocated right
      // after the GOT section, to calculate an absolute address of
      // the symbol GOT entry (got_origin + got_offset).
      elfcpp::Elf_types<32>::Elf_Addr got_origin;
      got_origin = target->got_plt_section()->address();
      reloc_status = Arm_relocate_functions::got_prel(view,
						      got_origin + got_offset,
						      address);
      break;

    case elfcpp::R_ARM_PLT32:
      gold_assert(gsym == NULL
		  || gsym->has_plt_offset()
		  || gsym->final_value_is_known()
		  || (gsym->is_defined()
		      && !gsym->is_from_dynobj()
		      && !gsym->is_preemptible()));
      reloc_status = Arm_relocate_functions::plt32(view, object, psymval,
						   address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_CALL:
      reloc_status = Arm_relocate_functions::call(view, object, psymval,
						  address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_JUMP24:
      reloc_status = Arm_relocate_functions::jump24(view, object, psymval,
						    address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_PREL31:
      reloc_status = Arm_relocate_functions::prel31(view, object, psymval,
						    address, has_thumb_bit);
      break;

    case elfcpp::R_ARM_TARGET1:
      // This should have been mapped to another type already.
      // Fall through.
    case elfcpp::R_ARM_COPY:
    case elfcpp::R_ARM_GLOB_DAT:
    case elfcpp::R_ARM_JUMP_SLOT:
    case elfcpp::R_ARM_RELATIVE:
      // These are relocations which should only be seen by the
      // dynamic linker, and should never be seen here.
      gold_error_at_location(relinfo, relnum, rel.get_r_offset(),
			     _("unexpected reloc %u in object file"),
			     r_type);
      break;

    default:
      gold_error_at_location(relinfo, relnum, rel.get_r_offset(),
			     _("unsupported reloc %u"),
			     r_type);
      break;
    }

  // Report any errors.
  switch (reloc_status)
    {
    case Arm_relocate_functions::STATUS_OKAY:
      break;
    case Arm_relocate_functions::STATUS_OVERFLOW:
      gold_error_at_location(relinfo, relnum, rel.get_r_offset(),
			     _("relocation overflow in relocation %u"),
			     r_type);
      break;
    case Arm_relocate_functions::STATUS_BAD_RELOC:
      gold_error_at_location(
	relinfo,
	relnum,
	rel.get_r_offset(),
	_("unexpected opcode while processing relocation %u"),
	r_type);
      break;
    default:
      gold_unreachable();
    }

  return true;
}

// Relocate section data.

template<bool big_endian>
void
Target_arm<big_endian>::relocate_section(
    const Relocate_info<32, big_endian>* relinfo,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    bool needs_special_offset_handling,
    unsigned char* view,
    elfcpp::Elf_types<32>::Elf_Addr address,
    section_size_type view_size,
    const Reloc_symbol_changes* reloc_symbol_changes)
{
  typedef typename Target_arm<big_endian>::Relocate Arm_relocate;
  gold_assert(sh_type == elfcpp::SHT_REL);

  gold::relocate_section<32, big_endian, Target_arm, elfcpp::SHT_REL,
			 Arm_relocate>(
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

template<bool big_endian>
unsigned int
Target_arm<big_endian>::Relocatable_size_for_reloc::get_size_for_reloc(
    unsigned int r_type,
    Relobj* object)
{
  r_type = get_real_reloc_type(r_type);
  switch (r_type)
    {
    case elfcpp::R_ARM_NONE:
      return 0;

    case elfcpp::R_ARM_ABS8:
      return 1;

    case elfcpp::R_ARM_ABS16:
    case elfcpp::R_ARM_THM_ABS5:
      return 2;

    case elfcpp::R_ARM_ABS32:
    case elfcpp::R_ARM_ABS32_NOI:
    case elfcpp::R_ARM_ABS12:
    case elfcpp::R_ARM_BASE_ABS:
    case elfcpp::R_ARM_REL32:
    case elfcpp::R_ARM_THM_CALL:
    case elfcpp::R_ARM_GOTOFF32:
    case elfcpp::R_ARM_BASE_PREL:
    case elfcpp::R_ARM_GOT_BREL:
    case elfcpp::R_ARM_GOT_PREL:
    case elfcpp::R_ARM_PLT32:
    case elfcpp::R_ARM_CALL:
    case elfcpp::R_ARM_JUMP24:
    case elfcpp::R_ARM_PREL31:
    case elfcpp::R_ARM_MOVW_ABS_NC:
    case elfcpp::R_ARM_MOVT_ABS:
    case elfcpp::R_ARM_THM_MOVW_ABS_NC:
    case elfcpp::R_ARM_THM_MOVT_ABS:
    case elfcpp::R_ARM_MOVW_PREL_NC:
    case elfcpp::R_ARM_MOVT_PREL:
    case elfcpp::R_ARM_THM_MOVW_PREL_NC:
    case elfcpp::R_ARM_THM_MOVT_PREL:
      return 4;

    case elfcpp::R_ARM_TARGET1:
      // This should have been mapped to another type already.
      // Fall through.
    case elfcpp::R_ARM_COPY:
    case elfcpp::R_ARM_GLOB_DAT:
    case elfcpp::R_ARM_JUMP_SLOT:
    case elfcpp::R_ARM_RELATIVE:
      // These are relocations which should only be seen by the
      // dynamic linker, and should never be seen here.
      gold_error(_("%s: unexpected reloc %u in object file"),
		 object->name().c_str(), r_type);
      return 0;

    default:
      object->error(_("unsupported reloc %u in object file"), r_type);
      return 0;
    }
}

// Scan the relocs during a relocatable link.

template<bool big_endian>
void
Target_arm<big_endian>::scan_relocatable_relocs(
    const General_options& options,
    Symbol_table* symtab,
    Layout* layout,
    Sized_relobj<32, big_endian>* object,
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
  gold_assert(sh_type == elfcpp::SHT_REL);

  typedef gold::Default_scan_relocatable_relocs<elfcpp::SHT_REL,
    Relocatable_size_for_reloc> Scan_relocatable_relocs;

  gold::scan_relocatable_relocs<32, big_endian, elfcpp::SHT_REL,
      Scan_relocatable_relocs>(
    options,
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

template<bool big_endian>
void
Target_arm<big_endian>::relocate_for_relocatable(
    const Relocate_info<32, big_endian>* relinfo,
    unsigned int sh_type,
    const unsigned char* prelocs,
    size_t reloc_count,
    Output_section* output_section,
    off_t offset_in_output_section,
    const Relocatable_relocs* rr,
    unsigned char* view,
    elfcpp::Elf_types<32>::Elf_Addr view_address,
    section_size_type view_size,
    unsigned char* reloc_view,
    section_size_type reloc_view_size)
{
  gold_assert(sh_type == elfcpp::SHT_REL);

  gold::relocate_for_relocatable<32, big_endian, elfcpp::SHT_REL>(
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

// Return the value to use for a dynamic symbol which requires special
// treatment.  This is how we support equality comparisons of function
// pointers across shared library boundaries, as described in the
// processor specific ABI supplement.

template<bool big_endian>
uint64_t
Target_arm<big_endian>::do_dynsym_value(const Symbol* gsym) const
{
  gold_assert(gsym->is_from_dynobj() && gsym->has_plt_offset());
  return this->plt_section()->address() + gsym->plt_offset();
}

// Map platform-specific relocs to real relocs
//
template<bool big_endian>
unsigned int
Target_arm<big_endian>::get_real_reloc_type (unsigned int r_type)
{
  switch (r_type)
    {
    case elfcpp::R_ARM_TARGET1:
      // This is either R_ARM_ABS32 or R_ARM_REL32;
      return elfcpp::R_ARM_ABS32;

    case elfcpp::R_ARM_TARGET2:
      // This can be any reloc type but ususally is R_ARM_GOT_PREL
      return elfcpp::R_ARM_GOT_PREL;

    default:
      return r_type;
    }
}

// The selector for arm object files.

template<bool big_endian>
class Target_selector_arm : public Target_selector
{
 public:
  Target_selector_arm()
    : Target_selector(elfcpp::EM_ARM, 32, big_endian,
		      (big_endian ? "elf32-bigarm" : "elf32-littlearm"))
  { }

  Target*
  do_instantiate_target()
  { return new Target_arm<big_endian>(); }
};

Target_selector_arm<false> target_selector_arm;
Target_selector_arm<true> target_selector_armbe;

} // End anonymous namespace.
