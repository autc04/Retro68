/* Assembly outputs of

extern void bar();

void foo(int p) {
  int local = p;
  bar();
  local = 123;
  bar();
  local = 456;
}

compiled by GCC 14.2.1 with -O2 -g -dA -gdwarf-4.  */

	.file	"dwarf4.c"
	.text
.Ltext0:
	.file 1 "dwarf4.c"
	.p2align 4
	.globl	foo
	.type	foo, @function
foo:
.LVL0:
	# DEBUG p => di
.LFB0:
	# dwarf4.c:3:17
	.loc 1 3 17 view -0
	.cfi_startproc
# BLOCK 2, count:1073741824 (estimated locally) seq:0
# PRED: ENTRY [always]  count:1073741824 (estimated locally, freq 1.0000) (FALLTHRU)
	# dwarf4.c:4:3
	.loc 1 4 3 view .LVU1
	# DEBUG local => di
	# dwarf4.c:5:3
	.loc 1 5 3 view .LVU2
	# dwarf4.c:3:17
	.loc 1 3 17 is_stmt 0 view .LVU3
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	# dwarf4.c:5:3
	.loc 1 5 3 view .LVU4
	xorl	%eax, %eax
	call	bar
.LVL1:
	# DEBUG local => entry_value#0
	# DEBUG p => entry_value#0
	# dwarf4.c:6:3
	.loc 1 6 3 is_stmt 1 view .LVU5
	# DEBUG local => 0x7b
	# dwarf4.c:7:3
	.loc 1 7 3 view .LVU6
	xorl	%eax, %eax
	# dwarf4.c:9:1
	.loc 1 9 1 is_stmt 0 view .LVU7
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
# SUCC: EXIT [always]  count:1073741824 (estimated locally, freq 1.0000) (ABNORMAL,SIBCALL)
	# dwarf4.c:7:3
	.loc 1 7 3 view .LVU8
	jmp	bar
.LVL2:
	.cfi_endproc
