#source: ifunc-5.s
#ld: -shared -z nocombreloc
#readelf: -r --wide
#target: aarch64*-*-*

Relocation section '.rela.got' at .*
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_(P32_|)GLOB_DAT[ ]+foo\(\)[ ]+foo \+ 0
#...
Relocation section '.rela.plt' at .*
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_(P32_|)JUMP_SLO(T|)[ ]+foo\(\)[ ]+foo \+ 0
