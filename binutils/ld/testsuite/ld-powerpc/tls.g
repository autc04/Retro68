#source: tls.s
#source: tlslib.s
#as: -a64
#ld:
#objdump: -sj.got
#target: powerpc64*-*-*

.*

Contents of section \.got:
 100101f8 (00000000|f8810110) (100181f8|00000000) (ffffffff|1880ffff) (ffff8018|ffffffff)  .*
 10010208 (ffffffff|5880ffff) (ffff8058|ffffffff)                    .*
