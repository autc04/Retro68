#PROG: objcopy
#readelf: --relocs
#objcopy: --merge-notes
#name: MIPS merge notes section relocations (n32)
#as: -n32 -mips3
#source: ../note-2-32.s

Relocation section '\.rela\.gnu\.build\.attributes' at offset .* contains 2 entries:
 Offset     Info    Type            Sym\.Value  Sym\. Name \+ Addend
00000010  ......02 R_MIPS_32         00000100   note1\.s \+ 0
0000006c  ......02 R_MIPS_32         00000104   note2\.s \+ 0
