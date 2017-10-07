#name: PR ld/20830 (.plt.got)
#source: pr20830.s
#as: --x32
#ld: -melf32_x86_64 -shared -z relro --ld-generated-unwind-info
#objdump: -dw -Wf

.*: +file format .*

Contents of the .eh_frame section:

0+ 0000000000000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -8
  Return address column: 16
  Augmentation data:     1b

  DW_CFA_def_cfa: r7 \(rsp\) ofs 8
  DW_CFA_offset: r16 \(rip\) at cfa-8
  DW_CFA_nop
  DW_CFA_nop

0+18 0000000000000010 0000001c FDE cie=00000000 pc=0000000000000188..0000000000000194
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+2c 0000000000000020 00000030 FDE cie=00000000 pc=0000000000000170..0000000000000180
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 6 to 0000000000000176
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 10 to 0000000000000180
  DW_CFA_def_cfa_expression \(DW_OP_breg7 \(rsp\): 8; DW_OP_breg16 \(rip\): 0; DW_OP_lit15; DW_OP_and; DW_OP_lit11; DW_OP_ge; DW_OP_lit3; DW_OP_shl; DW_OP_plus\)

0+50 0000000000000010 00000054 FDE cie=00000000 pc=0000000000000180..0000000000000188
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop


Disassembly of section .plt:

0+170 <.plt>:
 +[a-f0-9]+:	ff 35 92 0e 20 00    	pushq  0x200e92\(%rip\)        # 201008 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 94 0e 20 00    	jmpq   \*0x200e94\(%rip\)        # 201010 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)

Disassembly of section .plt.got:

0+180 <func@plt>:
 +[a-f0-9]+:	ff 25 72 0e 20 00    	jmpq   \*0x200e72\(%rip\)        # 200ff8 <func>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0+188 <foo>:
 +[a-f0-9]+:	e8 f3 ff ff ff       	callq  180 <func@plt>
 +[a-f0-9]+:	48 8b 05 64 0e 20 00 	mov    0x200e64\(%rip\),%rax        # 200ff8 <func>
#pass
