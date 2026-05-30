#as: --32
#ld: -shared -melf_i386 -z nocombreloc -z noseparate-code --no-ld-generated-unwind-info --hash-style=sysv
#readelf: -d -r -S --wide

There are [0-9]+ section headers, starting at offset 0x[0-9a-f]+:

Section Headers:
 +\[Nr\] Name +Type +Addr +Off +Size +ES Flg Lk Inf Al
#...
 +\[[ 0-9]+\] .rel.data +REL +0+128 0+128 0+8 08 +AI +2 +11 +4
 +\[[ 0-9]+\] .rel.tls +REL +0+130 0+130 0+8 08 +AI +2 +10 +4
 +\[[ 0-9]+\] .rel.plt +REL +0+138 0+138 0+8 08 +AI +2 +10 +4
#...
Dynamic section at offset 0x[0-9a-f]+ contains [0-9]+ entries:
 +Tag +Type +Name/Value
#...
 0x[0-9a-f]+ +\(PLTRELSZ\) +8 \(bytes\)
 0x[0-9a-f]+ +\(PLTREL\) +REL
 0x[0-9a-f]+ +\(JMPREL\) +0x138
#...
 0x[0-9a-f]+ +\(REL\) +0x128
 0x[0-9a-f]+ +\(RELSZ\) +16 \(bytes\)
 0x[0-9a-f]+ +\(RELENT\) +8 \(bytes\)
#...
Relocation section '.rel.data' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_32 +0+ +foo

Relocation section '.rel.tls' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_TLS_DESC +0+ +foo

Relocation section '.rel.plt' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_JUMP_SLOT +0+ +bar
