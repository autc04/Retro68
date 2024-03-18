/* Definitions of target machine for GNU compiler,
   for IBM RS/6000 POWER running AIX.
   Copyright (C) 2000-2015 Free Software Foundation, Inc.

   This file is part of GCC.

   GCC is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published
   by the Free Software Foundation; either version 3, or (at your
   option) any later version.

   GCC is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License
   along with GCC; see the file COPYING3.  If not see
   <http://www.gnu.org/licenses/>.  */

/* Yes!  We are AIX!  */
#define DEFAULT_ABI ABI_AIX
#undef  TARGET_AIX
#define TARGET_AIX 1

/* Linux64.h wants to redefine TARGET_AIX based on -m64, but it can't be used
   in the #if conditional in options-default.h, so provide another macro.  */
#undef  TARGET_AIX_OS
#define TARGET_AIX_OS 1

/* AIX always has a TOC.  */
#define TARGET_NO_TOC 0
#define TARGET_HAS_TOC 1
#define FIXED_R2 1


/* AIX allows r13 to be used in 32-bit mode.  */
#define FIXED_R13 0

/* 32-bit and 64-bit AIX stack boundary is 128.  */
#undef  STACK_BOUNDARY
#define STACK_BOUNDARY 128

#undef  TARGET_IEEEQUAD
#define TARGET_IEEEQUAD 0


#if HAVE_AS_REF
/* Issue assembly directives that create a reference to the given DWARF table
   identifier label from the current function section.  This is defined to
   ensure we drag frame frame tables associated with needed function bodies in
   a link with garbage collection activated.  */
#define ASM_OUTPUT_DWARF_TABLE_REF rs6000_aix_asm_output_dwarf_table_ref
#endif

/* This is the only version of nm that collect2 can work with.  */
//#define REAL_NM_FILE_NAME "/usr/ucb/nm"

#define USER_LABEL_PREFIX  ""

/* Don't turn -B into -L if the argument specifies a relative file name.  */
#define RELATIVE_PREFIX_NOT_LINKDIR

/* Because of the above, we must have gcc search itself to find libgcc.a.  */
#define LINK_LIBGCC_SPECIAL_1

#undef ASM_DEFAULT_SPEC
#define ASM_DEFAULT_SPEC ""


/* Static linking with shared libstdc++ requires libsupc++ as well.  */
#define LIBSTDCXX_STATIC "supc++"

/* Compute field alignment.
   This implements the 'power' alignment rule by pegging the alignment of
   items (beyond the first aggregate field) to 32 bits.  The pegging is
   suppressed for vector and long double items (both 128 in size).
   There is a dummy use of the FIELD argument to avoid an unused variable
   warning (see PR59496).  */
#define ADJUST_FIELD_ALIGN(FIELD, TYPE, COMPUTED)		\
  ((void) (FIELD),						\
    (TARGET_ALIGN_NATURAL					\
     ? (COMPUTED)						\
     : (COMPUTED) == 128					\
	? 128							\
	: MIN ((COMPUTED), 32)))

/* AIX increases natural record alignment to doubleword if the first
   field is an FP double while the FP fields remain word aligned.  */
#define ROUND_TYPE_ALIGN(STRUCT, COMPUTED, SPECIFIED)			\
  ((TREE_CODE (STRUCT) == RECORD_TYPE					\
    || TREE_CODE (STRUCT) == UNION_TYPE					\
    || TREE_CODE (STRUCT) == QUAL_UNION_TYPE)				\
   && TARGET_ALIGN_NATURAL == 0						\
   ? rs6000_special_round_type_align (STRUCT, COMPUTED, SPECIFIED)	\
   : MAX ((COMPUTED), (SPECIFIED)))

/* The AIX ABI isn't explicit on whether aggregates smaller than a
   word/doubleword should be padded upward or downward.  One could
   reasonably assume that they follow the normal rules for structure
   layout treating the parameter area as any other block of memory,
   then map the reg param area to registers, i.e., pad upward, which
   is the way IBM Compilers for AIX behave.
   Setting both of the following defines results in this behavior.  */
#define AGGREGATE_PADDING_FIXED 1
#define AGGREGATES_PAD_UPWARD_ALWAYS 1

/* Specify padding for the last element of a block move between
   registers and memory.  FIRST is nonzero if this is the only
   element.  */
#define BLOCK_REG_PADDING(MODE, TYPE, FIRST) \
  (!(FIRST) ? PAD_UPWARD : targetm.calls.function_arg_padding (MODE, TYPE))


/* Indicate that jump tables go in the text section.  */

