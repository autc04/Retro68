#source: orphana_nu.s
#source: orphanb.s
#source: orphand.s
#source: orphane.s
#ld: --file-align 1 --section-align 1  --no-leading-underscore
#objdump: -h --wide
#xfail: mcore-*-*

#...
 +. +\.foo +0+20 .*
 +. +\.rdata .*
 +. +\.foo +0+20 .*
 +. +\.idata .*
#pass
