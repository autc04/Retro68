# name: EABI build attributes: all files with Tag_Feature_PAC=0x1 and '-z pac-plt' does generate PLT with PAC.
# source: ba-aarch64-1-pac-1.s
# source: ba-aarch64-1-pac-2.s
# as: -defsym __property_pac__=1
# ld: -shared -T bti-plt.ld -z pac-plt
# objdump: -dr -j .plt

[^:]*: *file format elf64-.*aarch64

Disassembly of section \.plt:

[0-9]+ <\.plt>:
.*:	a9bf7bf0 	stp	x16, x30, \[sp, #-16\]!
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9400e11 	ldr	x17, \[x16, #24\]
.*:	91006210 	add	x16, x16, #0x18
.*:	d61f0220 	br	x17
.*:	d503201f 	nop
.*:	d503201f 	nop
.*:	d503201f 	nop

[0-9]+ <foo_2@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401211 	ldr	x17, \[x16, #32\]
.*:	91008210 	add	x16, x16, #0x20
.*:	d503219f 	autia1716
.*:	d61f0220 	br	x17
.*:	d503201f 	nop

[0-9]+ <foo@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401611 	ldr	x17, \[x16, #40\]
.*:	9100a210 	add	x16, x16, #0x28
.*:	d503219f 	autia1716
.*:	d61f0220 	br	x17
.*:	d503201f 	nop

[0-9]+ <bar@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401a11 	ldr	x17, \[x16, #48\]
.*:	9100c210 	add	x16, x16, #0x30
.*:	d503219f 	autia1716
.*:	d61f0220 	br	x17
.*:	d503201f 	nop
