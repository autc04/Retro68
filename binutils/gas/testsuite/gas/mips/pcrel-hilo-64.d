#readelf: -r
#name: MIPSr6 PCHI16/PCLO16 relocations (n64)
#as: -mabi=64 -march=mips64r6 -mno-pdr
#source: pcrel-hilo.s

Relocation section '\.rela\.text' at offset .+ contains 24 entries:
  Offset          Info           Type           Sym\. Value    Sym\. Name \+ Addend
000000000000  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 7fec
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000004  000900000005 R_MIPS_HI16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000008  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 7ff8
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000000000c  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ fff0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000010  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 7ffc
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000014  000900000006 R_MIPS_LO16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000018  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 8008
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000000001c  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 10000
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000020  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 800c
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000024  000900000005 R_MIPS_HI16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000000028  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 8018
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000000002c  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 10010
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030030  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 3801c
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030034  000900000006 R_MIPS_LO16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030038  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 38028
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000003003c  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 40020
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030040  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 3802c
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030044  000900000006 R_MIPS_LO16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030048  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 38038
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000003004c  000800000041 R_MIPS_PCLO16     0000000000000000 bar \+ 40030
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030050  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 3803c
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030054  000900000005 R_MIPS_HI16       0000000000000000 baz \+ 0
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
000000030058  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 38048
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
00000003005c  000800000040 R_MIPS_PCHI16     0000000000000000 bar \+ 40040
                    Type2: R_MIPS_NONE      
                    Type3: R_MIPS_NONE      
