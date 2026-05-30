#source: tlsdesc.s
#source: tlspic2.s
#as: --64
#ld: -shared -melf_x86_64 --no-ld-generated-unwind-info
#readelf: -WSsrld
#target: x86_64-*-*

There are [0-9]+ section headers, starting at offset 0x[0-9a-f]+:

Section Headers:
 +\[Nr\] Name +Type +Address +Off +Size +ES Flg Lk Inf Al
 +\[[ 0-9]+\] +NULL +0+ 0+ 0+ 00 +0 +0 +0
 +\[[ 0-9]+\] .hash +.*
 +\[[ 0-9]+\] .dynsym +.*
 +\[[ 0-9]+\] .dynstr +.*
 +\[[ 0-9]+\] .rela.dyn +.*
 +\[[ 0-9]+\] .plt +PROGBITS +0+3b0 0+3b0 0+20 10 +AX +0 +0 +(4|16)
 +\[[ 0-9]+\] .text +PROGBITS +0+1000 0+1000 0+153 00 +AX +0 +0 4096
 +\[[ 0-9]+\] .tdata +PROGBITS +0+201153 0+1153 0+60 00 WAT +0 +0 +1
 +\[[ 0-9]+\] .tbss +NOBITS +0+2011b3 0+11b3 0+20 00 WAT +0 +0 +1
 +\[[ 0-9]+\] .dynamic +DYNAMIC +0+2011b8 0+11b8 0+120 10 +WA +3 +0 +8
 +\[[ 0-9]+\] .got +PROGBITS +0+2012d8 0+12d8 0+48 08 +WA +0 +0 +8
 +\[[ 0-9]+\] .got.plt +PROGBITS +0+201320 0+1320 0+68 08 +WA +0 +0 +8
 +\[[ 0-9]+\] .symtab +.*
 +\[[ 0-9]+\] .strtab +.*
 +\[[ 0-9]+\] .shstrtab +.*
Key to Flags:
#...

Elf file type is DYN \(Shared object file\)
Entry point 0x[0-9a-f]+
There are [0-9]+ program headers, starting at offset [0-9]+

Program Headers:
 +Type +Offset +VirtAddr +PhysAddr +FileSiz +MemSiz +Flg Align
 +LOAD +0x0+ 0x0+ 0x0+ 0x[0-9a-f]+ 0x[0-9a-f]+ R E 0x200000
 +LOAD +0x0+1153 0x0+201153 0x0+201153 0x0+235 0x0+235 RW +0x200000
 +DYNAMIC +0x0+11b8 0x0+2011b8 0x0+2011b8 0x0+120 0x0+120 RW +0x8
 +TLS +0x0+1153 0x0+201153 0x0+201153 0x0+60 0x0+80 R +0x1

 Section to Segment mapping:
 +Segment Sections...
 +00 +.hash .dynsym .dynstr .rela.dyn .plt .text *
 +01 +.tdata .dynamic .got .got.plt *
 +02 +.dynamic *
 +03 +.tdata .tbss *

Dynamic section at offset 0x[0-9a-f]+ contains 13 entries:
 +Tag +Type +Name/Value
 0x[0-9a-f]+ +\(HASH\).*
 0x[0-9a-f]+ +\(STRTAB\).*
 0x[0-9a-f]+ +\(SYMTAB\).*
 0x[0-9a-f]+ +\(STRSZ\).*
 0x[0-9a-f]+ +\(SYMENT\).*
 0x[0-9a-f]+ +\(PLTGOT\).*
 0x[0-9a-f]+ +\(TLSDESC_PLT\) +0x3c0
 0x[0-9a-f]+ +\(TLSDESC_GOT\) +0x201318
 0x[0-9a-f]+ +\(RELA\).*
 0x[0-9a-f]+ +\(RELASZ\).*
 0x[0-9a-f]+ +\(RELAENT\).*
 0x[0-9a-f]+ +\(FLAGS\).*
 0x[0-9a-f]+ +\(NULL\).*

Relocation section '.rela.dyn' at offset 0x[0-9a-f]+ contains 13 entries:
 +Offset +Info +Type +Symbol's Value +Symbol's Name \+ Addend
0+2012d8 +[0-9a-f]+ R_X86_64_TPOFF64 +24
0+2012e0 +[0-9a-f]+ R_X86_64_TPOFF64 +30
0+2012e8 +[0-9a-f]+ R_X86_64_TPOFF64 +64
0+2012f8 +[0-9a-f]+ R_X86_64_TPOFF64 +50
0+201300 +[0-9a-f]+ R_X86_64_TPOFF64 +70
0+201310 +[0-9a-f]+ R_X86_64_TPOFF64 +44
0+201338 +[0-9a-f]+ R_X86_64_TLSDESC +20
0+201348 +[0-9a-f]+ R_X86_64_TLSDESC +60
0+201358 +[0-9a-f]+ R_X86_64_TLSDESC +0
0+201378 +[0-9a-f]+ R_X86_64_TLSDESC +40
0+2012f0 +[0-9a-f]+ R_X86_64_TPOFF64 +0+10 sg5 \+ 0
0+201308 +[0-9a-f]+ R_X86_64_TPOFF64 +0+4 sg2 \+ 0
0+201368 +[0-9a-f]+ R_X86_64_TLSDESC +0+ sg1 \+ 0

