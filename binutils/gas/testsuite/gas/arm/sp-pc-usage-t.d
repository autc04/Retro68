# name: SP and PC registers special uses test.
# objdump: -d --prefix-addresses --show-raw-insn

.*: +file format .*arm.*

Disassembly of section .text:
00000000 <foo> 4685      	mov	sp, r0
00000002 <foo\+0x2> 4668      	mov	r0, sp
00000004 <foo\+0x4> b000      	add	sp, #0
00000006 <foo\+0x6> f20d 0d00 	addw	sp, sp, #0
0000000a <foo\+0xa> b080      	sub	sp, #0
0000000c <foo\+0xc> f2ad 0d00 	subw	sp, sp, #0
00000010 <foo\+0x10> 4485      	add	sp, r0
00000012 <foo\+0x12> eb0d 0d40 	add.w	sp, sp, r0, lsl #1
00000016 <foo\+0x16> ebad 0d00 	sub.w	sp, sp, r0
0000001a <foo\+0x1a> ebad 0d40 	sub.w	sp, sp, r0, lsl #1
0000001e <foo\+0x1e> 9800      	ldr	r0, \[sp, #0\]
00000020 <foo\+0x20> 4800      	ldr	r0, \[pc, #0\]	; \(00000024 <foo\+0x24>\)
00000022 <foo\+0x22> f8d0 f000 	ldr.w	pc, \[r0\]
00000026 <foo\+0x26> f8d0 d000 	ldr.w	sp, \[r0\]
0000002a <foo\+0x2a> f8df f000 	ldr.w	pc, \[pc\]	; 0000002c <foo\+0x2c>
0000002e <foo\+0x2e> f8dd d000 	ldr.w	sp, \[sp\]
00000032 <foo\+0x32> f8dd f000 	ldr.w	pc, \[sp\]
00000036 <foo\+0x36> f8df d000 	ldr.w	sp, \[pc\]	; 00000038 <foo\+0x38>
0000003a <foo\+0x3a> f850 d00f 	ldr.w	sp, \[r0, pc\]
0000003e <foo\+0x3e> 9000      	str	r0, \[sp, #0\]
00000040 <foo\+0x40> f8cf 0000 	str.w	r0, \[pc\]	; 00000044 <foo\+0x44>
00000044 <foo\+0x44> f8c0 f000 	str.w	pc, \[r0\]
00000048 <foo\+0x48> f8c0 d000 	str.w	sp, \[r0\]
0000004c <foo\+0x4c> f8cf f000 	str.w	pc, \[pc\]	; 00000050 <foo\+0x50>
00000050 <foo\+0x50> f8cd d000 	str.w	sp, \[sp\]
00000054 <foo\+0x54> f8cd f000 	str.w	pc, \[sp\]
00000058 <foo\+0x58> f8cf d000 	str.w	sp, \[pc\]	; 0000005c <foo\+0x5c>
0000005c <foo\+0x5c> f840 d00f 	str.w	sp, \[r0, pc\]
00000060 <foo\+0x60> 4468      	add	r0, sp
00000062 <foo\+0x62> eb1d 0000 	adds.w	r0, sp, r0
00000066 <foo\+0x66> eb0d 0040 	add.w	r0, sp, r0, lsl #1
0000006a <foo\+0x6a> eb1d 0040 	adds.w	r0, sp, r0, lsl #1
0000006e <foo\+0x6e> f11d 0f00 	cmn.w	sp, #0
00000072 <foo\+0x72> eb1d 0f00 	cmn.w	sp, r0
00000076 <foo\+0x76> eb1d 0f40 	cmn.w	sp, r0, lsl #1
0000007a <foo\+0x7a> f1bd 0f00 	cmp.w	sp, #0
0000007e <foo\+0x7e> 4585      	cmp	sp, r0
00000080 <foo\+0x80> ebbd 0f40 	cmp.w	sp, r0, lsl #1
00000084 <foo\+0x84> b080      	sub	sp, #0
00000086 <foo\+0x86> f1bd 0d00 	subs.w	sp, sp, #0
0000008a <foo\+0x8a> f1ad 0000 	sub.w	r0, sp, #0
0000008e <foo\+0x8e> f1bd 0000 	subs.w	r0, sp, #0
00000092 <foo\+0x92> b001      	add	sp, #4
00000094 <foo\+0x94> a801      	add	r0, sp, #4
00000096 <foo\+0x96> f11d 0d04 	adds.w	sp, sp, #4
0000009a <foo\+0x9a> f11d 0004 	adds.w	r0, sp, #4
0000009e <foo\+0x9e> f20d 0004 	addw	r0, sp, #4
000000a2 <foo\+0xa2> b001      	add	sp, #4
000000a4 <foo\+0xa4> f11d 0d04 	adds.w	sp, sp, #4
000000a8 <foo\+0xa8> f20d 0d04 	addw	sp, sp, #4
000000ac <foo\+0xac> 4485      	add	sp, r0
000000ae <foo\+0xae> 4468      	add	r0, sp
000000b0 <foo\+0xb0> eb0d 0040 	add.w	r0, sp, r0, lsl #1
000000b4 <foo\+0xb4> eb1d 0d00 	adds.w	sp, sp, r0
000000b8 <foo\+0xb8> eb1d 0000 	adds.w	r0, sp, r0
000000bc <foo\+0xbc> eb1d 0040 	adds.w	r0, sp, r0, lsl #1
000000c0 <foo\+0xc0> 4485      	add	sp, r0
000000c2 <foo\+0xc2> eb0d 0d40 	add.w	sp, sp, r0, lsl #1
000000c6 <foo\+0xc6> eb1d 0d00 	adds.w	sp, sp, r0
000000ca <foo\+0xca> eb1d 0d40 	adds.w	sp, sp, r0, lsl #1
000000ce <foo\+0xce> 44ed      	add	sp, sp
000000d0 <foo\+0xd0> f1ad 0000 	sub.w	r0, sp, #0
000000d4 <foo\+0xd4> f1bd 0000 	subs.w	r0, sp, #0
000000d8 <foo\+0xd8> f2ad 0000 	subw	r0, sp, #0
000000dc <foo\+0xdc> b080      	sub	sp, #0
000000de <foo\+0xde> f1bd 0d00 	subs.w	sp, sp, #0
000000e2 <foo\+0xe2> f2ad 0d00 	subw	sp, sp, #0
000000e6 <foo\+0xe6> b080      	sub	sp, #0
000000e8 <foo\+0xe8> f1bd 0d00 	subs.w	sp, sp, #0
000000ec <foo\+0xec> ebad 0040 	sub.w	r0, sp, r0, lsl #1
000000f0 <foo\+0xf0> ebbd 0040 	subs.w	r0, sp, r0, lsl #1
000000f4 <foo\+0xf4> ebad 0d40 	sub.w	sp, sp, r0, lsl #1
000000f8 <foo\+0xf8> ebbd 0d40 	subs.w	sp, sp, r0, lsl #1
000000fc <foo\+0xfc> a001      	add	r0, pc, #4	; \(adr r0, 00000104 <foo\+0x104>\)
000000fe <foo\+0xfe> f2af 0004 	subw	r0, pc, #4
00000102 <foo\+0x102> f20f 0004 	addw	r0, pc, #4
00000106 <foo\+0x106> f2af 0004 	subw	r0, pc, #4
0000010a <foo\+0x10a> f20f 0004 	addw	r0, pc, #4
0000010e <foo\+0x10e> f2af 0004 	subw	r0, pc, #4
00000112 <foo\+0x112> bf00[ 	]+nop
00000114 <foo\+0x114> bf00[ 	]+nop
00000116 <foo\+0x116> bf00[ 	]+nop
