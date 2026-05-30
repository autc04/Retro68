#name: objdump multiple --disassemble=
#source: multi1.s
#source: multi2.s
#ld: -r
#objdump: --disassemble=func --disassemble=func2 -wz
# ECOFF disassembly omits local symbols, for whatever reason.
#xfail: "alpha*-*-*ecoff" "alpha*-*-osf*"

.*: +file format .*

Disassembly of section .*:

0+ <func>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*

0+[0-1][0-9a-f] <func2>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#...
0+[0-2][0-9a-f] <func2>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#?[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*

0+[0-3][0-9a-f] <func>:
[ 	]*[0-9a-f]+:	[0-9a-f][0-9a-f].*
#pass
