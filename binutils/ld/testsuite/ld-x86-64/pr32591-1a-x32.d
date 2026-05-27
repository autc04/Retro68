#source: pr32591-1.s
#as: --x32 -mrelax-relocations=yes
#ld: -melf32_x86_64 -T pr32591-1a.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text.foo:

00100000 <_foo>:
  100000:	c7 c0 00 00 20 80    	mov    \$0x80200000,%eax
  100006:	48 03 05 f3 ff 1f 00 	add    0x1ffff3\(%rip\),%rax        # 300000 <_start\+0x100000>
  10000d:	48 81 c0 ff ff ff 7f 	add    \$0x7fffffff,%rax

Disassembly of section .text:

00200000 <_start>:
  200000:	c7 c0 0d 00 20 80    	mov    \$0x8020000d,%eax
  200006:	40 c7 c0 0d 00 20 80 	rex mov \$0x8020000d,%eax
  20000d:	40 c7 c0 0d 00 20 80 	rex mov \$0x8020000d,%eax
  200014:	c7 c0 0d 00 20 80    	mov    \$0x8020000d,%eax
