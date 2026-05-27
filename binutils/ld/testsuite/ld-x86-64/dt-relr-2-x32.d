#source: dt-relr-2.s
#as: --x32
#ld: -shared -melf32_x86_64 $DT_RELR_LDFLAGS -z nomark-plt --hash-style=sysv
#readelf: -D -r --wide
#target: x86_64-*-linux*

'RELA' relocation section at offset 0x[0-9a-f]+ contains 24 bytes:
 +Offset +Info +Type +Sym. Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_32 +0+ +data1 \+ 0
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_32 +0+ +data1 \+ 0

'RELR' relocation section at offset 0x[a-f0-9]+ contains 8 bytes:
#...
0000: +[0-9a-f]+ [0-9a-f]+ +.*
0001: +[0-9a-f]+ [0-9a-f]+ +.*
 +[0-9a-f]+ +.*
#...
'PLT' relocation section at offset 0x[0-9a-f]+ contains 24 bytes:
 +Offset +Info +Type +Sym. Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_JUMP_SLOT +[0-9a-f]+ +func1 \+ 0
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_JUMP_SLOT +[0-9a-f]+ +func2 \+ 0
