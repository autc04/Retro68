#objdump: -dw
#name: i386 MOVRS insns

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*0f 18 a4 f4 00 00 00 10\s+prefetchrst2 0x10000000\(%esp,%esi,8\)
\s*[a-f0-9]+:\s*0f 18 21\s+prefetchrst2 \(%ecx\)
\s*[a-f0-9]+:\s*0f 18 61 7f\s+prefetchrst2 0x7f\(%ecx\)
\s*[a-f0-9]+:\s*0f 18 62 80\s+prefetchrst2 -0x80\(%edx\)
#pass
