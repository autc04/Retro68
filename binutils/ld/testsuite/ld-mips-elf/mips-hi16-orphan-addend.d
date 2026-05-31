#name: MIPS orphan HI16 relocation addends
#as: -mno-pdr -mips1 -no-warn
#ld: -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 --defsym=var3=0x56789abc -T mips-hi16-orphan-addend.ld
#warning_output: mips-hi16-orphan-addend.l
#objdump: -d --prefix-addresses --show-raw-insn

.*: +file format (:?elf.*mips.*|srec)

Disassembly of section \.(:?text|sec1):
(?:0x0*)?10000000 (?:.* )?2402110f 	li	v0,4367
(?:0x0*)?10000004 (?:.* )?2404acef 	li	a0,-21265
(?:0x0*)?10000008 (?:.* )?03e00008 	jr	ra
(?:0x0*)?1000000c (?:.* )?2406f133 	li	a2,-3789
(?:0x0*)?10000010 (?:.* )?00000000 	nop
(?:0x0*)?10000014 (?:.* )?2407081c 	li	a3,2076
(?:0x0*)?10000018 (?:.* )?240668ad 	li	a2,26797
(?:0x0*)?1000001c (?:.* )?2405c3d7 	li	a1,-15401
(?:0x0*)?10000020 (?:.* )?24042468 	li	a0,9320
(?:0x0*)?10000024 (?:.* )?2403b080 	li	v1,-20352
(?:0x0*)?10000028 (?:.* )?03e00008 	jr	ra
(?:0x0*)?1000002c (?:.* )?24021111 	li	v0,4369
	\.\.\.
