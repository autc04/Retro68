#source: pr32591-1.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -T pr32591-1a.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text.foo:

0000000000100000 <_foo>:
  100000:	c7 c0 00 00 20 80    	mov    \$0x80200000,%eax
  100006:	48 03 05 f3 ff 1f 00 	add    0x1ffff3\(%rip\),%rax        # 300000 <_start\+0x100000>
  10000d:	48 81 c0 ff ff ff 7f 	add    \$0x7fffffff,%rax

Disassembly of section .text:

0000000000200000 <_start>:
  200000:	c7 c0 0d 00 20 80    	mov    \$0x8020000d,%eax
  200006:	48 8b 05 fb ff 0f 00 	mov    0xffffb\(%rip\),%rax        # 300008 <_start\+0x100008>
  20000d:	48 8b 05 f4 ff 0f 00 	mov    0xffff4\(%rip\),%rax        # 300008 <_start\+0x100008>
  200014:	c7 c0 0d 00 20 80    	mov    \$0x8020000d,%eax
