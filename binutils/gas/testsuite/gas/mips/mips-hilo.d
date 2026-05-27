#objdump: -dr
#name: MIPS lui/addiu
#as: -mabi=32 -march=mips32r2

.*: +file format .*mips.*

Disassembly of section \.text:

0+0000 <stuff>:
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840004 	addiu	a0,a0,4
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840005 	addiu	a0,a0,5
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	24840001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24848004 	addiu	a0,a0,-32764
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24848004 	addiu	a0,a0,-32764
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	24848000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	24840004 	addiu	a0,a0,4
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040001 	lui	a0,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	24840000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	2484a5a9 	addiu	a0,a0,-23127
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c040002 	lui	a0,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	2484a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40004 	lw	a0,4\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40005 	lw	a0,5\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca40001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca48004 	lw	a0,-32764\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca48004 	lw	a0,-32764\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca48000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca40004 	lw	a0,4\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050001 	lui	a1,0x1
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca40000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.data
[ 	]*[0-9a-f]+:	8ca4a5a9 	lw	a0,-23127\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.data
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	3c050002 	lui	a1,0x2
[ 	]*[0-9a-f]+: R_MIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	8ca4a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+: R_MIPS_LO16	\.sbss
	\.\.\.
