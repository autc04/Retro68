#name: microMIPS orphan HI16 relocation addends
#source: mips-hi16-orphan-addend.s
#as: -mno-pdr -mips1 -mmicromips -no-warn
#ld: -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 --defsym=var3=0x56789abc -T mips-hi16-orphan-addend.ld
#warning_output: micromips-hi16-orphan-addend.l
#objdump: -d --prefix-addresses --show-raw-insn

.*: +file format (:?elf.*mips.*|srec)

Disassembly of section \.(:?text|sec1):
(?:0x0*)?10000000 (?:.* )?3040 110f 	li	v0,4367
(?:0x0*)?10000004 (?:.* )?3080 acef 	li	a0,-21265
(?:0x0*)?10000008 (?:.* )?459f      	jr	ra
(?:0x0*)?1000000a (?:.* )?30c0 f133 	li	a2,-3789
(?:0x0*)?1000000e (?:.* )?0c00      	nop
(?:0x0*)?10000010 (?:.* )?30e0 081c 	li	a3,2076
(?:0x0*)?10000014 (?:.* )?30c0 68ad 	li	a2,26797
(?:0x0*)?10000018 (?:.* )?30a0 c3d7 	li	a1,-15401
(?:0x0*)?1000001c (?:.* )?3080 2468 	li	a0,9320
(?:0x0*)?10000020 (?:.* )?3060 b080 	li	v1,-20352
(?:0x0*)?10000024 (?:.* )?459f      	jr	ra
(?:0x0*)?10000026 (?:.* )?3040 1111 	li	v0,4369
	\.\.\.
