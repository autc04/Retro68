#source: dt-relr-2.s
#as: --64
#ld: -shared -melf_x86_64 $DT_RELR_LDFLAGS -z nomark-plt --hash-style=sysv
#readelf: -D -r --wide
#target: x86_64-*-linux*

'RELA' relocation section at offset 0x[0-9a-f]+ contains 48 bytes:
 +Offset +Info +Type +Symbol's Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_64 +0+ +data1 \+ 0
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_64 +0+ +data1 \+ 0

'RELR' relocation section at offset 0x[a-f0-9]+ contains 16 bytes:
#...
0000: +[0-9a-f]+ [0-9a-f]+ +.*
0001: +[0-9a-f]+ [0-9a-f]+ +.*
 +[0-9a-f]+ +.*
#...
'PLT' relocation section at offset 0x[0-9a-f]+ contains 48 bytes:
 +Offset +Info +Type +Symbol's Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_JUMP_SLOT +[0-9a-f]+ +func1 \+ 0
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_JUMP_SLOT +[0-9a-f]+ +func2 \+ 0
