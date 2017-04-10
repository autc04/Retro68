#source: ifunc-5-local.s
#ld: -r
#readelf: -r --wide
#target: aarch64*-*-*

Relocation section '.rela.text' at .*
[ ]+Offset[ ]+Info[ ]+Type[ ]+.*
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_(P32_|)CALL26[ ]+foo\(\)[ ]+foo \+ 0
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_(P32_|)ADR_GOT_(PAGE|)[ ]+foo\(\)[ ]+foo \+ 0
[0-9a-f]+[ ]+[0-9a-f]+[ ]+R_AARCH64_(P32_|)LD(64|32)_GOT(_LO1|)[ ]+foo\(\)[ ]+foo \+ 0
