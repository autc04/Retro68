#as: -mno-relax
#source: mapping-03.s
#objdump: --syms --special-syms

.*file format.*riscv.*

SYMBOL TABLE:
0+00 l    d  .text	0+00 .text
0+00 l    d  .data	0+00 .data
0+00 l    d  .bss	0+00 .bss
0+00 l       .text	0+00 \$x
0+04 l       .text	0+00 \$d
0+08 l       .text	0+00 \$x
0+10 l       .text	0+00 \$d
0+14 l       .text	0+00 \$x
0+18 l       .text	0+00 \$d
0+20 l       .text	0+00 \$d
0+24 l       .text	0+00 \$x
0+1d l       .text	0+00 \$d
0+1e l       .text	0+00 \$x
0+00 l    d  .riscv.attributes	0+00 .riscv.attributes
