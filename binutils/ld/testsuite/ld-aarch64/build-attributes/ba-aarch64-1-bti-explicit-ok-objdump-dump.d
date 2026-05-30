# name: EABI build attributes: some files missing Tag_Feature_BTI, but -z force-bti generates PLT with BTI.
# source: ba-aarch64-1-bti-1.s
# source: ba-aarch64-1-void.s
# source: ba-aarch64-1-bti-via-gnu-props.s
# source: ba-aarch64-1-bti-2.s
# as: -defsym __property_bti__=1
# ld: -shared -T bti-plt.ld -z force-bti -z bti-report=warning
#warning: \A[^\n]*ba-aarch64-1-void\.o: warning: BTI is required by -z force-bti, but this input object file lacks the necessary property note\.
# objdump: -dr -j .plt

[^:]*: *file format elf64-.*aarch64

Disassembly of section \.plt:

[0-9]+ <\.plt>:
.*:	d503245f 	bti	c
.*:	a9bf7bf0 	stp	x16, x30, \[sp, #-16\]!
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9400e11 	ldr	x17, \[x16, #24\]
.*:	91006210 	add	x16, x16, #0x18
.*:	d61f0220 	br	x17
.*:	d503201f 	nop
.*:	d503201f 	nop

[0-9]+ <foo_1@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401211 	ldr	x17, \[x16, #32\]
.*:	91008210 	add	x16, x16, #0x20
.*:	d61f0220 	br	x17

[0-9]+ <foo_2@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401611 	ldr	x17, \[x16, #40\]
.*:	9100a210 	add	x16, x16, #0x28
.*:	d61f0220 	br	x17

[0-9]+ <foo@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401a11 	ldr	x17, \[x16, #48\]
.*:	9100c210 	add	x16, x16, #0x30
.*:	d61f0220 	br	x17

[0-9]+ <bar@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9401e11 	ldr	x17, \[x16, #56\]
.*:	9100e210 	add	x16, x16, #0x38
.*:	d61f0220 	br	x17

[0-9]+ <foo_3@plt>:
.*:	[[:xdigit:]]{8} 	adrp	x16, [[:xdigit:]]+ <_GLOBAL_OFFSET_TABLE_>
.*:	f9402211 	ldr	x17, \[x16, #64\]
.*:	91010210 	add	x16, x16, #0x40
.*:	d61f0220 	br	x17