.LFE0:
	.size	foo, .-foo
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9e	# Length of Compilation Unit Info
	.value	0x4	# DWARF version number
	.long	.Ldebug_abbrev0	# Offset Into Abbrev. Section
	.byte	0x8	# Pointer Size (in bytes)
	.uleb128 0x1	# (DIE (0xb) DW_TAG_compile_unit)
	.long	.LASF0	# DW_AT_producer: "GNU C17 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee] -mtune=generic -march=x86-64 -g -gdwarf-4 -O2"
	.byte	0xc	# DW_AT_language
	.long	.LASF1	# DW_AT_name: "dwarf4.c"
	.long	.LASF2	# DW_AT_comp_dir: "."
	.quad	.Ltext0	# DW_AT_low_pc
	.quad	.Letext0-.Ltext0	# DW_AT_high_pc
	.long	.Ldebug_line0	# DW_AT_stmt_list
	.uleb128 0x2	# (DIE (0x2d) DW_TAG_subprogram)
			# DW_AT_external
	.ascii "bar\0"	# DW_AT_name
	.byte	0x1	# DW_AT_decl_file (dwarf4.c)
	.byte	0x1	# DW_AT_decl_line
	.byte	0xd	# DW_AT_decl_column
			# DW_AT_declaration
	.long	0x3b	# DW_AT_sibling
	.uleb128 0x3	# (DIE (0x39) DW_TAG_unspecified_parameters)
	.byte	0	# end of children of DIE 0x2d
	.uleb128 0x4	# (DIE (0x3b) DW_TAG_subprogram)
			# DW_AT_external
	.ascii "foo\0"	# DW_AT_name
	.byte	0x1	# DW_AT_decl_file (dwarf4.c)
	.byte	0x3	# DW_AT_decl_line
	.byte	0x6	# DW_AT_decl_column
			# DW_AT_prototyped
	.quad	.LFB0	# DW_AT_low_pc
	.quad	.LFE0-.LFB0	# DW_AT_high_pc
	.uleb128 0x1	# DW_AT_frame_base
	.byte	0x9c	# DW_OP_call_frame_cfa
			# DW_AT_GNU_all_call_sites
	.long	0x9a	# DW_AT_sibling
	.uleb128 0x5	# (DIE (0x59) DW_TAG_formal_parameter)
	.ascii "p\0"	# DW_AT_name
	.byte	0x1	# DW_AT_decl_file (dwarf4.c)
	.byte	0x3	# DW_AT_decl_line
	.byte	0xe	# DW_AT_decl_column
	.long	0x9a	# DW_AT_type
	.long	.LLST0	# DW_AT_location
	.long	.LVUS0	# DW_AT_GNU_locviews
	.uleb128 0x6	# (DIE (0x6b) DW_TAG_variable)
	.long	.LASF3	# DW_AT_name: "local"
	.byte	0x1	# DW_AT_decl_file (dwarf4.c)
	.byte	0x4	# DW_AT_decl_line
	.byte	0x7	# DW_AT_decl_column
	.long	0x9a	# DW_AT_type
	.long	.LLST1	# DW_AT_location
	.long	.LVUS1	# DW_AT_GNU_locviews
	.uleb128 0x7	# (DIE (0x7f) DW_TAG_GNU_call_site)
	.quad	.LVL1	# DW_AT_low_pc
	.long	0x2d	# DW_AT_abstract_origin
	.uleb128 0x8	# (DIE (0x8c) DW_TAG_GNU_call_site)
	.quad	.LVL2	# DW_AT_low_pc
			# DW_AT_GNU_tail_call
	.long	0x2d	# DW_AT_abstract_origin
	.byte	0	# end of children of DIE 0x3b
	.uleb128 0x9	# (DIE (0x9a) DW_TAG_base_type)
	.byte	0x4	# DW_AT_byte_size
	.byte	0x5	# DW_AT_encoding
	.ascii "int\0"	# DW_AT_name
	.byte	0	# end of children of DIE 0xb
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1	# (abbrev code)
	.uleb128 0x11	# (TAG: DW_TAG_compile_unit)
	.byte	0x1	# DW_children_yes
	.uleb128 0x25	# (DW_AT_producer)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x13	# (DW_AT_language)
	.uleb128 0xb	# (DW_FORM_data1)
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x1b	# (DW_AT_comp_dir)
	.uleb128 0xe	# (DW_FORM_strp)
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x12	# (DW_AT_high_pc)
	.uleb128 0x7	# (DW_FORM_data8)
	.uleb128 0x10	# (DW_AT_stmt_list)
	.uleb128 0x17	# (DW_FORM_sec_offset)
	.byte	0
	.byte	0
	.uleb128 0x2	# (abbrev code)
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
	.uleb128 0x3c	# (DW_AT_declaration)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x1	# (DW_AT_sibling)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x3	# (abbrev code)
	.uleb128 0x18	# (TAG: DW_TAG_unspecified_parameters)
	.byte	0	# DW_children_no
	.byte	0
	.byte	0
	.uleb128 0x4	# (abbrev code)
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
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x12	# (DW_AT_high_pc)
	.uleb128 0x7	# (DW_FORM_data8)
	.uleb128 0x40	# (DW_AT_frame_base)
	.uleb128 0x18	# (DW_FORM_exprloc)
	.uleb128 0x2117	# (DW_AT_GNU_all_call_sites)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x1	# (DW_AT_sibling)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x5	# (abbrev code)
	.uleb128 0x5	# (TAG: DW_TAG_formal_parameter)
	.byte	0	# DW_children_no
	.uleb128 0x3	# (DW_AT_name)
	.uleb128 0x8	# (DW_FORM_string)
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
	.uleb128 0x6	# (abbrev code)
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
	.uleb128 0x7	# (abbrev code)
	.uleb128 0x4109	# (TAG: DW_TAG_GNU_call_site)
	.byte	0	# DW_children_no
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x31	# (DW_AT_abstract_origin)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x8	# (abbrev code)
	.uleb128 0x4109	# (TAG: DW_TAG_GNU_call_site)
	.byte	0	# DW_children_no
	.uleb128 0x11	# (DW_AT_low_pc)
	.uleb128 0x1	# (DW_FORM_addr)
	.uleb128 0x2115	# (DW_AT_GNU_tail_call)
	.uleb128 0x19	# (DW_FORM_flag_present)
	.uleb128 0x31	# (DW_AT_abstract_origin)
	.uleb128 0x13	# (DW_FORM_ref4)
	.byte	0
	.byte	0
	.uleb128 0x9	# (abbrev code)
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS0:
	.uleb128 0	# View list begin (*.LVUS0)
	.uleb128 .LVU5	# View list end (*.LVUS0)
	.uleb128 .LVU5	# View list begin (*.LVUS0)
	.uleb128 0	# View list end (*.LVUS0)
