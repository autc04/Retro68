#source: pr32591-1.s
#as: --64 -mrelax-relocations=yes
#ld: -melf_x86_64 -T pr32591-1d.t -z max-page-size=0x1000 -z separate-code --no-rosegment
#objdump: -dw

.*: +file format .*


Disassembly of section .text.foo:

0000000000002000 <_foo>:
    2000:	c7 c0 00 10 00 80    	mov    \$0x80001000,%eax
    2006:	48 03 05 f3 1f 00 00 	add    0x1ff3\(%rip\),%rax        # 4000 <_start\+0x1000>
    200d:	48 81 c0 ff ff ff 7f 	add    \$0x7fffffff,%rax

Disassembly of section .text:

0000000000003000 <_start>:
    3000:	c7 c0 0d 10 00 80    	mov    \$0x8000100d,%eax
    3006:	48 8b 05 fb 0f 00 00 	mov    0xffb\(%rip\),%rax        # 4008 <_start\+0x1008>
    300d:	48 8b 05 f4 0f 00 00 	mov    0xff4\(%rip\),%rax        # 4008 <_start\+0x1008>
    3014:	c7 c0 0d 10 00 80    	mov    \$0x8000100d,%eax
