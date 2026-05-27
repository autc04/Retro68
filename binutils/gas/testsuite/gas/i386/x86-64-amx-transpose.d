#objdump: -dw
#name: x86_64 AMX-TRANSPOSE insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 e2 5a 6c f5\s+ttdpbf16ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 72 6c da\s+ttdpbf16ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 5b 6c f5\s+ttdpfp16ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 73 6c da\s+ttdpfp16ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 7a 5f f5\s+ttransposed %tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 7a 5f da\s+ttransposed %tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 a2 78 6e b4 f5 00 00 00 10\s+t2rpntlvwz0 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 78 6e 14 21\s+t2rpntlvwz0 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a2 78 6f b4 f5 00 00 00 10\s+t2rpntlvwz0t1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 78 6f 14 21\s+t2rpntlvwz0t1 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a2 79 6e b4 f5 00 00 00 10\s+t2rpntlvwz1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 79 6e 14 21\s+t2rpntlvwz1 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a2 79 6f b4 f5 00 00 00 10\s+t2rpntlvwz1t1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 79 6f 14 21\s+t2rpntlvwz1t1 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a5 78 f8 b4 f5 00 00 00 10\s+t2rpntlvwz0rs 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c5 78 f8 14 21\s+t2rpntlvwz0rs \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a5 78 f9 b4 f5 00 00 00 10\s+t2rpntlvwz0rst1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c5 78 f9 14 21\s+t2rpntlvwz0rst1 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a5 79 f8 b4 f5 00 00 00 10\s+t2rpntlvwz1rs 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c5 79 f8 14 21\s+t2rpntlvwz1rs \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 a5 79 f9 b4 f5 00 00 00 10\s+t2rpntlvwz1rst1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c5 79 f9 14 21\s+t2rpntlvwz1rst1 \(%r9,%riz,1\),%tmm2
\s*[a-f0-9]+:\s*c4 e2 58 6b f5\s+tconjtcmmimfp16ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 70 6b da\s+tconjtcmmimfp16ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 79 6b f5\s+tconjtfp16 %tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 79 6b da\s+tconjtfp16 %tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 5b 6b f5\s+ttcmmimfp16ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 73 6b da\s+ttcmmimfp16ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 5a 6b f5\s+ttcmmrlfp16ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 72 6b da\s+ttcmmrlfp16ps %tmm1,%tmm2,%tmm3
\s*[a-f0-9]+:\s*c4 e2 58 48 f5\s+ttmmultf32ps %tmm4,%tmm5,%tmm6
\s*[a-f0-9]+:\s*c4 e2 70 48 da\s+ttmmultf32ps %tmm1,%tmm2,%tmm3
#pass
