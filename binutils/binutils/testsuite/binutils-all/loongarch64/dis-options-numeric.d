#name: LoongArch disassembler options: numeric
#source: dis-options.s
#objdump: -d --no-show-raw-insn -M numeric

#...
Disassembly of section \.text:

[0-9a-f]+ <\.text>:
   [0-9a-f]+:[ 	]+move[ 	]+\$r4, \$r21
   [0-9a-f]+:[ 	]+ret
