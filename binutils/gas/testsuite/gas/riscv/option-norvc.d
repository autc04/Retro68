#as: -misa-spec=2.2 -march=rv64i
#source: option-norvc.s
#objdump: -d --syms --special-syms -Mno-aliases

.*:[   ]+file format .*

SYMBOL TABLE:
0+00 l    d  .text	0+00 .text
0+00 l    d  .data	0+00 .data
0+00 l    d  .bss	0+00 .bss
0+00 l       .text	0+00 \$xrv64i2p0_c2p0_zca1p0
0+02 l       .text	0+00 \$xrv64i2p0
0+06 l       .text	0+00 \$xrv32i2p0_f2p0_c2p0_zca1p0_zcf1p0
0+08 l       .text	0+00 \$xrv32i2p0_f2p0
0+0c l       .text	0+00 \$xrv64i2p0_f2p0_d2p0_c2p0_zca1p0_zcd1p0
0+0e l       .text	0+00 \$xrv64i2p0_f2p0_d2p0
0+12 l       .text	0+00 \$xrv64i2p0_f2p0_d2p0_zca1p0
0+14 l       .text	0+00 \$xrv64i2p0_f2p0_d2p0
0+18 l       .text	0+00 \$xrv32i2p0_f2p0_zca1p0_zcf1p0
0+1a l       .text	0+00 \$xrv32i2p0_f2p0
0+1e l       .text	0+00 \$xrv64i2p0_f2p0_d2p0_zca1p0_zcd1p0
0+20 l       .text	0+00 \$xrv64i2p0_f2p0_d2p0
0+24 l       .text	0+00 \$xrv32i2p0_zilsd1p0_zca1p0_zcb1p0_zclsd1p0
0+28 l       .text	0+00 \$xrv32i2p0_zilsd1p0
0+30 l       .text	0+00 \$xrv64i2p0
0+0 l    d  .riscv.attributes	0+00 .riscv.attributes


Disassembly of section .text:

0+000 <.text>:
[ 	]+[0-9a-f]+:[ 	]+0001[ 	]+c\.addi[ 	]+zero,0
[ 	]+[0-9a-f]+:[ 	]+00000013[ 	]+addi[ 	]+zero,zero,0
[ 	]+[0-9a-f]+:[ 	]+6108[ 	]+c\.flw[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+00052507[ 	]+flw[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+2108[ 	]+c\.fld[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+00053507[ 	]+fld[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+0001[ 	]+c\.addi[ 	]+zero,0
[ 	]+[0-9a-f]+:[ 	]+00000013[ 	]+addi[ 	]+zero,zero,0
[ 	]+[0-9a-f]+:[ 	]+6108[ 	]+c\.flw[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+00052507[ 	]+flw[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+2108[ 	]+c\.fld[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+00053507[ 	]+fld[ 	]+fa0,0\(a0\)
[ 	]+[0-9a-f]+:[ 	]+8020[ 	]+c\.lbu[ 	]+s0,2\(s0\)
[ 	]+[0-9a-f]+:[ 	]+6080[ 	]+c\.ld[ 	]+s0,0\(s1\)
[ 	]+[0-9a-f]+:[ 	]+00244403[ 	]+lbu[ 	]+s0,2\(s0\)
[ 	]+[0-9a-f]+:[ 	]+0004b403[ 	]+ld[ 	]+s0,0\(s1\)
#...
