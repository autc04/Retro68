#as: --32
#ld: -pie -m elf_i386 -T pr19539.t
#readelf: -r --wide

Relocation section '.rel.dyn' at offset 0x[0-9a-f]+ contains 1 entries:
 Offset     Info    Type                Sym. Value  Symbol's Name
[0-9a-f]+ +[0-9a-f]+ +R_386_RELATIVE +
