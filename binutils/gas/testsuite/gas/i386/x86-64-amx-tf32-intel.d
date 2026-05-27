#objdump: -dw -Mintel
#name: x86_64 AMX-TF32 insns (Intel disassembly)
#source: x86-64-amx-tf32.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*c4 e2 59 48 f5\s+tmmultf32ps tmm6,tmm5,tmm4
\s*[a-f0-9]+:\s*c4 e2 71 48 da\s+tmmultf32ps tmm3,tmm2,tmm1
#pass
