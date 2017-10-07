#name: PR ld/20830 (.plt.got)
#source: pr20830.s
#as: --64
#ld: -melf_x86_64 -shared -z relro --ld-generated-unwind-info
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

0+18 0000000000000014 0000001c FDE cie=00000000 pc=0000000000000238..0000000000000244
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+30 0000000000000024 00000034 FDE cie=00000000 pc=0000000000000220..0000000000000230
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 6 to 0000000000000226
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 10 to 0000000000000230
  DW_CFA_def_cfa_expression \(DW_OP_breg7 \(rsp\): 8; DW_OP_breg16 \(rip\): 0; DW_OP_lit15; DW_OP_and; DW_OP_lit11; DW_OP_ge; DW_OP_lit3; DW_OP_shl; DW_OP_plus\)
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop

0+58 0000000000000010 0000005c FDE cie=00000000 pc=0000000000000230..0000000000000238
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop


Disassembly of section .plt:

0+220 <.plt>:
 +[a-f0-9]+:	ff 35 e2 0d 20 00    	pushq  0x200de2\(%rip\)        # 201008 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 e4 0d 20 00    	jmpq   \*0x200de4\(%rip\)        # 201010 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)

Disassembly of section .plt.got:

0+230 <func@plt>:
 +[a-f0-9]+:	ff 25 c2 0d 20 00    	jmpq   \*0x200dc2\(%rip\)        # 200ff8 <func>
 +[a-f0-9]+:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0+238 <foo>:
 +[a-f0-9]+:	e8 f3 ff ff ff       	callq  230 <func@plt>
 +[a-f0-9]+:	48 8b 05 b4 0d 20 00 	mov    0x200db4\(%rip\),%rax        # 200ff8 <func>
#pass
