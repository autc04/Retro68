#as: -mthin-add-sub
#readelf: -rW
#skip: loongarch32-*-*

Relocation section '.rela.text' at offset 0x108 contains 6 entries:
.*
0+0  000000060000002f R_LARCH_ADD8           0+0 global_a \+ 0
0+0  0000000400000034 R_LARCH_SUB8           0+0 L0\^A \+ 0
0+1  0000000600000030 R_LARCH_ADD16          0+0 global_a \+ 0
0+1  0000000500000035 R_LARCH_SUB16          0+1 L0\^A \+ 0
0+3  0000000600000063 R_LARCH_32_PCREL       0+0 global_a \+ 0
0+7  000000060000006d R_LARCH_64_PCREL       0+0 global_a \+ 0
