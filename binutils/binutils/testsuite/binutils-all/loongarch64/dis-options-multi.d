#name: LoongArch disassembler options: multiple
#source: dis-options.s
#objdump: -d --no-show-raw-insn -M no-aliases,numeric

#...
Disassembly of section \.text:

[0-9a-f]+ <\.text>:
   [0-9a-f]+:[ 	]+or[ 	]+\$r4, \$r21, \$r0
   [0-9a-f]+:[ 	]+jirl[ 	]+\$r0, \$r1, 0
