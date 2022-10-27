#as:
#objdump: -dr
#skip: loongarch64-*-*

.*:[ 	]+file format .*


Disassembly of section .text:

0+0 <.text>:
[ 	]+0:[ 	]+00150004 [ 	]+move[ 	]+[ 	]+\$a0, \$zero
[ 	]+4:[ 	]+02bffc04 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$zero, -1\(0xfff\)
[ 	]+8:[ 	]+00150004 [ 	]+move[ 	]+[ 	]+\$a0, \$zero
[ 	]+c:[ 	]+02bffc04 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$zero, -1\(0xfff\)
[ 	]+10:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+14:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+18:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+1c:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+1c: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+20:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+24:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+28:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+2c:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+30:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+34:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+38:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+38: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+3c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+40:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+44:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+48:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+4c:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+50:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+54:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+54: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+58:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+5c:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+60:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+64:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+68:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+6c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+70:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+70: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+74:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x80000000
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+78:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffffc
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+7c:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff8
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+80:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff4
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+84:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+88:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+8c:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+8c: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+90:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x80000000
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+94:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffffc
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+98:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff8
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+9c:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff4
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+a0:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+a4:[ 	]+14000004 [ 	]+lu12i.w[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+a4: R_LARCH_MARK_LA[ 	]+L1
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+a8:[ 	]+03800084 [ 	]+ori[ 	]+[ 	]+\$a0, \$a0, 0x0
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+ac:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+b0:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+b4:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+b8:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+bc:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x80000000
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+c0:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffffc
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+c4:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff8
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+c8:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\-0x7ffffff4
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+cc:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+d0:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+d4:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d4: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+d8:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+dc:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+e0:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+e4:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+e8:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+ec:[ 	]+14000004 [ 	]+lu12i.w[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+f0:[ 	]+03800084 [ 	]+ori[ 	]+[ 	]+\$a0, \$a0, 0x0
[ 	]+[ 	]+[ 	]+f0: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+f0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+f0: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f0: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+f4:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+f8:[ 	]+28800084 [ 	]+ld.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+fc:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+100:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+104:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+108:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+10c:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+110:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+114:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+118:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+11c:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+11c: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+120:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+124:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+128:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+12c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+130:[ 	]+02800084 [ 	]+addi.w[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+134:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x80000000
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+138:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffffc
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+138: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+13c:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff8
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+140:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\-0x7ffffff4
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+144:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
