#readelf: -r
#name: .cfi_escape on SPARC w/ reloc specifier
#as: -32

Relocation section '.rela.data' at offset 0x[0-9a-f]+ contains 1 entry:
 Offset     Info    Type            Sym\.Value  Sym\. Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ R_SPARC_DISP8 +[0-9a-f]+ +\.data \+ 1

Relocation section '.rela.eh_frame' at offset 0x[0-9a-f]+ contains 2 entries:
 Offset     Info    Type            Sym\.Value  Sym\. Name \+ Addend
[0-9a-f]+ +[0-9a-f]+ R_SPARC_DISP32 +[0-9a-f]+ +\.text \+ 0
[0-9a-f]+ +[0-9a-f]+ R_SPARC_DISP8 +[0-9a-f]+ +\.eh_frame \+ [0-9a-f]+
