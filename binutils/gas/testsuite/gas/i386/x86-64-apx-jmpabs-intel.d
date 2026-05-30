#as:
#objdump: -dwr -Mintel
#name: x86_64 APX_F JMPABS insns (Intel disassembly)
#source: x86-64-apx-jmpabs.s

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
\s*[a-f0-9]+:\s*d5 00 a1 00 00 00 00 00 00 00 00[	 ]+jmpabs 0x0\s*[a-f0-9]+: (R_X86_64_|IMAGE_REL_AMD64_ADDR)?64	thunk
\s*[a-f0-9]+:\s*d5 00 a1 02 00 00 00 00 00 00 00[	 ]+jmpabs 0x2
\s*[a-f0-9]+:\s*d5 00 a1 21 43 65 87 00 00 00 00[	 ]+jmpabs 0x87654321
\s*[a-f0-9]+:\s*d5 00 a1 21 43 65 87 09 00 00 00[	 ]+jmpabs 0x987654321
\s*[a-f0-9]+:\s*d5 00 a1 00 00 00 00 00 00 00 00[	 ]+jmpabs 0x0\s*[a-f0-9]+: (R_X86_64_|IMAGE_REL_AMD64_ADDR)?64	thunk
\s*[a-f0-9]+:\s*d5 00 a1 78 56 34 12 00 00 00 00[	 ]+jmpabs 0x12345678
\s*[a-f0-9]+:\s*d5 00 a1 21 43 65 87 00 00 00 00[	 ]+jmpabs 0x87654321
\s*[a-f0-9]+:\s*d5 00 a1 21 43 65 87 09 00 00 00[	 ]+jmpabs 0x987654321
#pass
