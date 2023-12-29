#name: jirl zero-offset symbols for LoongArch32
#source: disas-jirl-32.s
#ld: --no-relax
#objdump: -d
#skip: loongarch64-*-*

.*:[ 	]+file format .*


Disassembly of section .text:

00010054 <_start>:
[ 	]+10054:[ 	]+1c000014 [ 	]+pcaddu12i[ 	]+[ 	]+\$t8, 0
[ 	]+10058:[ 	]+02800294 [ 	]+addi.w[ 	]+[ 	]+\$t8, \$t8, 0
[ 	]+1005c:[ 	]+4c000281 [ 	]+jirl[ 	]+[ 	]+\$ra, \$t8, 0
