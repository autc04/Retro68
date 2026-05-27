#source: pr28387.s
#as: --x32
#ld: -shared -melf32_x86_64 -z nocombreloc -z nomark-plt -z noseparate-code -z max-page-size=0x200000 --no-ld-generated-unwind-info --hash-style=sysv
#readelf: -d -r -S --wide

There are [0-9]+ section headers, starting at offset 0x[0-9a-f]+:

Section Headers:
 +\[Nr\] Name +Type +Addr +Off +Size +ES Flg Lk Inf Al
#...
 +\[[ 0-9]+\] .rela.data +RELA +0+128 0+128 0+c 0c +AI +2 +12 +4
 +\[[ 0-9]+\] .rela.tls +RELA +0+134 0+134 0+c 0c +AI +2 +11 +4
 +\[[ 0-9]+\] .rela.plt +RELA +0+140 0+140 0+c 0c +AI +2 +11 +4
#...
Dynamic section at offset 0x[0-9a-f]+ contains [0-9]+ entries:
 +Tag +Type +Name/Value
#...
 0x[0-9a-f]+ +\(PLTRELSZ\) +12 \(bytes\)
 0x[0-9a-f]+ +\(PLTREL\) +RELA
 0x[0-9a-f]+ +\(JMPREL\) +0x140
#...
 0x[0-9a-f]+ +\(RELA\) +0x128
 0x[0-9a-f]+ +\(RELASZ\) +24 \(bytes\)
 0x[0-9a-f]+ +\(RELAENT\) +12 \(bytes\)
#...
Relocation section '.rela.data' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_32 +0+ +foo \+ 0

Relocation section '.rela.tls' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_TLSDESC +0+ +foo \+ 0

Relocation section '.rela.plt' at offset 0x[0-9a-f]+ contains 1 entry:
 +Offset +Info +Type +Sym.* Value +Symbol's Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ +R_X86_64_JUMP_SLOT +0+ +bar \+ 0
