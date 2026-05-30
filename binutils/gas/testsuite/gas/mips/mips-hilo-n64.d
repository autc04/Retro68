#objdump: -dr
#name: MIPS lui/addiu n64
#as: -mabi=64 -march=mips64r2

.*: +file format .*mips.*

Disassembly of section \.text:

0+0000 <stuff>:
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010001 	lui	at,0x1
[ 	]*[0-9a-f]+:	3c048001 	lui	a0,0x8001
[ 	]*[0-9a-f]+:	24218001 	addiu	at,at,-32767
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c048000 	lui	a0,0x8000
[ 	]*[0-9a-f]+:	24218000 	addiu	at,at,-32768
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010001 	lui	at,0x1
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	24210001 	addiu	at,at,1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010002 	lui	at,0x2
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+:	2421a5a5 	addiu	at,at,-23131
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	0081202d 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3c010001 	lui	at,0x1
[ 	]*[0-9a-f]+:	3c058001 	lui	a1,0x8001
[ 	]*[0-9a-f]+:	24218001 	addiu	at,at,-32767
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+:	3c058000 	lui	a1,0x8000
[ 	]*[0-9a-f]+:	24218000 	addiu	at,at,-32768
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3c010001 	lui	at,0x1
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	24210001 	addiu	at,at,1
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3c010002 	lui	at,0x2
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+:	2421a5a5 	addiu	at,at,-23131
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c010000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MIPS_HIGHEST	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	24210000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MIPS_HIGHER	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	0001083c 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	00a1282d 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
	\.\.\.
