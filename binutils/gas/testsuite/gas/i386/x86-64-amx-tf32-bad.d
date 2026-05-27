#objdump: -drw
#name: x86_64 AMX_TF32 bad insns

.*: +file format .*


Disassembly of section \.text:

0+ <\.text>:
\s*[a-f0-9]+:\s*c4 e2 71 48 d1\s+tmmultf32ps %tmm1/\(bad\),%tmm1/\(bad\),%tmm2
\s*[a-f0-9]+:\s*c4 e2 69 48 c9\s+tmmultf32ps %tmm2,%tmm1/\(bad\),%tmm1/\(bad\)
\s*[a-f0-9]+:\s*c4 e2 71 48 ca\s+tmmultf32ps %tmm1/\(bad\),%tmm2,%tmm1\/\(bad\)
#pass
