#objdump: -dr --prefix-addresses  --show-raw-insn -Mvirt,cp0-names=mips64r2
#name: virt64 instructions
#source: virt64.s
#as: -64 -mvirt

.*: +file format .*mips.*

Disassembly of section \.text:
[0-9a-f]+ <[^>]*> 587d 00e7 	dmfgc0	v1,c0_taghi
[0-9a-f]+ <[^>]*> 5974 28e7 	dmfgc0	a7,\$20,5
[0-9a-f]+ <[^>]*> 5ae2 02e7 	dmtgc0	s7,c0_entrylo0
[0-9a-f]+ <[^>]*> 58ee 12e7 	dmtgc0	a3,\$14,2
	\.\.\.
