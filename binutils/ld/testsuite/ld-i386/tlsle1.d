#name: TLS LE with kmovd
#as: --32
#ld: -melf_i386
#objdump: -dw

.*: +file format .*

Disassembly of section \.text:

.* <_start>:
.*:	65 c4 e1 f9 90 05 04 00 00 00 	kmovd  %gs:0x4,%k0
.*:	c4 e1 f9 90 80 04 00 00 00 	kmovd  0x4\(%eax\),%k0
.*:	65 c4 e1 f9 90 05 fc ff ff ff 	kmovd  %gs:0xfffffffc,%k0
.*:	c4 e1 f9 90 80 fc ff ff ff 	kmovd  -0x4\(%eax\),%k0
#pass
