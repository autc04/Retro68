#name: No '-z force-bti' nor '-z pac-plt' with no feature properties does not generate a BTI & PAC PLT (shared)
#source: bti-pac-plt.s
#target: [check_shared_lib_support]
#as: -mabi=lp64
#ld: -shared -T bti-plt.ld
#objdump: -dr -j .plt

[^:]*: *file format elf64-.*aarch64

Disassembly of section \.plt:

[0-9a-f]+ <\.plt>:
.*:	a9bf7bf0 	stp	x16, x30, \[sp, #-16\]!
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9400e11 	ldr	x17, \[x16, #24\]
.*:	91006210 	add	x16, x16, #0x18
.*:	d61f0220 	br	x17
.*:	d503201f 	nop
.*:	d503201f 	nop
.*:	d503201f 	nop

[0-9a-f]+ <.*>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401211 	ldr	x17, \[x16, #32\]
.*:	91008210 	add	x16, x16, #0x20
.*:	d61f0220 	br	x17

[0-9a-f]+ <.*>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401611 	ldr	x17, \[x16, #40\]
.*:	9100a210 	add	x16, x16, #0x28
.*:	d61f0220 	br	x17
