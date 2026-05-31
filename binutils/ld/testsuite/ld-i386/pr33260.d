#source: pr33260.s
#as: -mrelax-relocations=yes --32
#ld: -melf_i386 -shared
#readelf: -r --wide

Relocation section '.rel.dyn' at offset 0x[0-9a-f]+ contains 2 entries:
 +Offset +Info +Type +Sym.* Value +Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_RELATIVE +
[0-9a-f]+ +[0-9a-f]+ +R_386_RELATIVE +
