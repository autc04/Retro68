#objdump: -dw -Mintel
#name: i386 MOVRS insns (Intel disassembly)
#source: movrs.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
\s*[a-f0-9]+:\s*0f 18 a4 f4 00 00 00 10\s+prefetchrst2 BYTE PTR \[esp\+esi\*8\+0x10000000\]
\s*[a-f0-9]+:\s*0f 18 21\s+prefetchrst2 BYTE PTR \[ecx\]
\s*[a-f0-9]+:\s*0f 18 61 7f\s+prefetchrst2 BYTE PTR \[ecx\+0x7f\]
\s*[a-f0-9]+:\s*0f 18 62 80\s+prefetchrst2 BYTE PTR \[edx-0x80\]
#pass
