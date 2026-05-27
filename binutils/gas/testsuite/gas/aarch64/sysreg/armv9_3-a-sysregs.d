#as: -march=armv9.3-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]+:\s+d538a5a0 	mrs	x0, mpambw0_el1
[^:]+:\s+d518a5a0 	msr	mpambw0_el1, x0
[^:]+:\s+d538a580 	mrs	x0, mpambw1_el1
[^:]+:\s+d518a580 	msr	mpambw1_el1, x0
[^:]+:\s+d53da580 	mrs	x0, mpambw1_el12
[^:]+:\s+d51da580 	msr	mpambw1_el12, x0
[^:]+:\s+d53ca580 	mrs	x0, mpambw2_el2
[^:]+:\s+d51ca580 	msr	mpambw2_el2, x0
[^:]+:\s+d53ea580 	mrs	x0, mpambw3_el3
[^:]+:\s+d51ea580 	msr	mpambw3_el3, x0
[^:]+:\s+d53ca5c0 	mrs	x0, mpambwcap_el2
[^:]+:\s+d51ca5c0 	msr	mpambwcap_el2, x0
[^:]+:\s+d538a4a0 	mrs	x0, mpambwidr_el1
