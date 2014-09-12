#source: tls.s
#as: -a64
#ld: tmpdir/libtlslib.so
#objdump: -sj.got
#target: powerpc64*-*-*

.*

Contents of section \.got:
.* (00000000|38860110) (10018638|00000000) (ffffffff|1880ffff) (ffff8018|ffffffff)  .*
.* 00000000 00000000 00000000 00000000  .*
.* 00000000 00000000 00000000 00000000  .*
