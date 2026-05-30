/* Assembly outputs of

extern void foo(int);

int global;

int main() {
  int local = global;
  foo(1);
  local = 123;
  foo(2);
  local = 456;
  return 0;
}

compiled by GCC 14.2.1 with -O2 -g -dA -gdwarf-5.  */

	.file	"dwarf5a.c"
	.text
.Ltext0:
	.file 0 "." "dwarf5a.c"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "dwarf5a.c"
	# dwarf5a.c:5:12
	.loc 1 5 12 view -0
	.cfi_startproc
# BLOCK 2, count:1073741824 (estimated locally) seq:0
# PRED: ENTRY [always]  count:1073741824 (estimated locally, freq 1.0000) (FALLTHRU)
	# dwarf5a.c:6:3
	.loc 1 6 3 view .LVU1
.LVL0:
	# DEBUG local => [`global']
	# dwarf5a.c:7:3
	.loc 1 7 3 view .LVU2
	# dwarf5a.c:5:12
	.loc 1 5 12 is_stmt 0 view .LVU3
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	# dwarf5a.c:7:3
	.loc 1 7 3 view .LVU4
	movl	$1, %edi
	call	foo
.LVL1:
	# DEBUG local RESET
	# dwarf5a.c:8:3
	.loc 1 8 3 is_stmt 1 view .LVU5
	# DEBUG local => 0x7b
	# dwarf5a.c:9:3
	.loc 1 9 3 view .LVU6
	movl	$2, %edi
	call	foo
.LVL2:
	# dwarf5a.c:10:3
	.loc 1 10 3 view .LVU7
	# DEBUG local => 0x1c8
	# dwarf5a.c:11:3
	.loc 1 11 3 view .LVU8
	# dwarf5a.c:12:1
	.loc 1 12 1 is_stmt 0 view .LVU9
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
# SUCC: EXIT [always]  count:1073741824 (estimated locally, freq 1.0000)
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	global
	.bss
	.align 4
	.type	global, @object
	.size	global, 4
