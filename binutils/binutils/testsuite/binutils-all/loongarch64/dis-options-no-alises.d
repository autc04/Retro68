#name: LoongArch disassembler options: no-aliases
#source: dis-options.s
#objdump: -d --no-show-raw-insn -M no-aliases

#...
Disassembly of section \.text:

[0-9a-f]+ <\.text>:
   [0-9a-f]+:[ 	]+or[ 	]+\$a0, \$r21, \$zero
   [0-9a-f]+:[ 	]+jirl[ 	]+\$zero, \$ra, 0
