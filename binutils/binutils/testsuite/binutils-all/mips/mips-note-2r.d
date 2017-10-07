#PROG: objcopy
#readelf: --relocs
#objcopy: --merge-notes
#name: MIPS merge notes section relocations (o32)
#as: -32
#source: ../note-2-32.s

Relocation section '\.rel\.gnu\.build\.attributes' at offset .* contains 2 entries:
 Offset     Info    Type            Sym\.Value  Sym\. Name
00000010  ......02 R_MIPS_32         00000100   note1\.s
0000006c  ......02 R_MIPS_32         00000104   note2\.s
