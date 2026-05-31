#name: MIPS16 orphan HI16 relocation addends
#source: mips-hi16-orphan-addend.s
#as: -mno-pdr -mips1 -mips16 -no-warn
#ld: -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 --defsym=var3=0x56789abc -T mips-hi16-orphan-addend.ld
#warning_output: mips16-hi16-orphan-addend.l
#objdump: -d --prefix-addresses --show-raw-insn

.*: +file format (:?elf.*mips.*|srec)

Disassembly of section \.(:?text|sec1):
(?:0x0*)?10000000 (?:.* )?f102 6a0f 	li	v0,4367
(?:0x0*)?10000004 (?:.* )?f4f5 6c0f 	li	a0,44271
(?:0x0*)?10000008 (?:.* )?f13e 6e13 	li	a2,61747
(?:0x0*)?1000000c (?:.* )?e820      	jr	ra
(?:0x0*)?1000000e (?:.* )?6500      	nop
(?:0x0*)?10000010 (?:.* )?6500      	nop
(?:0x0*)?10000012 (?:.* )?f001 6f1c 	li	a3,2076
(?:0x0*)?10000016 (?:.* )?f0ad 6e0d 	li	a2,26797
(?:0x0*)?1000001a (?:.* )?f3d8 6d17 	li	a1,50135
(?:0x0*)?1000001e (?:.* )?f464 6c08 	li	a0,9320
(?:0x0*)?10000022 (?:.* )?f096 6b00 	li	v1,45184
(?:0x0*)?10000026 (?:.* )?f102 6a11 	li	v0,4369
(?:0x0*)?1000002a (?:.* )?e820      	jr	ra
(?:0x0*)?1000002c (?:.* )?6500      	nop
	\.\.\.
