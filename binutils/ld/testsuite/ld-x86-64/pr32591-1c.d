#source: pr32591-1.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -T pr32591-1c.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text.foo:

0000000000100000 <_foo>:
  100000:	c7 c0 00 00 40 00    	mov    \$0x400000,%eax
  100006:	48 81 c0 0e 00 40 00 	add    \$0x40000e,%rax
  10000d:	48 81 c0 0d 00 40 00 	add    \$0x40000d,%rax

Disassembly of section .text:

0000000000200000 <_start>:
  200000:	c7 c0 0d 00 40 00    	mov    \$0x40000d,%eax
  200006:	48 c7 c0 0d 00 40 00 	mov    \$0x40000d,%rax
  20000d:	48 c7 c0 0d 00 40 00 	mov    \$0x40000d,%rax
  200014:	c7 c0 0d 00 40 00    	mov    \$0x40000d,%eax