global:
	.zero	4
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb3	# Length of Compilation Unit Info
	.value	0x5	# DWARF version number
	.byte	0x1	# DW_UT_compile
	.byte	0x8	# Pointer Size (in bytes)
	.long	.Ldebug_abbrev0	# Offset Into Abbrev. Section
	.uleb128 0x2	# (DIE (0xc) DW_TAG_compile_unit)
	.long	.LASF4	# DW_AT_producer: "GNU C17 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee] -mtune=generic -march=x86-64 -g -gdwarf-5 -O2"
	.byte	0x1d	# DW_AT_language
	.long	.LASF0	# DW_AT_name: "dwarf5a.c"
	.long	.LASF1	# DW_AT_comp_dir: "."
	.long	.LLRL1	# DW_AT_ranges
	.quad	0	# DW_AT_low_pc
	.long	.Ldebug_line0	# DW_AT_stmt_list
	.uleb128 0x3	# (DIE (0x2a) DW_TAG_variable)
	.long	.LASF2	# DW_AT_name: "global"
	.byte	0x1	# DW_AT_decl_file (dwarf5a.c)
	.byte	0x3	# DW_AT_decl_line
	.byte	0x5	# DW_AT_decl_column
	.long	0x40	# DW_AT_type
			# DW_AT_external
	.uleb128 0x9	# DW_AT_location
	.byte	0x3	# DW_OP_addr
	.quad	global
	.uleb128 0x4	# (DIE (0x40) DW_TAG_base_type)
	.byte	0x4	# DW_AT_byte_size
	.byte	0x5	# DW_AT_encoding
	.ascii "int\0"	# DW_AT_name
	.uleb128 0x5	# (DIE (0x47) DW_TAG_subprogram)
			# DW_AT_external
	.ascii "foo\0"	# DW_AT_name
	.byte	0x1	# DW_AT_decl_file (dwarf5a.c)
	.byte	0x1	# DW_AT_decl_line
	.byte	0xd	# DW_AT_decl_column
			# DW_AT_prototyped
			# DW_AT_declaration
	.long	0x59	# DW_AT_sibling
	.uleb128 0x6	# (DIE (0x53) DW_TAG_formal_parameter)
	.long	0x40	# DW_AT_type
	.byte	0	# end of children of DIE 0x47
	.uleb128 0x7	# (DIE (0x59) DW_TAG_subprogram)
			# DW_AT_external
	.long	.LASF5	# DW_AT_name: "main"
	.byte	0x1	# DW_AT_decl_file (dwarf5a.c)
	.byte	0x5	# DW_AT_decl_line
	.byte	0x5	# DW_AT_decl_column
	.long	0x40	# DW_AT_type
	.quad	.LFB0	# DW_AT_low_pc
	.quad	.LFE0-.LFB0	# DW_AT_high_pc
	.uleb128 0x1	# DW_AT_frame_base
	.byte	0x9c	# DW_OP_call_frame_cfa
			# DW_AT_call_all_calls
	.uleb128 0x8	# (DIE (0x77) DW_TAG_variable)
	.long	.LASF3	# DW_AT_name: "local"
	.byte	0x1	# DW_AT_decl_file (dwarf5a.c)
	.byte	0x6	# DW_AT_decl_line
	.byte	0x7	# DW_AT_decl_column
	.long	0x40	# DW_AT_type
	.long	.LLST0	# DW_AT_location
	.long	.LVUS0	# DW_AT_GNU_locviews
	.uleb128 0x9	# (DIE (0x8b) DW_TAG_call_site)
	.quad	.LVL1	# DW_AT_call_return_pc
	.long	0x47	# DW_AT_call_origin
	.long	0xa2	# DW_AT_sibling
	.uleb128 0x1	# (DIE (0x9c) DW_TAG_call_site_parameter)
	.uleb128 0x1	# DW_AT_location
	.byte	0x55	# DW_OP_reg5
	.uleb128 0x1	# DW_AT_call_value
	.byte	0x31	# DW_OP_lit1
	.byte	0	# end of children of DIE 0x8b
	.uleb128 0xa	# (DIE (0xa2) DW_TAG_call_site)
	.quad	.LVL2	# DW_AT_call_return_pc
	.long	0x47	# DW_AT_call_origin
	.uleb128 0x1	# (DIE (0xaf) DW_TAG_call_site_parameter)
	.uleb128 0x1	# DW_AT_location
	.byte	0x55	# DW_OP_reg5
	.uleb128 0x1	# DW_AT_call_value
	.byte	0x32	# DW_OP_lit2
	.byte	0	# end of children of DIE 0xa2
	.byte	0	# end of children of DIE 0x59
	.byte	0	# end of children of DIE 0xc
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1	# (abbrev code)
	.uleb128 0x49	# (TAG: DW_TAG_call_site_parameter)
	.byte	0	# DW_children_no
	.uleb128 0x2	# (DW_AT_location)
	.uleb128 0x18	# (DW_FORM_exprloc)
	.uleb128 0x7e	# (DW_AT_call_value)
	.uleb128 0x18	# (DW_FORM_exprloc)
	.byte	0
	.byte	0
	.uleb128 0x2	# (abbrev code)
	.uleb128 0x11	# (TAG: DW_TAG_compile_unit)
	.byte	0x1	# DW_children_yes
	.uleb128 0x25	# (DW_AT_producer)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x13	# (DW_AT_language)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0x1f	# (DW_FORM_line_strp)
	.uleb128 0x1b	# (DW_AT_comp_dir)
	.uleb128 0x1f	# (DW_FORM_line_strp)
	.uleb128 0x55	# (DW_AT_ranges)
	.uleb128 0x17	# (DW_FORM_sec_offset)
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x10	# (DW_AT_stmt_list)
	.uleb128 0x17	# (DW_FORM_sec_offset)
	.byte	0
	.byte	0
	.uleb128 0x3	# (abbrev code)
	.uleb128 0x34	# (TAG: DW_TAG_variable)
	.byte	0	# DW_children_no
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x3a	# (DW_AT_decl_file)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3b	# (DW_AT_decl_line)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x39	# (DW_AT_decl_column)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x49	# (DW_AT_type)
	.uleb128 0x13	# (DW_FORM_ref4)
	.uleb128 0x3f	# (DW_AT_external)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x2	# (DW_AT_location)
	.uleb128 0x18	# (DW_FORM_exprloc)
	.byte	0
	.byte	0
	.uleb128 0x4	# (abbrev code)
	.uleb128 0x24	# (TAG: DW_TAG_base_type)
	.byte	0	# DW_children_no
	.uleb128 0xb	# (DW_AT_byte_size)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3e	# (DW_AT_encoding)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0x8	# (DW_FORM_string)
	.byte	0
	.byte	0
	.uleb128 0x5	# (abbrev code)
	.uleb128 0x2e	# (TAG: DW_TAG_subprogram)
	.byte	0x1	# DW_children_yes
	.uleb128 0x3f	# (DW_AT_external)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0x8	# (DW_FORM_string)
	.uleb128 0x3a	# (DW_AT_decl_file)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3b	# (DW_AT_decl_line)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x39	# (DW_AT_decl_column)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x27	# (DW_AT_prototyped)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x3c	# (DW_AT_declaration)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x1	# (DW_AT_sibling)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x6	# (abbrev code)
	.uleb128 0x5	# (TAG: DW_TAG_formal_parameter)
	.byte	0	# DW_children_no
	.uleb128 0x49	# (DW_AT_type)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x7	# (abbrev code)
	.uleb128 0x2e	# (TAG: DW_TAG_subprogram)
	.byte	0x1	# DW_children_yes
	.uleb128 0x3f	# (DW_AT_external)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x3a	# (DW_AT_decl_file)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3b	# (DW_AT_decl_line)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x39	# (DW_AT_decl_column)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x49	# (DW_AT_type)
	.uleb128 0x13	# (DW_FORM_ref4)
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x12	# (DW_AT_high_pc)
	.uleb128 0x7	# (DW_FORM_data8)
	.uleb128 0x40	# (DW_AT_frame_base)
	.uleb128 0x18	# (DW_FORM_exprloc)
	.uleb128 0x7a	# (DW_AT_call_all_calls)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.byte	0
	.byte	0
	.uleb128 0x8	# (abbrev code)
	.uleb128 0x34	# (TAG: DW_TAG_variable)
	.byte	0	# DW_children_no
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x3a	# (DW_AT_decl_file)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3b	# (DW_AT_decl_line)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x39	# (DW_AT_decl_column)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x49	# (DW_AT_type)
	.uleb128 0x13	# (DW_FORM_ref4)
	.uleb128 0x2	# (DW_AT_location)
	.uleb128 0x17	# (DW_FORM_sec_offset)
	.uleb128 0x2137	# (DW_AT_GNU_locviews)
	.uleb128 0x17	# (DW_FORM_sec_offset)
	.byte	0
	.byte	0
	.uleb128 0x9	# (abbrev code)
	.uleb128 0x48	# (TAG: DW_TAG_call_site)
	.byte	0x1	# DW_children_yes
	.uleb128 0x7d	# (DW_AT_call_return_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x7f	# (DW_AT_call_origin)
	.uleb128 0x13	# (DW_FORM_ref4)
	.uleb128 0x1	# (DW_AT_sibling)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0xa	# (abbrev code)
	.uleb128 0x48	# (TAG: DW_TAG_call_site)
	.byte	0x1	# DW_children_yes
	.uleb128 0x7d	# (DW_AT_call_return_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x7f	# (DW_AT_call_origin)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_loc3-.Ldebug_loc2	# Length of Location Lists
