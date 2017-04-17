#as: -march=armv8.3-a
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <.*>:
[^:]+:	6ec3c441 	fcmla	v1.2d, v2.2d, v3.2d, #0
[^:]+:	6ec3cc41 	fcmla	v1.2d, v2.2d, v3.2d, #90
[^:]+:	6ec3d441 	fcmla	v1.2d, v2.2d, v3.2d, #180
[^:]+:	6ec3dc41 	fcmla	v1.2d, v2.2d, v3.2d, #270
[^:]+:	2e83cc41 	fcmla	v1.2s, v2.2s, v3.2s, #90
[^:]+:	6e83cc41 	fcmla	v1.4s, v2.4s, v3.4s, #90
[^:]+:	2e43cc41 	fcmla	v1.4h, v2.4h, v3.4h, #90
[^:]+:	6e43cc41 	fcmla	v1.8h, v2.8h, v3.8h, #90
[^:]+:	6f831041 	fcmla	v1.4s, v2.4s, v3.s\[0\], #0
[^:]+:	6f833041 	fcmla	v1.4s, v2.4s, v3.s\[0\], #90
[^:]+:	6f835041 	fcmla	v1.4s, v2.4s, v3.s\[0\], #180
[^:]+:	6f837041 	fcmla	v1.4s, v2.4s, v3.s\[0\], #270
[^:]+:	6f833841 	fcmla	v1.4s, v2.4s, v3.s\[1\], #90
[^:]+:	2f433041 	fcmla	v1.4h, v2.4h, v3.h\[0\], #90
[^:]+:	2f633041 	fcmla	v1.4h, v2.4h, v3.h\[1\], #90
[^:]+:	6f433041 	fcmla	v1.8h, v2.8h, v3.h\[0\], #90
[^:]+:	6f633041 	fcmla	v1.8h, v2.8h, v3.h\[1\], #90
[^:]+:	6f433841 	fcmla	v1.8h, v2.8h, v3.h\[2\], #90
[^:]+:	6f633841 	fcmla	v1.8h, v2.8h, v3.h\[3\], #90
[^:]+:	6ec3e441 	fcadd	v1.2d, v2.2d, v3.2d, #90
[^:]+:	6ec3f441 	fcadd	v1.2d, v2.2d, v3.2d, #270
[^:]+:	2e83e441 	fcadd	v1.2s, v2.2s, v3.2s, #90
[^:]+:	6e83e441 	fcadd	v1.4s, v2.4s, v3.4s, #90
[^:]+:	2e43e441 	fcadd	v1.4h, v2.4h, v3.4h, #90
[^:]+:	6e43e441 	fcadd	v1.8h, v2.8h, v3.8h, #90
