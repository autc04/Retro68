#objdump: -dw
#name: x86_64 AMX-MOVRS insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 a2 7b 4a b4 f5 00 00 00 10\s+tileloaddrs 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 7b 4a 1c 21\s+tileloaddrs \(%r9,%riz,1\),%tmm3
\s*[a-f0-9]+:\s*c4 a2 79 4a b4 f5 00 00 00 10\s+tileloaddrst1 0x10000000\(%rbp,%r14,8\),%tmm6
\s*[a-f0-9]+:\s*c4 c2 79 4a 1c 21\s+tileloaddrst1 \(%r9,%riz,1\),%tmm3
#pass
