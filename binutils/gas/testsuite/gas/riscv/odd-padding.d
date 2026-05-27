#as: -mrelax
#as: -mno-relax
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section \.text:

0+000 <byte>:
[ 	]+0:[ 	]+00000013[ 	]+nop
[ 	]+4:[ 	]+00[ 	]+\.byte[ 	]+0x00
#...
[ 	]+9:[ 	]+00[ 	]+\.byte[ 	]+0x00
[ 	]+a:[ 	]+0001[ 	]+\.insn[ 	]+2, 0x0*1
[ 	]+c:[ 	]+00000013[ 	]+nop
[ 	]+10:[ 	]+00008067[ 	]+ret
