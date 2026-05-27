#objdump: -dr
#name: microMIPS lui/addiu n64
#as: -mabi=64 -march=mips64r2 -mmicromips
#source: mips-hilo-n64.s

.*: +file format .*mips.*

Disassembly of section \.text:

0+0000 <stuff>:
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	3084 0001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0001 	lui	at,0x1
[ 	]*[0-9a-f]+:	41a4 8001 	lui	a0,0x8001
[ 	]*[0-9a-f]+:	3021 8001 	addiu	at,at,-32767
[ 	]*[0-9a-f]+:	3084 8000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a4 8000 	lui	a0,0x8000
[ 	]*[0-9a-f]+:	3021 8000 	addiu	at,at,-32768
[ 	]*[0-9a-f]+:	3084 8000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0001 	lui	at,0x1
[ 	]*[0-9a-f]+:	41a4 0001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	3021 0001 	addiu	at,at,1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0002 	lui	at,0x2
[ 	]*[0-9a-f]+:	41a4 0002 	lui	a0,0x2
[ 	]*[0-9a-f]+:	3021 a5a5 	addiu	at,at,-23131
[ 	]*[0-9a-f]+:	3084 a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5824 2150 	daddu	a0,a0,at
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x4
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1
[ 	]*[0-9a-f]+:	41a1 0001 	lui	at,0x1
[ 	]*[0-9a-f]+:	41a5 8001 	lui	a1,0x8001
[ 	]*[0-9a-f]+:	3021 8001 	addiu	at,at,-32767
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 8000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008004
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+:	41a5 8000 	lui	a1,0x8000
[ 	]*[0-9a-f]+:	3021 8000 	addiu	at,at,-32768
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 8000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080007ffc
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*-0x800080008000
[ 	]*[0-9a-f]+:	41a1 0001 	lui	at,0x1
[ 	]*[0-9a-f]+:	41a5 0001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	3021 0001 	addiu	at,at,1
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010004
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1000100010000
[ 	]*[0-9a-f]+:	41a1 0002 	lui	at,0x2
[ 	]*[0-9a-f]+:	41a5 0002 	lui	a1,0x2
[ 	]*[0-9a-f]+:	3021 a5a5 	addiu	at,at,-23131
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a9
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a1 0000 	lui	at,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHEST	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	3021 0000 	addiu	at,at,0
[ 	]*[0-9a-f]+: R_MICROMIPS_HIGHER	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+:	5821 0008 	dsll32	at,at,0x0
[ 	]*[0-9a-f]+:	5825 2950 	daddu	a1,a1,at
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
[ 	]*[0-9a-f]+: R_MIPS_NONE	\*ABS\*\+0x1a5a50001a5a5
	\.\.\.
