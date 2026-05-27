#objdump: -dw -Mintel
#name: x86_64 AMX-FP8 insns (Intel disassembly)
#source: x86-64-amx-fp8.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*c4 e5 58 fd f5\s+tdpbf8ps tmm6,tmm5,tmm4
\s*[a-f0-9]+:\s*c4 e5 70 fd da\s+tdpbf8ps tmm3,tmm2,tmm1
\s*[a-f0-9]+:\s*c4 e5 5b fd f5\s+tdpbhf8ps tmm6,tmm5,tmm4
\s*[a-f0-9]+:\s*c4 e5 73 fd da\s+tdpbhf8ps tmm3,tmm2,tmm1
\s*[a-f0-9]+:\s*c4 e5 5a fd f5\s+tdphbf8ps tmm6,tmm5,tmm4
\s*[a-f0-9]+:\s*c4 e5 72 fd da\s+tdphbf8ps tmm3,tmm2,tmm1
\s*[a-f0-9]+:\s*c4 e5 59 fd f5\s+tdphf8ps tmm6,tmm5,tmm4
\s*[a-f0-9]+:\s*c4 e5 71 fd da\s+tdphf8ps tmm3,tmm2,tmm1
#pass
