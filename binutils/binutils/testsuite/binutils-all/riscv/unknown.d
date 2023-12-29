#as: -march=rv32ic
#objdump: -d
# Test the disassembly of unknown instruction encodings, specifically,
# ensure that we generate a .?byte opcode.

#...
Disassembly of section \.text:

[0-9a-f]+ <\.text>:
   [0-9a-f]+:	0052018b          	\.4byte	0x52018b
   [0-9a-f]+:	9c45                	\.2byte	0x9c45
