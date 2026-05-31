#name: PE-COFF 32-bit image fixup
#ld: -e 0 -image-base=0x10000000 -Tdata=0x20000000
#objdump: -p
#xfail: mcore-*-*

.*: +file format pei-.*

#...
PE File Base Relocations \(interpreted \.reloc section contents\)

Virtual Address: 10000000 Chunk size 12 \(0xc\) Number of fixups 2
	reloc    0 offset    4 \[10000004\] HIGHLOW
	reloc    1 offset    0 \[10000000\] ABSOLUTE
#pass
