#name: PE-COFF 16-bit image fixup
#source: image-fixup-16.s
#ld: -image-base=0x1000 -Tdata=0x2000
#objdump: -p
#notarget: aarch64-*-* arm-wince-pe arm-*-wince arm*-*-mingw32ce*
#notarget: arm*-*-cegcc* mcore-*-* sh-*-*

.*: +file format pei-.*

#...
PE File Base Relocations \(interpreted \.reloc section contents\)

Virtual Address: 00001000 Chunk size 12 \(0xc\) Number of fixups 2
	reloc    0 offset    2 \[1002\] LOW
	reloc    1 offset    0 \[1000\] ABSOLUTE
#pass
