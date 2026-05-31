#as: --gsframe-3
#source: pr32769-2.s
#readelf: -j .rela.sframe
#ld: --gc-sections -r -e foo
#name: GC Multiple .text sections, check relas

Relocation section '.rela.sframe' at offset 0x[0-9a-f]+ contains 1 entry:
\s+Offset\s+Info\s+Type\s+Sym.\s+Value\s+Sym.\s+Name\s\+\sAddend
[0-9a-f]+\s+[0-9a-f]+\s+R_[_\w\d]+\s+[0-9a-f]+\s\.text\.foo \+ 0