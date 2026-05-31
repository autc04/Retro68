#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	12800000 	mov	w0, #0xffffffff            	// #-1
 *[0-9a-f]+:	1280001f 	mov	wzr, #0xffffffff            	// #-1
 *[0-9a-f]+:	129fffe0 	movn	w0, #0xffff
 *[0-9a-f]+:	12a00000 	movn	w0, #0x0, lsl #16
 *[0-9a-f]+:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
 *[0-9a-f]+:	9280001f 	mov	xzr, #0xffffffffffffffff    	// #-1
 *[0-9a-f]+:	929fffe0 	mov	x0, #0xffffffffffff0000    	// #-65536
 *[0-9a-f]+:	92e00000 	movn	x0, #0x0, lsl #48
 *[0-9a-f]+:	52800000 	mov	w0, #0x0                   	// #0
 *[0-9a-f]+:	5280001f 	mov	wzr, #0x0                   	// #0
 *[0-9a-f]+:	529fffe0 	mov	w0, #0xffff                	// #65535
 *[0-9a-f]+:	52a00000 	movz	w0, #0x0, lsl #16
 *[0-9a-f]+:	d2800000 	mov	x0, #0x0                   	// #0
 *[0-9a-f]+:	d280001f 	mov	xzr, #0x0                   	// #0
 *[0-9a-f]+:	d29fffe0 	mov	x0, #0xffff                	// #65535
 *[0-9a-f]+:	d2e00000 	movz	x0, #0x0, lsl #48
 *[0-9a-f]+:	72800000 	movk	w0, #0x0
 *[0-9a-f]+:	7280001f 	movk	wzr, #0x0
 *[0-9a-f]+:	729fffe0 	movk	w0, #0xffff
 *[0-9a-f]+:	72a00000 	movk	w0, #0x0, lsl #16
 *[0-9a-f]+:	f2800000 	movk	x0, #0x0
 *[0-9a-f]+:	f280001f 	movk	xzr, #0x0
 *[0-9a-f]+:	f29fffe0 	movk	x0, #0xffff
 *[0-9a-f]+:	f2e00000 	movk	x0, #0x0, lsl #48
 *[0-9a-f]+:	52800000 	mov	w0, #0x0                   	// #0
 *[0-9a-f]+:	5280001f 	mov	wzr, #0x0                   	// #0
 *[0-9a-f]+:	529fffe0 	mov	w0, #0xffff                	// #65535
 *[0-9a-f]+:	52bfffe0 	mov	w0, #0xffff0000            	// #-65536
 *[0-9a-f]+:	12800000 	mov	w0, #0xffffffff            	// #-1
 *[0-9a-f]+:	12b00000 	mov	w0, #0x7fffffff            	// #2147483647
 *[0-9a-f]+:	d2800000 	mov	x0, #0x0                   	// #0
 *[0-9a-f]+:	d280001f 	mov	xzr, #0x0                   	// #0
 *[0-9a-f]+:	d29fffe0 	mov	x0, #0xffff                	// #65535
 *[0-9a-f]+:	d2ffffe0 	mov	x0, #0xffff000000000000    	// #-281474976710656
 *[0-9a-f]+:	92800000 	mov	x0, #0xffffffffffffffff    	// #-1
 *[0-9a-f]+:	929fffe0 	mov	x0, #0xffffffffffff0000    	// #-65536
 *[0-9a-f]+:	92ffffe0 	mov	x0, #0xffffffffffff        	// #281474976710655
