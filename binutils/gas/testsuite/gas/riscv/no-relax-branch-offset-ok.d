#as: -march=rv32ic
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
[ 	]+0:[ 	]+7ffff06f[ 	]+j[ 	][0-9a-f]+.*
[ 	]+4:[ 	]+8000006f[ 	]+j[ 	][0-9a-f]+.*
[ 	]+8:[ 	]+7ffff06f[ 	]+j[ 	][0-9a-f]+.*
[ 	]+c:[ 	]+8000006f[ 	]+j[ 	][0-9a-f]+.*
[ 	]+10:[ 	]+123452b7[ 	]+lui[ 	]t0,0x12345
[ 	]+14:[ 	]+7ffff06f[ 	]+j[ 	][0-9a-f]+.*
[ 	]+18:[ 	]+2abcd2b7[ 	]+lui[ 	]t0,0x2abcd
[ 	]+1c:[ 	]+8000006f[ 	]+j[ 	][0-9a-f]+.*
