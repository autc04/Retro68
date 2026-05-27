#source: dt-relr-2.s
#as: --32
#ld: -shared -melf_i386 $DT_RELR_LDFLAGS --hash-style=sysv
#readelf: -D -r --wide
#target: x86_64-*-linux* i?86-*-linux-gnu i?86-*-gnu*

'REL' relocation section at offset [0x0-9a-f]+ contains 16 bytes:
 +Offset +Info +Type +Sym. Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_32 +0+ +data1
[0-9a-f]+ +[0-9a-f]+ +R_386_32 +0+ +data1

'RELR' relocation section at offset 0x[a-f0-9]+ contains 8 bytes:
#...
0000: +[0-9a-f]+ [0-9a-f]+ +.*
0001: +[0-9a-f]+ [0-9a-f]+ +.*
 +[0-9a-f]+ +.*
#...
'PLT' relocation section at offset 0x[0-9a-f]+ contains 16 bytes:
 +Offset +Info +Type +Sym. Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_JUMP_SLOT +[0-9a-f]+ +func1
[0-9a-f]+ +[0-9a-f]+ +R_386_JUMP_SLOT +[0-9a-f]+ +func2
