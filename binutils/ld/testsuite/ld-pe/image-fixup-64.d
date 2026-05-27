#name: PE-COFF 64-bit image fixup
#ld: -e 0 -image-base=0x10000000 -Tdata=0x20000000
#objdump: -p
#notarget: arm-*-* i\[3-7\]86-*-* mcore-*-* sh-*-*

.*: +file format pei-.*

#...
PE File Base Relocations \(interpreted \.reloc section contents\)

Virtual Address: 10000000 Chunk size 12 \(0xc\) Number of fixups 2
	reloc    0 offset    8 \[10000008\] DIR64
	reloc    1 offset    0 \[10000000\] ABSOLUTE
#pass