.LLST0:
	.quad	.LVL0-.Ltext0	# Location list begin address (*.LLST0)
	.quad	.LVL1-1-.Ltext0	# Location list end address (*.LLST0)
	.value	0x1	# Location expression size
	.byte	0x55	# DW_OP_reg5
	.quad	.LVL1-1-.Ltext0	# Location list begin address (*.LLST0)
	.quad	.LFE0-.Ltext0	# Location list end address (*.LLST0)
	.value	0x4	# Location expression size
	.byte	0xf3	# DW_OP_GNU_entry_value
	.uleb128 0x1
	.byte	0x55	# DW_OP_reg5
	.byte	0x9f	# DW_OP_stack_value
	.quad	0	# Location list terminator begin (*.LLST0)
	.quad	0	# Location list terminator end (*.LLST0)
.LVUS1:
	.uleb128 .LVU2	# View list begin (*.LVUS1)
	.uleb128 .LVU5	# View list end (*.LVUS1)
	.uleb128 .LVU5	# View list begin (*.LVUS1)
	.uleb128 .LVU6	# View list end (*.LVUS1)
	.uleb128 .LVU6	# View list begin (*.LVUS1)
	.uleb128 0	# View list end (*.LVUS1)
.LLST1:
	.quad	.LVL0-.Ltext0	# Location list begin address (*.LLST1)
	.quad	.LVL1-1-.Ltext0	# Location list end address (*.LLST1)
	.value	0x1	# Location expression size
	.byte	0x55	# DW_OP_reg5
	.quad	.LVL1-1-.Ltext0	# Location list begin address (*.LLST1)
	.quad	.LVL1-.Ltext0	# Location list end address (*.LLST1)
	.value	0x4	# Location expression size
	.byte	0xf3	# DW_OP_GNU_entry_value
	.uleb128 0x1
	.byte	0x55	# DW_OP_reg5
	.byte	0x9f	# DW_OP_stack_value
	.quad	.LVL1-.Ltext0	# Location list begin address (*.LLST1)
	.quad	.LFE0-.Ltext0	# Location list end address (*.LLST1)
	.value	0x3	# Location expression size
	.byte	0x8	# DW_OP_const1u
	.byte	0x7b
	.byte	0x9f	# DW_OP_stack_value
	.quad	0	# Location list terminator begin (*.LLST1)
	.quad	0	# Location list terminator end (*.LLST1)
	.section	.debug_aranges,"",@progbits
	.long	0x2c	# Length of Address Ranges Info
	.value	0x2	# DWARF aranges version
	.long	.Ldebug_info0	# Offset of Compilation Unit Info
	.byte	0x8	# Size of Address
	.byte	0	# Size of Segment Descriptor
	.value	0	# Pad to 16 byte boundary
	.value	0
	.quad	.Ltext0	# Address
	.quad	.Letext0-.Ltext0	# Length
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"GNU C17 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee] -mtune=generic -march=x86-64 -g -gdwarf-4 -O2"
.LASF1:
	.string	"dwarf4.c"
.LASF3:
	.string	"local"
.LASF2:
	.string	"."
	.ident	"GCC: (GNU) 14.2.1 20240906 [releases/gcc-14 r14-10649-gaedf6f810ee]"
	.section	.note.GNU-stack,"",@progbits
