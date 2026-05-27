#objdump: -dw
#name: x86_64 AMX-TF32 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 e2 59 48 f5\s+tmmultf32ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 71 48 da\s+tmmultf32ps %tmm1,%tmm2,%tmm3
#pass
