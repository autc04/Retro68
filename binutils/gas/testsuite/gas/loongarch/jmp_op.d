#as:
#objdump: -dr

.*:[ 	]+file format .*


Disassembly of section .text:

00000000.* <.text>:
[ 	]+0:[ 	]+03400000 [ 	]+andi[ 	]+[ 	]+\$zero, \$zero, 0x0
[ 	]+4:[ 	]+60000004 [ 	]+bgtz[ 	]+[ 	]+\$a0, 0[ 	]+# 0x4
[ 	]+[ 	]+[ 	]+4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+4: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+8:[ 	]+64000080 [ 	]+bgez[ 	]+[ 	]+\$a0, 0[ 	]+# 0x8
[ 	]+[ 	]+[ 	]+8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+8: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+c:[ 	]+64000004 [ 	]+blez[ 	]+[ 	]+\$a0, 0[ 	]+# 0xc
[ 	]+[ 	]+[ 	]+c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+c: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+10:[ 	]+40000080 [ 	]+beqz[ 	]+[ 	]+\$a0, 0[ 	]+# 0x10
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_POP_32_S_0_5_10_16_S2[ 	]+\*ABS\*
[ 	]+14:[ 	]+44000080 [ 	]+bnez[ 	]+[ 	]+\$a0, 0[ 	]+# 0x14
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_POP_32_S_0_5_10_16_S2[ 	]+\*ABS\*
[ 	]+18:[ 	]+48000000 [ 	]+bceqz[ 	]+[ 	]+\$fcc0, 0[ 	]+# 0x18
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_POP_32_S_0_5_10_16_S2[ 	]+\*ABS\*
[ 	]+1c:[ 	]+48000100 [ 	]+bcnez[ 	]+[ 	]+\$fcc0, 0[ 	]+# 0x1c
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_POP_32_S_0_5_10_16_S2[ 	]+\*ABS\*
[ 	]+20:[ 	]+4c000080 [ 	]+jirl[ 	]+[ 	]+\$zero, \$a0, 0
[ 	]+24:[ 	]+50000000 [ 	]+b[ 	]+[ 	]+0[ 	]+# 0x24
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_POP_32_S_0_10_10_16_S2[ 	]+\*ABS\*
[ 	]+28:[ 	]+54000000 [ 	]+bl[ 	]+[ 	]+0[ 	]+# 0x28
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_POP_32_S_0_10_10_16_S2[ 	]+\*ABS\*
[ 	]+2c:[ 	]+58000085 [ 	]+beq[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x2c
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+30:[ 	]+5c000085 [ 	]+bne[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x30
[ 	]+[ 	]+[ 	]+30: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+30: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+34:[ 	]+60000085 [ 	]+blt[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x34
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+38:[ 	]+600000a4 [ 	]+blt[ 	]+[ 	]+\$a1, \$a0, 0[ 	]+# 0x38
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+3c:[ 	]+64000085 [ 	]+bge[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x3c
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+40:[ 	]+640000a4 [ 	]+bge[ 	]+[ 	]+\$a1, \$a0, 0[ 	]+# 0x40
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+44:[ 	]+68000085 [ 	]+bltu[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x44
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+48:[ 	]+680000a4 [ 	]+bltu[ 	]+[ 	]+\$a1, \$a0, 0[ 	]+# 0x48
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+4c:[ 	]+6c000085 [ 	]+bgeu[ 	]+[ 	]+\$a0, \$a1, 0[ 	]+# 0x4c
[ 	]+[ 	]+[ 	]+4c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+4c: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
[ 	]+50:[ 	]+6c0000a4 [ 	]+bgeu[ 	]+[ 	]+\$a1, \$a0, 0[ 	]+# 0x50
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_POP_32_S_10_16_S2[ 	]+\*ABS\*
