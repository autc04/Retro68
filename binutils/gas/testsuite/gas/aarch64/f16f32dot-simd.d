#as: -march=armv8-a+f16f32dot
#as: -march=armv9.7-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	0f409000 	fdot	v0\.2s, v0\.4h, v0\.2h\[0]
 *[0-9a-f]+:	0f60901f 	fdot	v31\.2s, v0\.4h, v0\.2h\[1]
 *[0-9a-f]+:	0f409be0 	fdot	v0\.2s, v31\.4h, v0\.2h\[2]
 *[0-9a-f]+:	0f7f9800 	fdot	v0\.2s, v0\.4h, v31\.2h\[3]
 *[0-9a-f]+:	4f409000 	fdot	v0\.4s, v0\.8h, v0\.2h\[0]
 *[0-9a-f]+:	4f60901f 	fdot	v31\.4s, v0\.8h, v0\.2h\[1]
 *[0-9a-f]+:	4f409be0 	fdot	v0\.4s, v31\.8h, v0\.2h\[2]
 *[0-9a-f]+:	4f7f9800 	fdot	v0\.4s, v0\.8h, v31\.2h\[3]
 *[0-9a-f]+:	0e80fc00 	fdot	v0\.2s, v0\.4h, v0\.4h
 *[0-9a-f]+:	0e80fc1f 	fdot	v31\.2s, v0\.4h, v0\.4h
 *[0-9a-f]+:	0e80ffe0 	fdot	v0\.2s, v31\.4h, v0\.4h
 *[0-9a-f]+:	0e9ffc00 	fdot	v0\.2s, v0\.4h, v31\.4h
 *[0-9a-f]+:	4e80fc00 	fdot	v0\.4s, v0\.8h, v0\.8h
 *[0-9a-f]+:	4e80fc1f 	fdot	v31\.4s, v0\.8h, v0\.8h
 *[0-9a-f]+:	4e80ffe0 	fdot	v0\.4s, v31\.8h, v0\.8h
 *[0-9a-f]+:	4e9ffc00 	fdot	v0\.4s, v0\.8h, v31\.8h
