#as: -misa-spec=2.2
#source: option-arch.s
#objdump: -d --syms --special-syms

.*:[   ]+file format .*

SYMBOL TABLE:
0+00 l    d  .text	0+00 .text
0+00 l    d  .data	0+00 .data
0+00 l    d  .bss	0+00 .bss
0+00 l       .text	0+00 \$xrv64i2p0_c2p0_zca1p0
0+02 l       .text	0+00 \$xrv64i2p0_f2p0_d2p0_xvendor1p0
0+0a l       .text	0+00 \$xrv64i2p0_m3p0_f2p0_d3p0_c2p0_zmmul1p0_zca1p0_zcd1p0_xvendor32x3p0
0+0c l       .text	0+00 \$xrv32i2p1_c2p0_zca1p0
0+00 l    d  .riscv.attributes	0+00 .riscv.attributes


Disassembly of section .text:

0+000 <.text>:
[ 	]+0:[  	]+952e[    	]+add[        	]+a0,a0,a1
[ 	]+2:[  	]+00b50533[    	]+add[        	]+a0,a0,a1
[ 	]+6:[  	]+00302573[    	]+frcsr[        	]+a0
[ 	]+a:[  	]+952e[    	]+add[        	]+a0,a0,a1
[ 	]+c:[  	]+c8002573[    	]+rdcycleh[ 	]+a0
#...
