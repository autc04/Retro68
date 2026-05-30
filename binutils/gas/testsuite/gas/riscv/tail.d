#as: -march=rv32gc_zicfiss_zicfilp
#objdump: -d

.*:[    ]+file format .*


Disassembly of section .text:

0+000 <foo>:
[ 	]+[0-9a-f]+:[ 	]+00000317[ 	]+auipc[ 	]+t1,0x0
[ 	]+[0-9a-f]+:[ 	]+00030067[ 	]+jr[ 	]+t1 # 0 <foo>
[ 	]+[0-9a-f]+:[ 	]+00000397[ 	]+auipc[ 	]+t2,0x0
[ 	]+[0-9a-f]+:[ 	]+00038067[ 	]+jr[ 	]+t2 # 8 <foo\+0x8>
