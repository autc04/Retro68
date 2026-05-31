#as:
#readelf: -rWs
#name: loongarch64 local PIC

Relocation section '.rela.text' at offset 0x[0-9a-f]+ contains 12 entries:
.*
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_PC_HI20 +[0-9a-f]+ +sym \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_PC_LO12 +[0-9a-f]+ +sym \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_PC_HI20 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_PC_LO12 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT64_PC_LO20 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT64_PC_HI12 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_HI20 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_LO12 +[0-9a-f]+ +foo \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_HI20 +[0-9a-f]+ +sym \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT_LO12 +[0-9a-f]+ +sym \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT64_LO20 +[0-9a-f]+ +sym \+ 0
[0-9a-f]+ +[0-9a-f]+ R_LARCH_GOT64_HI12 +[0-9a-f]+ +sym \+ 0
#...
 +[0-9a-f]+: +[0-9a-f]+ +0 NOTYPE +LOCAL +DEFAULT +[0-9a-f]+ foo
 +[0-9a-f]+: +0+abba +0 NOTYPE +LOCAL +DEFAULT +ABS sym
#pass
