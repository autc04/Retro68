#as: -mevexwig=1
#objdump: -dw
#name: x86_64 AMX_TRANSPOSE APX_F EVEX-Promoted insns w/ -mevexwig=1
#source: x86-64-amx-transpose-apx.s

.*: +file format .*

Disassembly of section \.text:

0+ <_start>:
[	 ]*[a-f0-9]+:[	 ]*62 da 7c 08 6e b4 c7 23 01 00 00[	 ]+t2rpntlvwz0[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 dd 7c 08 f8 b4 c7 23 01 00 00[	 ]+t2rpntlvwz0rs[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 dd 7c 08 f9 b4 c7 23 01 00 00[	 ]+t2rpntlvwz0rst1[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 da 7c 08 6f b4 c7 23 01 00 00[	 ]+t2rpntlvwz0t1[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 da 7d 08 6e b4 c7 23 01 00 00[	 ]+t2rpntlvwz1[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 dd 7d 08 f8 b4 c7 23 01 00 00[	 ]+t2rpntlvwz1rs[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 dd 7d 08 f9 b4 c7 23 01 00 00[	 ]+t2rpntlvwz1rst1[	 ]+0x123\(%r31,%rax,8\),%tmm6
[	 ]*[a-f0-9]+:[	 ]*62 da 7d 08 6f b4 c7 23 01 00 00[	 ]+t2rpntlvwz1t1[	 ]+0x123\(%r31,%rax,8\),%tmm6
#pass