#define JUMP_TABLES_IN_TEXT_SECTION 1


#define PROFILE_HOOK(LABEL)   output_profile_hook (LABEL)

/* No version of AIX fully supports AltiVec or 64-bit instructions in
   32-bit mode.  */
#define OS_MISSING_POWERPC64 1
#define OS_MISSING_ALTIVEC 1

/* WINT_TYPE */
#define WINT_TYPE "int"

/* Static stack checking is supported by means of probes.  */
#define STACK_CHECK_STATIC_BUILTIN 1

/* Use standard DWARF numbering for DWARF debugging information.  */
#define RS6000_USE_DWARF_NUMBERING



/* MacOS does support Altivec.  */
#/*undef  TARGET_ALTIVEC
#define TARGET_ALTIVEC 1
#undef  TARGET_ALTIVEC_ABI
#define TARGET_ALTIVEC_ABI 1
#undef  TARGET_ALTIVEC_VRSAVE
#define TARGET_ALTIVEC_VRSAVE 1*/

#undef TARGET_OS_CPP_BUILTINS
/* __POWERPC__ must be defined for some header files */
#define TARGET_OS_CPP_BUILTINS()          \
  do                                      \
    {                                     \
      builtin_define ("__ppc__");               \
      builtin_define ("__PPC__");               \
      builtin_define ("__POWERPC__");           \
      builtin_define ("__NATURAL_ALIGNMENT__"); \
      builtin_define ("macintosh");             \
      builtin_define ("Macintosh");             \
      builtin_assert ("system=macos");     \
      builtin_assert ("cpu=powerpc");     \
      builtin_assert ("machine=powerpc"); \
            builtin_assert ("cpu=m68k");          \
      builtin_assert ("machine=m68k");          \
      builtin_define("pascal=__attribute__((__pascal__))");	\
      builtin_define("__IEEE_BIG_ENDIAN"); \
    }                                     \
  while (0)

/* --no-check-sections  :   sections overlap on purpose!
   -undefined=_consolewrite : hack to allow easy configuration of console output             
*/

#define LINK_SPEC "%{!r:-btextro} -bhalt:4 -bnodelcsect \
--no-check-sections -undefined=_consolewrite \
%{shared:-bM:SRE}"

#define LIB_SPEC "-lc"
#define LIBGCC_SPEC "-lgcc %{carbon: -lretrocrt-carbon} %{!carbon: -lretrocrt} -lgcc %{carbon: -lCarbonLib} %{!carbon: -lInterfaceLib}"

#define LINK_GCC_C_SEQUENCE_SPEC "--start-group -lgcc -lc %{carbon: -lretrocrt-carbon} %{!carbon: -lretrocrt} %{carbon: -lCarbonLib} %{!carbon: -lInterfaceLib} --end-group"

#undef STARTFILE_SPEC
#define STARTFILE_SPEC ""

#undef CPP_SPEC
#define CPP_SPEC "-Wno-trigraphs"

#undef TARGET_DEFAULT
#define TARGET_DEFAULT 0
// (MASK_POWERPC | MASK_MULTIPLE | MASK_NEW_MNEMONICS)

#undef PROCESSOR_DEFAULT
#define PROCESSOR_DEFAULT PROCESSOR_PPC601

#undef OS_MISSING_ALTIVEC
#define OS_MISSING_ALTIVEC 0

#undef VECTOR_SAVE_INLINE
#define VECTOR_SAVE_INLINE(FIRST_REG) 1


#define TARGET_USES_AIX64_OPT

#undef TARGET_POINTERS_TO_NESTED_FUNCTIONS
#define TARGET_POINTERS_TO_NESTED_FUNCTIONS 0

/* Type used for ptrdiff_t, as a string used in a declaration.  */
#undef PTRDIFF_TYPE
#define PTRDIFF_TYPE "long int"

/* The AIX linker will discard static constructors in object files before
   collect has a chance to see them, so collect2 contains functionality
   to scan the object files directly, enabled by:
	#define COLLECT_EXPORT_LIST
   
   However, this seems to find all constructors and exception frame tables,
   and thus leads to huge executables.
   As we don't need to be compatible with the AIX linker, binutils had been
   made to not discard these symbols any more *if* the corresponding object
   file is loaded.
*/

/* Select a format to encode pointers in exception handling data.  CODE
   is 0 for data, 1 for code labels, 2 for function pointers.  GLOBAL is
   true if the symbol may be affected by dynamic relocations.  */
