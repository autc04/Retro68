#as:
#source: mapping-01.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <funcA>:
[ 	]+0:[ 	]+00a50533[ 	]+add[ 	]+a0,a0,a0
[ 	]+4:[ 	]+0040006f[ 	]+j[ 	]+8 <funcB>

0+008 <funcB>:
[ 	]+8:[ 	]+00b585b3[ 	]+add[ 	]+a1,a1,a1
[ 	]+c:[ 	]+feb51ee3[ 	]+bne[ 	]+a0,a1,8 <funcB>

Disassembly of section .foo:

0+000 <foo>:
[ 	]+0:[ 	]+00c60633[ 	]+add[ 	]+a2,a2,a2
