#objdump: -dr --prefix-addresses --show-raw-insn
#name: whitespace parsing

# Test the whitespace parsing

.*: +file format elf32-pru

Disassembly of section .text:
0+0000 <[^>]*> 1300e2e1 	mov	r1, sp
0+0004 <[^>]*> 1300e2e1 	mov	r1, sp
0+0008 <[^>]*> 1300e2e1 	mov	r1, sp
