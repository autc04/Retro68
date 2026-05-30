#name: MIPS orphan PCHI16 relocation addend
#source: ../../../gas/testsuite/gas/mips/pcrel-hi16-orphan-addend.s
#as: -mno-pdr -mips32r6 -no-warn
#ld: -e 0 --defsym=var1=0xfedcba98 --defsym=var2=0x12345678 -T mips-hi16-orphan-addend.ld
# ISA is overridden to R5900 in the file header, clobbering R6 disassembly.
#notarget: mips*el-ps2-elf*
#warning_output: pcrel-hi16-orphan-addend.l
#objdump: -d --prefix-addresses --show-raw-insn

.*: +file format (:?elf.*mips.*|srec)

Disassembly of section \.(:?text|sec1):
(?:0x0*)?10000000 (?:.* )?24024e1c 	li	v0,19996
(?:0x0*)?10000004 (?:.* )?03e00009 	jr	ra
(?:0x0*)?10000008 (?:.* )?2403ace8 	li	v1,-21272
(?:0x0*)?1000000c (?:.* )?ec5ea080 	auipc	v0,0xa080
(?:0x0*)?10000010 (?:.* )?ec7e1468 	auipc	v1,0x1468
(?:0x0*)?10000014 (?:.* )?03e00009 	jr	ra
(?:0x0*)?10000018 (?:.* )?00000000 	nop
	\.\.\.
