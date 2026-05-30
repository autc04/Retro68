#ld: -e _start -Ttext=0x1000 -z max-page-size=0x1000 -z common-page-size=0x1000 -z noseparate-code
#readelf: -lSW
#target: *-linux* *-gnu*
#notarget: hppa64-*-* ia64-*-*

#...
.* \.tbss +NOBITS +0+1014 +0+1014 +0+4 +0+ +WAT +0 +0 +4

#...
 +TLS +0x0*1014 +0x0+1014 +0x0+1014 +0x0+ +0x0+4 R +0x4
#...
.* \.tbss 
#pass
