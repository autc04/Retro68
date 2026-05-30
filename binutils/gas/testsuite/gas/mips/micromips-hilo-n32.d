#objdump: -dr
#name: microMIPS lui/addiu n32
#as: -mabi=n32 -march=mips64r2 -mmicromips
#source: mips-hilo.s

.*: +file format .*mips.*

Disassembly of section \.text:

0+0000 <stuff>:
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	3084 0001 	addiu	a0,a0,1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+:	41a4 0001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	3084 8000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x8004
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x8004
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+:	3084 8000 	addiu	a0,a0,-32768
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x7ffc
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x7ffc
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss-0x8000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss-0x8000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss-0x8000
[ 	]*[0-9a-f]+:	41a4 0001 	lui	a0,0x1
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x10004
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x10004
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x10000
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x10000
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x10000
[ 	]*[0-9a-f]+:	41a4 0002 	lui	a0,0x2
[ 	]*[0-9a-f]+:	3084 a5a5 	addiu	a0,a0,-23131
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a9
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a9
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1a5a5
[ 	]*[0-9a-f]+:	41a4 0000 	lui	a0,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1a5a5
[ 	]*[0-9a-f]+:	3084 0000 	addiu	a0,a0,0
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x4
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x4
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	fc85 0001 	lw	a0,1\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1
[ 	]*[0-9a-f]+:	41a5 0001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	fc85 8000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x8004
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x8004
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+:	fc85 8000 	lw	a0,-32768\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data-0x7ffc
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data-0x7ffc
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss-0x8000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss-0x8000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss-0x8000
[ 	]*[0-9a-f]+:	41a5 0001 	lui	a1,0x1
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x10004
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x10004
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x10000
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x10000
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x10000
[ 	]*[0-9a-f]+:	41a5 0002 	lui	a1,0x2
[ 	]*[0-9a-f]+:	fc85 a5a5 	lw	a0,-23131\(a1\)
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.data\+0x1a5a9
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.data\+0x1a5a9
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_data_label\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	big_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	big_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	small_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	small_external_common\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.bss\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.bss\+0x1a5a5
[ 	]*[0-9a-f]+:	41a5 0000 	lui	a1,0x0
[ 	]*[0-9a-f]+: R_MICROMIPS_HI16	\.sbss\+0x1a5a5
[ 	]*[0-9a-f]+:	fc85 0000 	lw	a0,0\(a1\)
[ 	]*[0-9a-f]+: R_MICROMIPS_LO16	\.sbss\+0x1a5a5
	\.\.\.
