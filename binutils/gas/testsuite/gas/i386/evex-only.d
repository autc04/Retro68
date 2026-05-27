#objdump: -dw
#name: AVX512 instructions do not need {evex} prefix with memory

.*: +file format .*


Disassembly of section .text:

0+ <_start>:
\s*[a-f0-9]+:\s*62 f1 7d 08 71 14 88 1f\s+vpsrlw\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 71 24 88 1f\s+vpsraw\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 71 34 88 1f\s+vpsllw\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 72 24 88 1f\s+vpsrad\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 fd 08 72 24 88 1f\s+vpsraq\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 fd 08 72 e1 1f\s+vpsraq\s+\$0x1f,%xmm1,%xmm0
\s*[a-f0-9]+:\s*62 f1 f5 08 e2 04 88\s+vpsraq\s+\(%eax,%ecx,4\),%xmm1,%xmm0
\s*[a-f0-9]+:\s*62 f1 f5 08 e2 c2\s+vpsraq\s+%xmm2,%xmm1,%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 73 1c 88 1f\s+vpsrldq\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 73 3c 88 1f\s+vpslldq\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 72 14 88 1f\s+vpsrld\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 7d 08 72 34 88 1f\s+vpslld\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 fd 08 73 14 88 1f\s+vpsrlq\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
\s*[a-f0-9]+:\s*62 f1 fd 08 73 34 88 1f\s+vpsllq\s+\$0x1f,\(%eax,%ecx,4\),%xmm0
#pass