.Ldebug_loc2:
	.value	0x5	# DWARF version number
	.byte	0x8	# Address Size
	.byte	0	# Segment Size
	.long	0	# Offset Entry Count
.Ldebug_loc0:
.LVUS0:
	.uleb128 .LVU2	# View list begin (*.LVUS0)
	.uleb128 .LVU5	# View list end (*.LVUS0)
	.uleb128 .LVU6	# View list begin (*.LVUS0)
	.uleb128 .LVU8	# View list end (*.LVUS0)
	.uleb128 .LVU8	# View list begin (*.LVUS0)
	.uleb128 0	# View list end (*.LVUS0)
.LLST0:
	.byte	0x6	# DW_LLE_base_address (*.LLST0)
	.quad	.LVL0	# Base address (*.LLST0)
	.byte	0x4	# DW_LLE_offset_pair (*.LLST0)
	.uleb128 .LVL0-.LVL0	# Location list begin address (*.LLST0)
	.uleb128 .LVL1-1-.LVL0	# Location list end address (*.LLST0)
	.uleb128 0x9	# Location expression size
	.byte	0x3	# DW_OP_addr
	.quad	global
	.byte	0x4	# DW_LLE_offset_pair (*.LLST0)
	.uleb128 .LVL1-.LVL0	# Location list begin address (*.LLST0)
	.uleb128 .LVL2-.LVL0	# Location list end address (*.LLST0)
	.uleb128 0x3	# Location expression size
	.byte	0x8	# DW_OP_const1u
	.byte	0x7b
	.byte	0x9f	# DW_OP_stack_value
	.byte	0x4	# DW_LLE_offset_pair (*.LLST0)
	.uleb128 .LVL2-.LVL0	# Location list begin address (*.LLST0)
	.uleb128 .LFE0-.LVL0	# Location list end address (*.LLST0)
	.uleb128 0x4	# Location expression size
	.byte	0xa	# DW_OP_const2u
	.value	0x1c8
	.byte	0x9f	# DW_OP_stack_value
	.byte	0	# DW_LLE_end_of_list (*.LLST0)
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.long	0x2c	# Length of Address Ranges Info
	.value	0x2	# DWARF aranges version
	.long	.Ldebug_info0	# Offset of Compilation Unit Info
	.byte	0x8	# Size of Address
	.byte	0	# Size of Segment Descriptor
	.value	0	# Pad to 16 byte boundary
	.value	0
	.quad	.LFB0	# Address
	.quad	.LFE0-.LFB0	# Length
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2	# Length of Range Lists
.Ldebug_ranges2:
	.value	0x5	# DWARF version number
	.byte	0x8	# Address Size
	.byte	0	# Segment Size
	.long	0	# Offset Entry Count
.LLRL1:
	.byte	0x7	# DW_RLE_start_length (*.LLRL1)
	.quad	.LFB0	# Range begin address (*.LLRL1)
	.uleb128 .LFE0-.LFB0	# Range length (*.LLRL1)
	.byte	0	# DW_RLE_end_of_list (*.LLRL1)
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"local"
.LASF4:
	.string	"GNU C17 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee] -mtune=generic -march=x86-64 -g -gdwarf-5 -O2"
.LASF2:
	.string	"global"
.LASF5:
	.string	"main"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"dwarf5a.c"
.LASF1:
	.string	"."
	.ident	"GCC: (GNU) 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee]"
	.section	.note.GNU-stack,"",@progbits