#undef	ASM_PREFERRED_EH_DATA_FORMAT
#define	ASM_PREFERRED_EH_DATA_FORMAT(CODE, GLOBAL) \
  (DW_EH_PE_absptr)
#undef EH_TABLES_CAN_BE_READ_ONLY
#define EH_TABLES_CAN_BE_READ_ONLY 0

#if 0
/* On AIX, initialisers specified with -binitfini are called in breadth-first
   order.
   e.g. if a.out depends on lib1.so, the init function for a.out is called before
   the init function for lib1.so.

   To ensure global C++ constructors in linked libraries are run before global
   C++ constructors from the current module, there is additional symbol scanning
   logic in collect2.

   The global initialiser/finaliser functions are named __GLOBAL_AIXI_{libname}
   and __GLOBAL_AIXD_{libname} and are exported from each shared library.

   collect2 will detect these symbols when they exist in shared libraries that
   the current program is being linked against.  All such initiliser functions
   will be called prior to the constructors of the current program, and
   finaliser functions called after destructors.

   Reference counting generated by collect2 will ensure that constructors are
   only invoked once in the case of multiple dependencies on a library.

   -binitfini is still used in parallel to this solution.
   This handles the case where a library is loaded through dlopen(), and also
   handles the option -blazy.
*/
#define COLLECT_SHARED_INIT_FUNC(STREAM, FUNC) \
	  fprintf ((STREAM), "void %s() {\n\t%s();\n}\n", aix_shared_initname, (FUNC))
#define COLLECT_SHARED_FINI_FUNC(STREAM, FUNC) \
	  fprintf ((STREAM), "void %s() {\n\t%s();\n}\n", aix_shared_fininame, (FUNC))

#endif

#if HAVE_AS_REF
/* Issue assembly directives that create a reference to the given DWARF table
   identifier label from the current function section.  This is defined to
   ensure we drag frame tables associated with needed function bodies in
   a link with garbage collection activated.  */
#define ASM_OUTPUT_DWARF_TABLE_REF rs6000_aix_asm_output_dwarf_table_ref
#endif
/* Use standard DWARF numbering for DWARF debugging information.  */
#define RS6000_USE_DWARF_NUMBERING
#define DWARF2_DEBUGGING_INFO 1
//#define PREFERRED_DEBUGGING_TYPE DWARF2_DEBUG
#define PREFERRED_DEBUGGING_TYPE XCOFF_DEBUG
#define DEBUG_INFO_SECTION	"0x10000"
#define DEBUG_LINE_SECTION	"0x20000"
#define DEBUG_PUBNAMES_SECTION	"0x30000"
#define DEBUG_PUBTYPES_SECTION	"0x40000"
#define DEBUG_ARANGES_SECTION	"0x50000"
#define DEBUG_ABBREV_SECTION	"0x60000"
#define DEBUG_STR_SECTION	"0x70000"
#define DEBUG_RANGES_SECTION	"0x80000"
#define DEBUG_LOC_SECTION	"0x90000"
#define DEBUG_FRAME_SECTION	"0xA0000"
#define DEBUG_MACINFO_SECTION	"0xB0000"
#define DEBUG_MACRO_SECTION	"0xB0000"



#define SIG_ATOMIC_TYPE "int"

#define INT8_TYPE "signed char"
#define INT16_TYPE "short int"
#define INT32_TYPE "long int"
#define INT64_TYPE "long long int"
#define UINT8_TYPE "unsigned char"
#define UINT16_TYPE "short unsigned int"
#define UINT32_TYPE "long unsigned int"
#define UINT64_TYPE "long long unsigned int"

#define INT_LEAST8_TYPE "signed char"
#define INT_LEAST16_TYPE "short int"
#define INT_LEAST32_TYPE "long int"
#define INT_LEAST64_TYPE "long long int"
#define UINT_LEAST8_TYPE "unsigned char"
#define UINT_LEAST16_TYPE "short unsigned int"
#define UINT_LEAST32_TYPE "long unsigned int"
#define UINT_LEAST64_TYPE "long long unsigned int"

#define INT_FAST8_TYPE "signed char"
#define INT_FAST16_TYPE "short int"
#define INT_FAST32_TYPE "long int"
#define INT_FAST64_TYPE "long long int"
#define UINT_FAST8_TYPE "unsigned char"
#define UINT_FAST16_TYPE "short unsigned int"
#define UINT_FAST32_TYPE "long unsigned int"
#define UINT_FAST64_TYPE "long long unsigned int"

#define INTPTR_TYPE "long int"
#define UINTPTR_TYPE "long unsigned int"

