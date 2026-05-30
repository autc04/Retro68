#as: -march=rv32i
#source: no-relax-pcrel-offset-fail-64.s
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
[ 	]+0:[ 	]+80000517[ 	]+auipc[ 	]a0,0x80000
[ 	]+4:[ 	]+80050513[ 	]+addi[ 	]a0,a0,-2048([^0-9].*)?
[ 	]+8:[ 	]+7ffff517[ 	]+auipc[ 	]a0,0x7ffff
[ 	]+c:[ 	]+7ff50513[ 	]+addi[ 	]a0,a0,2047([^0-9].*)?
[ 	]+10:[ 	]+80000517[ 	]+auipc[ 	]a0,0x80000
[ 	]+14:[ 	]+80050513[ 	]+addi[ 	]a0,a0,-2048([^0-9].*)?
[ 	]+18:[ 	]+7ffff517[ 	]+auipc[ 	]a0,0x7ffff
[ 	]+1c:[ 	]+7ff50513[ 	]+addi[ 	]a0,a0,2047([^0-9].*)?
[ 	]+20:[ 	]+80000517[ 	]+auipc[ 	]a0,0x80000
[ 	]+24:[ 	]+80050513[ 	]+addi[ 	]a0,a0,-2048([^0-9].*)?
[ 	]+28:[ 	]+7ffff517[ 	]+auipc[ 	]a0,0x7ffff
[ 	]+2c:[ 	]+7ff50513[ 	]+addi[ 	]a0,a0,2047([^0-9].*)?
