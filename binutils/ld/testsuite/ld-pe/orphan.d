#source: orphana.s
#source: orphanb.s
#source: orphand.s
#source: orphane.s
#ld: --file-align 1 --section-align 1
#objdump: -h --wide
#xfail: mcore-*-*

#...
 +. +\.foo .*
 +. +\.rdata .*
 +. +\.foo +0+20 .*
 +. +\.idata .*
#pass
