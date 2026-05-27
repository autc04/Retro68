#objdump: -dw
#name: x86_64 AMX-FP8 insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 e5 58 fd f5\s+tdpbf8ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e5 70 fd da\s+tdpbf8ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e5 5b fd f5\s+tdpbhf8ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e5 73 fd da\s+tdpbhf8ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e5 5a fd f5\s+tdphbf8ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e5 72 fd da\s+tdphbf8ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e5 59 fd f5\s+tdphf8ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e5 71 fd da\s+tdphf8ps %tmm1,%tmm2,%tmm3
#pass