Symbol table '\.dynsym' contains [0-9]+ entries:
 +Num: +Value +Size +Type +Bind +Vis +Ndx +Name
 +[0-9]+: 0+ +0 +NOTYPE +LOCAL +DEFAULT +UND *
 +[0-9]+: 0+1c +0 +TLS +GLOBAL +DEFAULT +7 sg8
 +[0-9]+: 0+8 +0 +TLS +GLOBAL +DEFAULT +7 sg3
 +[0-9]+: 0+c +0 +TLS +GLOBAL +DEFAULT +7 sg4
 +[0-9]+: 0+10 +0 +TLS +GLOBAL +DEFAULT +7 sg5
 +[0-9]+: 0+ +0 +TLS +GLOBAL +DEFAULT +7 sg1
 +[0-9]+: 0+1000 +0 +FUNC +GLOBAL +DEFAULT +6 fn1
 +[0-9]+: 0+4 +0 +TLS +GLOBAL +DEFAULT +7 sg2
 +[0-9]+: 0+14 +0 +TLS +GLOBAL +DEFAULT +7 sg6
 +[0-9]+: 0+18 +0 +TLS +GLOBAL +DEFAULT +7 sg7

Symbol table '\.symtab' contains [0-9]+ entries:
 +Num: +Value +Size +Type +Bind +Vis +Ndx +Name
 +[0-9]+: 0+ +0 +NOTYPE +LOCAL +DEFAULT +UND *
.* FILE +LOCAL +DEFAULT +ABS .*tlsdesc.o
 +[0-9]+: 0+20 +0 +TLS +LOCAL +DEFAULT +7 sl1
 +[0-9]+: 0+24 +0 +TLS +LOCAL +DEFAULT +7 sl2
 +[0-9]+: 0+28 +0 +TLS +LOCAL +DEFAULT +7 sl3
 +[0-9]+: 0+2c +0 +TLS +LOCAL +DEFAULT +7 sl4
 +[0-9]+: 0+30 +0 +TLS +LOCAL +DEFAULT +7 sl5
 +[0-9]+: 0+34 +0 +TLS +LOCAL +DEFAULT +7 sl6
 +[0-9]+: 0+38 +0 +TLS +LOCAL +DEFAULT +7 sl7
 +[0-9]+: 0+3c +0 +TLS +LOCAL +DEFAULT +7 sl8
.* FILE +LOCAL +DEFAULT +ABS 
 +[0-9]+: 0+60 +0 +TLS +LOCAL +DEFAULT +8 sH1
 +[0-9]+: 0+ +0 +TLS +LOCAL +DEFAULT +7 _TLS_MODULE_BASE_
 +[0-9]+: 0+2011b8 +0 +OBJECT +LOCAL +DEFAULT +9 _DYNAMIC
 +[0-9]+: 0+48 +0 +TLS +LOCAL +DEFAULT +7 sh3
 +[0-9]+: 0+64 +0 +TLS +LOCAL +DEFAULT +8 sH2
 +[0-9]+: 0+78 +0 +TLS +LOCAL +DEFAULT +8 sH7
 +[0-9]+: 0+58 +0 +TLS +LOCAL +DEFAULT +7 sh7
 +[0-9]+: 0+5c +0 +TLS +LOCAL +DEFAULT +7 sh8
 +[0-9]+: 0+6c +0 +TLS +LOCAL +DEFAULT +8 sH4
 +[0-9]+: 0+4c +0 +TLS +LOCAL +DEFAULT +7 sh4
 +[0-9]+: 0+68 +0 +TLS +LOCAL +DEFAULT +8 sH3
 +[0-9]+: 0+50 +0 +TLS +LOCAL +DEFAULT +7 sh5
 +[0-9]+: 0+70 +0 +TLS +LOCAL +DEFAULT +8 sH5
 +[0-9]+: 0+74 +0 +TLS +LOCAL +DEFAULT +8 sH6
 +[0-9]+: 0+7c +0 +TLS +LOCAL +DEFAULT +8 sH8
 +[0-9]+: 0+40 +0 +TLS +LOCAL +DEFAULT +7 sh1
 +[0-9]+: 0+201320 +0 +OBJECT +LOCAL +DEFAULT +11 _GLOBAL_OFFSET_TABLE_
 +[0-9]+: 0+44 +0 +TLS +LOCAL +DEFAULT +7 sh2
 +[0-9]+: 0+54 +0 +TLS +LOCAL +DEFAULT +7 sh6
 +[0-9]+: 0+1c +0 +TLS +GLOBAL +DEFAULT +7 sg8
 +[0-9]+: 0+8 +0 +TLS +GLOBAL +DEFAULT +7 sg3
 +[0-9]+: 0+c +0 +TLS +GLOBAL +DEFAULT +7 sg4
 +[0-9]+: 0+10 +0 +TLS +GLOBAL +DEFAULT +7 sg5
 +[0-9]+: 0+ +0 +TLS +GLOBAL +DEFAULT +7 sg1
 +[0-9]+: 0+1000 +0 +FUNC +GLOBAL +DEFAULT +6 fn1
 +[0-9]+: 0+4 +0 +TLS +GLOBAL +DEFAULT +7 sg2
 +[0-9]+: 0+14 +0 +TLS +GLOBAL +DEFAULT +7 sg6
 +[0-9]+: 0+18 +0 +TLS +GLOBAL +DEFAULT +7 sg7
