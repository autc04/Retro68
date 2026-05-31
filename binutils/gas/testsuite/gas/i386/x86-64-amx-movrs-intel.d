#objdump: -dw -Mintel
#name: x86_64 AMX-MOVRS insns (Intel disassembly)
#source: x86-64-amx-movrs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*c4 a2 7b 4a b4 f5 00 00 00 10\s+tileloaddrs tmm6,\[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*c4 c2 7b 4a 1c 21\s+tileloaddrs tmm3,\[r9\+riz\*1\]
\s*[a-f0-9]+:\s*c4 a2 79 4a b4 f5 00 00 00 10\s+tileloaddrst1 tmm6,\[rbp\+r14\*8\+0x10000000\]
\s*[a-f0-9]+:\s*c4 c2 79 4a 1c 21\s+tileloaddrst1 tmm3,\[r9\+riz\*1\]
#pass
