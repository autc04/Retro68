#objdump: -dw -Mintel
#name: x86_64 AMX_TRANSPOSE APX_F EVEX-Promoted insns (Intel disassembly)
#source: x86-64-amx-transpose-apx.s

.*: +file format .*

Disassembly of section \.text:

#...
[a-f0-9]+ <_intel>:
[	 ]*[a-f0-9]+:[	 ]*62 da 7c 08 6e b4 c7 23 01 00 00[	 ]+t2rpntlvwz0 tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 dd 7c 08 f8 b4 c7 23 01 00 00[	 ]+t2rpntlvwz0rs tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 dd 7c 08 f9 b4 c7 23 01 00 00[	 ]+t2rpntlvwz0rst1 tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 da 7c 08 6f b4 c7 23 01 00 00[	 ]+t2rpntlvwz0t1 tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 da 7d 08 6e b4 c7 23 01 00 00[	 ]+t2rpntlvwz1 tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 dd 7d 08 f8 b4 c7 23 01 00 00[	 ]+t2rpntlvwz1rs tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 dd 7d 08 f9 b4 c7 23 01 00 00[	 ]+t2rpntlvwz1rst1 tmm6,\[r31\+rax\*8\+0x123\]
[	 ]*[a-f0-9]+:[	 ]*62 da 7d 08 6f b4 c7 23 01 00 00[	 ]+t2rpntlvwz1t1 tmm6,\[r31\+rax\*8\+0x123\]
#pass
