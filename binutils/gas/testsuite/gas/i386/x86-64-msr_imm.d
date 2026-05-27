#as:
#objdump: -dw
#name: x86_64 MSR_IMM insns
#source: x86-64-msr_imm.s

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%r12
\s*[a-f0-9]+:\s*c4 e7 7b f6 c0 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%rax
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 7f 00 00 00\s+rdmsr\s+\$0x7f,%r12
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 ff 7f 00 00\s+rdmsr\s+\$0x7fff,%r12
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 00 00 00 80\s+rdmsr\s+\$0x80000000,%r12
\s*[a-f0-9]+:\s*62 df 7f 08 f6 c0 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%r24
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 0f 0f 12 03\s+wrmsrns\s+%r12,\$0x3120f0f
\s*[a-f0-9]+:\s*c4 e7 7a f6 c0 0f 0f 12 03\s+wrmsrns\s+%rax,\$0x3120f0f
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 7f 00 00 00\s+wrmsrns\s+%r12,\$0x7f
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 ff 7f 00 00\s+wrmsrns\s+%r12,\$0x7fff
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 00 00 00 80\s+wrmsrns\s+%r12,\$0x80000000
\s*[a-f0-9]+:\s*62 df 7e 08 f6 c0 0f 0f 12 03\s+wrmsrns\s+%r24,\$0x3120f0f
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%r12
\s*[a-f0-9]+:\s*c4 e7 7b f6 c0 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%rax
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 7f 00 00 00\s+rdmsr\s+\$0x7f,%r12
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 ff 7f 00 00\s+rdmsr\s+\$0x7fff,%r12
\s*[a-f0-9]+:\s*c4 c7 7b f6 c4 00 00 00 80\s+rdmsr\s+\$0x80000000,%r12
\s*[a-f0-9]+:\s*62 df 7f 08 f6 c0 0f 0f 12 03\s+rdmsr\s+\$0x3120f0f,%r24
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 0f 0f 12 03\s+wrmsrns\s+%r12,\$0x3120f0f
\s*[a-f0-9]+:\s*c4 e7 7a f6 c0 0f 0f 12 03\s+wrmsrns\s+%rax,\$0x3120f0f
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 7f 00 00 00\s+wrmsrns\s+%r12,\$0x7f
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 ff 7f 00 00\s+wrmsrns\s+%r12,\$0x7fff
\s*[a-f0-9]+:\s*c4 c7 7a f6 c4 00 00 00 80\s+wrmsrns\s+%r12,\$0x80000000
\s*[a-f0-9]+:\s*62 df 7e 08 f6 c0 0f 0f 12 03\s+wrmsrns\s+%r24,\$0x3120f0f
#pass
