#objdump: -dwMsuffix
#name: x86_64 MOVRS insns (w/ suffix)

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*66 0f 38 8b 92 00 ff ff ff\s+movrsw -0x100\(%rdx\),%dx
\s*[a-f0-9]+:\s*0f 38 8b 92 00 fe ff ff\s+movrsl -0x200\(%rdx\),%edx
\s*[a-f0-9]+:\s*4c 0f 38 8b a2 00 fc ff ff\s+movrsq -0x400\(%rdx\),%r12
\s*[a-f0-9]+:\s*0f 38 8a 5a 80\s+movrsb -0x80\(%rdx\),%bl
#pass
