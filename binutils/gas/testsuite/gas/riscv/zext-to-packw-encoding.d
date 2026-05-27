#as: -march=rv64i_zbkb
#source: zext-to-pack.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+[0-9a-f]+:[ 	]+0805453b[ 	]+zext.h[ 	]+a0,a0
