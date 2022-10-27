#as:
#source: mapping-01.s
#objdump: --syms --special-syms

.*file format.*riscv.*

SYMBOL TABLE:
0+00 l    d  .text	0+00 .text
0+00 l    d  .data	0+00 .data
0+00 l    d  .bss	0+00 .bss
0+00 l       .text	0+00 \$x
0+00 l    d  .foo	0+00 .foo
0+00 l       .foo	0+00 foo
0+00 l       .foo	0+00 \$x
0+00 l    d  .riscv.attributes	0+00 .riscv.attributes
0+00 g       .text	0+00 funcA
0+08 g       .text	0+00 funcB
