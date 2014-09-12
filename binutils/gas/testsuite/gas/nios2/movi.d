#objdump: -dr --prefix-addresses --show-raw-insn
#name: NIOS2 movi

# Test implicit conversion of movi/movhi etc
.*:     file format elf32-littlenios2

Disassembly of section .text:
0+0000 <[^>]*> 00800804 	movi	r2,32
0+0004 <[^>]*> 00880034 	movhi	r2,8192
0+0008 <[^>]*> 00bffff4 	movhi	r2,65535
0+000c <[^>]*> 28bffff4 	orhi	r2,r5,65535
0+0010 <[^>]*> 50bffffc 	xorhi	r2,r10,65535
0+0014 <[^>]*> 78bfffec 	andhi	r2,r15,65535
