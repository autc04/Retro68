#as:
#objdump: -dr
#skip: loongarch32-*-*

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
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+14:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+18: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+1c:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+20: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
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
[ 	]+[ 	]+[ 	]+24: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
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
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+28: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+2c:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+2c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
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
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+34: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+38:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+3c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
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
[ 	]+[ 	]+[ 	]+40: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
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
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+44: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+48:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+48: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
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
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+50: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+54:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+58: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
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
[ 	]+[ 	]+[ 	]+5c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
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
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+60: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+64:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+64: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+68:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+6c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+6c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+70:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+74: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000000
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
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000004
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+78: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+7c:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000008
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+7c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+80:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x8000000c
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+80: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+84:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+88:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+88: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+8c:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
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
[ 	]+[ 	]+[ 	]+90: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000000
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
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000004
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+94: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+98:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000008
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+98: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+9c:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x8000000c
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+9c: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+a0:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+a4:[ 	]+14000004 [ 	]+lu12i.w[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+a4: R_LARCH_MARK_LA[ 	]+L1
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+a4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+a8:[ 	]+03800084 [ 	]+ori[ 	]+[ 	]+\$a0, \$a0, 0x0
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+a8: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+ac:[ 	]+16000004 [ 	]+lu32i.d[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ac: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+b0:[ 	]+03000084 [ 	]+lu52i.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+L1
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b0: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+b4:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+b8:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+b8: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+bc:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x800
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+bc: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+c0:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x804
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c0: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+c4:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000000
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+c8:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x4
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000004
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+c8: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+cc:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x80000008
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+cc: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+d0:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_PCREL[ 	]+L1\+0x8000000c
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d0: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+d4:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+d8:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+d8: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+dc:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+dc: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+e0:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e0: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+e4:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e4: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+e8:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+e8: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+ec:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_PUSH_GPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+ec: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+f0:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+f4:[ 	]+14000004 [ 	]+lu12i.w[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f4: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+f8:[ 	]+03800084 [ 	]+ori[ 	]+[ 	]+\$a0, \$a0, 0x0
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+f8: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+fc:[ 	]+16000004 [ 	]+lu32i.d[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+fc: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+100:[ 	]+03000084 [ 	]+lu52i.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_TLS_TPREL[ 	]+L1
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+100: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+104:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+104: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+108:[ 	]+28c00084 [ 	]+ld.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+108: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+10c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+10c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+110:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+110: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+114:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+114: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+118:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_TLS_GOT[ 	]+L1
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+118: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+11c:[ 	]+380c1484 [ 	]+ldx.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+120:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+120: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+124:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+124: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+128:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+128: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+12c:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+12c: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+130:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+130: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+134:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+134: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+138:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
[ 	]+13c:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x800
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+13c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+140:[ 	]+02c00084 [ 	]+addi.d[ 	]+[ 	]+\$a0, \$a0, 0
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x804
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+140: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+144:[ 	]+1c000004 [ 	]+pcaddu12i[ 	]+[ 	]+\$a0, 0
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000000
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+144: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+148:[ 	]+03800005 [ 	]+ori[ 	]+[ 	]+\$a1, \$zero, 0x0
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x4
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000004
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x20
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_SUB[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xfff
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_AND[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+148: R_LARCH_SOP_POP_32_U_10_12[ 	]+\*ABS\*
[ 	]+14c:[ 	]+16000005 [ 	]+lu32i.d[ 	]+[ 	]+\$a1, 0
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x80000008
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0xc
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_SL[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x2c
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+14c: R_LARCH_SOP_POP_32_S_5_20[ 	]+\*ABS\*
[ 	]+150:[ 	]+030000a5 [ 	]+lu52i.d[ 	]+[ 	]+\$a1, \$a1, 0
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_PUSH_PCREL[ 	]+_GLOBAL_OFFSET_TABLE_\+0x8000000c
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_PUSH_TLS_GD[ 	]+L1
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_ADD[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_PUSH_ABSOLUTE[ 	]+\*ABS\*\+0x34
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_SR[ 	]+\*ABS\*
[ 	]+[ 	]+[ 	]+150: R_LARCH_SOP_POP_32_S_10_12[ 	]+\*ABS\*
[ 	]+154:[ 	]+00109484 [ 	]+add.d[ 	]+[ 	]+\$a0, \$a0, \$a1
