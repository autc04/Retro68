#objdump: -dr

dump\.o:     file format .*


Disassembly of section \.text:

00000000 <\.text>:
   0:	81 00                         	mov\.b	r0, 4\[r0\]
   2:	81 70                         	mov\.b	r0, 4\[r7\]
   4:	87 00                         	mov\.b	r0, 28\[r0\]
   6:	87 70                         	mov\.b	r0, 28\[r7\]
   8:	81 07                         	mov\.b	r7, 4\[r0\]
   a:	81 77                         	mov\.b	r7, 4\[r7\]
   c:	87 07                         	mov\.b	r7, 28\[r0\]
   e:	87 77                         	mov\.b	r7, 28\[r7\]
  10:	90 80                         	mov\.w	r0, 4\[r0\]
  12:	90 f0                         	mov\.w	r0, 4\[r7\]
  14:	93 80                         	mov\.w	r0, 28\[r0\]
  16:	93 f0                         	mov\.w	r0, 28\[r7\]
  18:	90 87                         	mov\.w	r7, 4\[r0\]
  1a:	90 f7                         	mov\.w	r7, 4\[r7\]
  1c:	93 87                         	mov\.w	r7, 28\[r0\]
  1e:	93 f7                         	mov\.w	r7, 28\[r7\]
  20:	a0 08                         	mov\.l	r0, 4\[r0\]
  22:	a0 78                         	mov\.l	r0, 4\[r7\]
  24:	a1 88                         	mov\.l	r0, 28\[r0\]
  26:	a1 f8                         	mov\.l	r0, 28\[r7\]
  28:	a0 0f                         	mov\.l	r7, 4\[r0\]
  2a:	a0 7f                         	mov\.l	r7, 4\[r7\]
  2c:	a1 8f                         	mov\.l	r7, 28\[r0\]
  2e:	a1 ff                         	mov\.l	r7, 28\[r7\]
  30:	89 00                         	mov\.b	4\[r0\], r0
  32:	89 07                         	mov\.b	4\[r0\], r7
  34:	89 70                         	mov\.b	4\[r7\], r0
  36:	89 77                         	mov\.b	4\[r7\], r7
  38:	8f 00                         	mov\.b	28\[r0\], r0
  3a:	8f 07                         	mov\.b	28\[r0\], r7
  3c:	8f 70                         	mov\.b	28\[r7\], r0
  3e:	8f 77                         	mov\.b	28\[r7\], r7
  40:	98 80                         	mov\.w	4\[r0\], r0
  42:	98 87                         	mov\.w	4\[r0\], r7
  44:	98 f0                         	mov\.w	4\[r7\], r0
  46:	98 f7                         	mov\.w	4\[r7\], r7
  48:	9b 80                         	mov\.w	28\[r0\], r0
  4a:	9b 87                         	mov\.w	28\[r0\], r7
  4c:	9b f0                         	mov\.w	28\[r7\], r0
  4e:	9b f7                         	mov\.w	28\[r7\], r7
  50:	a8 08                         	mov\.l	4\[r0\], r0
  52:	a8 0f                         	mov\.l	4\[r0\], r7
  54:	a8 78                         	mov\.l	4\[r7\], r0
  56:	a8 7f                         	mov\.l	4\[r7\], r7
  58:	a9 88                         	mov\.l	28\[r0\], r0
  5a:	a9 8f                         	mov\.l	28\[r0\], r7
  5c:	a9 f8                         	mov\.l	28\[r7\], r0
  5e:	a9 ff                         	mov\.l	28\[r7\], r7
  60:	66 00                         	mov\.l	#0, r0
  62:	66 0f                         	mov\.l	#0, r15
  64:	66 f0                         	mov\.l	#15, r0
  66:	66 ff                         	mov\.l	#15, r15
  68:	f9 04 04 80                   	mov\.b	#128, 4\[r0\]
  6c:	f9 74 04 80                   	mov\.b	#128, 4\[r7\]
  70:	f9 04 1c 80                   	mov\.b	#128, 28\[r0\]
  74:	f9 74 1c 80                   	mov\.b	#128, 28\[r7\]
  78:	3c 04 7f                      	mov\.b	#127, 4\[r0\]
  7b:	3c 74 7f                      	mov\.b	#127, 4\[r7\]
  7e:	3c 8c 7f                      	mov\.b	#127, 28\[r0\]
  81:	3c fc 7f                      	mov\.b	#127, 28\[r7\]
  84:	3d 02 00                      	mov\.w	#0, 4\[r0\]
  87:	3d 72 00                      	mov\.w	#0, 4\[r7\]
  8a:	3d 0e 00                      	mov\.w	#0, 28\[r0\]
  8d:	3d 7e 00                      	mov\.w	#0, 28\[r7\]
  90:	3d 02 ff                      	mov\.w	#255, 4\[r0\]
  93:	3d 72 ff                      	mov\.w	#255, 4\[r7\]
  96:	3d 0e ff                      	mov\.w	#255, 28\[r0\]
  99:	3d 7e ff                      	mov\.w	#255, 28\[r7\]
  9c:	3e 01 00                      	mov\.l	#0, 4\[r0\]
  9f:	3e 71 00                      	mov\.l	#0, 4\[r7\]
  a2:	3e 07 00                      	mov\.l	#0, 28\[r0\]
  a5:	3e 77 00                      	mov\.l	#0, 28\[r7\]
  a8:	3e 01 ff                      	mov\.l	#255, 4\[r0\]
  ab:	3e 71 ff                      	mov\.l	#255, 4\[r7\]
  ae:	3e 07 ff                      	mov\.l	#255, 28\[r0\]
  b1:	3e 77 ff                      	mov\.l	#255, 28\[r7\]
  b4:	66 00                         	mov\.l	#0, r0
  b6:	66 0f                         	mov\.l	#0, r15
  b8:	75 40 ff                      	mov\.l	#255, r0
  bb:	75 4f ff                      	mov\.l	#255, r15
  be:	fb 06 80                      	mov\.l	#-128, r0
  c1:	fb f6 80                      	mov\.l	#-128, r15
  c4:	75 40 7f                      	mov\.l	#127, r0
  c7:	75 4f 7f                      	mov\.l	#127, r15
  ca:	fb 0a 00 80                   	mov\.l	#0xffff8000, r0
  ce:	fb fa 00 80                   	mov\.l	#0xffff8000, r15
  d2:	fb 0e 00 80 00                	mov\.l	#0x8000, r0
  d7:	fb fe 00 80 00                	mov\.l	#0x8000, r15
  dc:	fb 0e 00 00 80                	mov\.l	#0xff800000, r0
  e1:	fb fe 00 00 80                	mov\.l	#0xff800000, r15
  e6:	fb 0e ff ff 7f                	mov\.l	#0x7fffff, r0
  eb:	fb fe ff ff 7f                	mov\.l	#0x7fffff, r15
  f0:	fb 02 00 00 00 80             	mov\.l	#0x80000000, r0
  f6:	fb f2 00 00 00 80             	mov\.l	#0x80000000, r15
  fc:	fb 02 ff ff ff 7f             	mov\.l	#0x7fffffff, r0
 102:	fb f2 ff ff ff 7f             	mov\.l	#0x7fffffff, r15
 108:	cf 10                         	mov\.b	r1, r0
 10a:	cf 1f                         	mov\.b	r1, r15
 10c:	cf f0                         	mov\.b	r15, r0
 10e:	cf ff                         	mov\.b	r15, r15
 110:	df 10                         	mov\.w	r1, r0
 112:	df 1f                         	mov\.w	r1, r15
 114:	df f0                         	mov\.w	r15, r0
 116:	df ff                         	mov\.w	r15, r15
 118:	ef 10                         	mov\.l	r1, r0
 11a:	ef 1f                         	mov\.l	r1, r15
 11c:	ef f0                         	mov\.l	r15, r0
 11e:	ef ff                         	mov\.l	r15, r15
 120:	3c 00 00                      	mov\.b	#0, \[r0\]
 123:	f8 f4 00                      	mov\.b	#0, \[r15\]
 126:	f9 04 fc 00                   	mov\.b	#0, 252\[r0\]
 12a:	f9 f4 fc 00                   	mov\.b	#0, 252\[r15\]
 12e:	fa 04 fc ff 00                	mov\.b	#0, 65532\[r0\]
 133:	fa f4 fc ff 00                	mov\.b	#0, 65532\[r15\]
 138:	3c 00 ff                      	mov\.b	#255, \[r0\]
 13b:	f8 f4 ff                      	mov\.b	#255, \[r15\]
 13e:	f9 04 fc ff                   	mov\.b	#255, 252\[r0\]
 142:	f9 f4 fc ff                   	mov\.b	#255, 252\[r15\]
 146:	fa 04 fc ff ff                	mov\.b	#255, 65532\[r0\]
 14b:	fa f4 fc ff ff                	mov\.b	#255, 65532\[r15\]
 150:	f8 05 80                      	mov\.w	#-128, \[r0\]
 153:	f8 f5 80                      	mov\.w	#-128, \[r15\]
 156:	f9 05 7e 80                   	mov\.w	#-128, 252\[r0\]
 15a:	f9 f5 7e 80                   	mov\.w	#-128, 252\[r15\]
 15e:	fa 05 fe 7f 80                	mov\.w	#-128, 65532\[r0\]
 163:	fa f5 fe 7f 80                	mov\.w	#-128, 65532\[r15\]
 168:	3d 00 7f                      	mov\.w	#127, \[r0\]
 16b:	f8 f5 7f                      	mov\.w	#127, \[r15\]
 16e:	f9 05 7e 7f                   	mov\.w	#127, 252\[r0\]
 172:	f9 f5 7e 7f                   	mov\.w	#127, 252\[r15\]
 176:	fa 05 fe 7f 7f                	mov\.w	#127, 65532\[r0\]
 17b:	fa f5 fe 7f 7f                	mov\.w	#127, 65532\[r15\]
 180:	3d 00 00                      	mov\.w	#0, \[r0\]
 183:	f8 f5 00                      	mov\.w	#0, \[r15\]
 186:	f9 05 7e 00                   	mov\.w	#0, 252\[r0\]
 18a:	f9 f5 7e 00                   	mov\.w	#0, 252\[r15\]
 18e:	fa 05 fe 7f 00                	mov\.w	#0, 65532\[r0\]
 193:	fa f5 fe 7f 00                	mov\.w	#0, 65532\[r15\]
 198:	f8 05 ff                      	mov.w	#-1, \[r0\]
 19b:	f8 f5 ff                      	mov.w	#-1, \[r15\]
 19e:	f9 05 7e ff                   	mov.w	#-1, 252\[r0\]
 1a2:	f9 f5 7e ff                   	mov.w	#-1, 252\[r15\]
 1a6:	fa 05 fe 7f ff                	mov.w	#-1, 65532\[r0\]
 1ab:	fa f5 fe 7f ff                	mov.w	#-1, 65532\[r15\]
 1b0:	f8 06 80                      	mov.l	#-128, \[r0\]
 1b3:	f8 f6 80                      	mov.l	#-128, \[r15\]
 1b6:	f9 06 3f 80                   	mov.l	#-128, 252\[r0\]
 1ba:	f9 f6 3f 80                   	mov.l	#-128, 252\[r15\]
 1be:	fa 06 ff 3f 80                	mov.l	#-128, 65532\[r0\]
 1c3:	fa f6 ff 3f 80                	mov.l	#-128, 65532\[r15\]
 1c8:	3e 00 7f                      	mov.l	#127, \[r0\]
 1cb:	f8 f6 7f                      	mov.l	#127, \[r15\]
 1ce:	f9 06 3f 7f                   	mov.l	#127, 252\[r0\]
 1d2:	f9 f6 3f 7f                   	mov.l	#127, 252\[r15\]
 1d6:	fa 06 ff 3f 7f                	mov.l	#127, 65532\[r0\]
 1db:	fa f6 ff 3f 7f                	mov.l	#127, 65532\[r15\]
 1e0:	f8 0a 00 80                   	mov.l	#0xffff8000, \[r0\]
 1e4:	f8 fa 00 80                   	mov.l	#0xffff8000, \[r15\]
 1e8:	f9 0a 3f 00 80                	mov.l	#0xffff8000, 252\[r0\]
 1ed:	f9 fa 3f 00 80                	mov.l	#0xffff8000, 252\[r15\]
 1f2:	fa 0a ff 3f 00 80             	mov.l	#0xffff8000, 65532\[r0\]
 1f8:	fa fa ff 3f 00 80             	mov.l	#0xffff8000, 65532\[r15\]
 1fe:	f8 0e 00 80 00                	mov.l	#0x8000, \[r0\]
 203:	f8 fe 00 80 00                	mov.l	#0x8000, \[r15\]
 208:	f9 0e 3f 00 80 00             	mov.l	#0x8000, 252\[r0\]
 20e:	f9 fe 3f 00 80 00             	mov.l	#0x8000, 252\[r15\]
 214:	fa 0e ff 3f 00 80 00          	mov.l	#0x8000, 65532\[r0\]
 21b:	fa fe ff 3f 00 80 00          	mov.l	#0x8000, 65532\[r15\]
 222:	f8 0e 00 00 80                	mov.l	#0xff800000, \[r0\]
 227:	f8 fe 00 00 80                	mov.l	#0xff800000, \[r15\]
 22c:	f9 0e 3f 00 00 80             	mov.l	#0xff800000, 252\[r0\]
 232:	f9 fe 3f 00 00 80             	mov.l	#0xff800000, 252\[r15\]
 238:	fa 0e ff 3f 00 00 80          	mov.l	#0xff800000, 65532\[r0\]
 23f:	fa fe ff 3f 00 00 80          	mov.l	#0xff800000, 65532\[r15\]
 246:	f8 0e ff ff 7f                	mov.l	#0x7fffff, \[r0\]
 24b:	f8 fe ff ff 7f                	mov.l	#0x7fffff, \[r15\]
 250:	f9 0e 3f ff ff 7f             	mov.l	#0x7fffff, 252\[r0\]
 256:	f9 fe 3f ff ff 7f             	mov.l	#0x7fffff, 252\[r15\]
 25c:	fa 0e ff 3f ff ff 7f          	mov.l	#0x7fffff, 65532\[r0\]
 263:	fa fe ff 3f ff ff 7f          	mov.l	#0x7fffff, 65532\[r15\]
 26a:	f8 02 00 00 00 80             	mov.l	#0x80000000, \[r0\]
 270:	f8 f2 00 00 00 80             	mov.l	#0x80000000, \[r15\]
 276:	f9 02 3f 00 00 00 80          	mov.l	#0x80000000, 252\[r0\]
 27d:	f9 f2 3f 00 00 00 80          	mov.l	#0x80000000, 252\[r15\]
 284:	fa 02 ff 3f 00 00 00 80       	mov.l	#0x80000000, 65532\[r0\]
 28c:	fa f2 ff 3f 00 00 00 80       	mov.l	#0x80000000, 65532\[r15\]
 294:	f8 02 ff ff ff 7f             	mov.l	#0x7fffffff, \[r0\]
 29a:	f8 f2 ff ff ff 7f             	mov.l	#0x7fffffff, \[r15\]
 2a0:	f9 02 3f ff ff ff 7f          	mov.l	#0x7fffffff, 252\[r0\]
 2a7:	f9 f2 3f ff ff ff 7f          	mov.l	#0x7fffffff, 252\[r15\]
 2ae:	fa 02 ff 3f ff ff ff 7f       	mov.l	#0x7fffffff, 65532\[r0\]
 2b6:	fa f2 ff 3f ff ff ff 7f       	mov.l	#0x7fffffff, 65532\[r15\]
 2be:	cc 00                         	mov.b	\[r0\], r0
 2c0:	cc 0f                         	mov.b	\[r0\], r15
 2c2:	cc f0                         	mov.b	\[r15\], r0
 2c4:	cc ff                         	mov.b	\[r15\], r15
 2c6:	cd 00 fc                      	mov.b	252\[r0\], r0
 2c9:	cd 0f fc                      	mov.b	252\[r0\], r15
 2cc:	cd f0 fc                      	mov.b	252\[r15\], r0
 2cf:	cd ff fc                      	mov.b	252\[r15\], r15
 2d2:	ce 00 fc ff                   	mov.b	65532\[r0\], r0
 2d6:	ce 0f fc ff                   	mov.b	65532\[r0\], r15
 2da:	ce f0 fc ff                   	mov.b	65532\[r15\], r0
 2de:	ce ff fc ff                   	mov.b	65532\[r15\], r15
 2e2:	dc 00                         	mov.w	\[r0\], r0
 2e4:	dc 0f                         	mov.w	\[r0\], r15
 2e6:	dc f0                         	mov.w	\[r15\], r0
 2e8:	dc ff                         	mov.w	\[r15\], r15
 2ea:	dd 00 7e                      	mov.w	252\[r0\], r0
 2ed:	dd 0f 7e                      	mov.w	252\[r0\], r15
 2f0:	dd f0 7e                      	mov.w	252\[r15\], r0
 2f3:	dd ff 7e                      	mov.w	252\[r15\], r15
 2f6:	de 00 fe 7f                   	mov.w	65532\[r0\], r0
 2fa:	de 0f fe 7f                   	mov.w	65532\[r0\], r15
 2fe:	de f0 fe 7f                   	mov.w	65532\[r15\], r0
 302:	de ff fe 7f                   	mov.w	65532\[r15\], r15
 306:	ec 00                         	mov.l	\[r0\], r0
 308:	ec 0f                         	mov.l	\[r0\], r15
 30a:	ec f0                         	mov.l	\[r15\], r0
 30c:	ec ff                         	mov.l	\[r15\], r15
 30e:	ed 00 3f                      	mov.l	252\[r0\], r0
 311:	ed 0f 3f                      	mov.l	252\[r0\], r15
 314:	ed f0 3f                      	mov.l	252\[r15\], r0
 317:	ed ff 3f                      	mov.l	252\[r15\], r15
 31a:	ee 00 ff 3f                   	mov.l	65532\[r0\], r0
 31e:	ee 0f ff 3f                   	mov.l	65532\[r0\], r15
 322:	ee f0 ff 3f                   	mov.l	65532\[r15\], r0
 326:	ee ff ff 3f                   	mov.l	65532\[r15\], r15
 32a:	fe 40 00                      	mov.b	\[r0, r0\], r0
 32d:	fe 40 0f                      	mov.b	\[r0, r0\], r15
 330:	fe 40 f0                      	mov.b	\[r0, r15\], r0
 333:	fe 40 ff                      	mov.b	\[r0, r15\], r15
 336:	fe 4f 00                      	mov.b	\[r15, r0\], r0
 339:	fe 4f 0f                      	mov.b	\[r15, r0\], r15
 33c:	fe 4f f0                      	mov.b	\[r15, r15\], r0
 33f:	fe 4f ff                      	mov.b	\[r15, r15\], r15
 342:	fe 50 00                      	mov.w	\[r0, r0\], r0
 345:	fe 50 0f                      	mov.w	\[r0, r0\], r15
 348:	fe 50 f0                      	mov.w	\[r0, r15\], r0
 34b:	fe 50 ff                      	mov.w	\[r0, r15\], r15
 34e:	fe 5f 00                      	mov.w	\[r15, r0\], r0
 351:	fe 5f 0f                      	mov.w	\[r15, r0\], r15
 354:	fe 5f f0                      	mov.w	\[r15, r15\], r0
 357:	fe 5f ff                      	mov.w	\[r15, r15\], r15
 35a:	fe 60 00                      	mov.l	\[r0, r0\], r0
 35d:	fe 60 0f                      	mov.l	\[r0, r0\], r15
 360:	fe 60 f0                      	mov.l	\[r0, r15\], r0
 363:	fe 60 ff                      	mov.l	\[r0, r15\], r15
 366:	fe 6f 00                      	mov.l	\[r15, r0\], r0
 369:	fe 6f 0f                      	mov.l	\[r15, r0\], r15
 36c:	fe 6f f0                      	mov.l	\[r15, r15\], r0
 36f:	fe 6f ff                      	mov.l	\[r15, r15\], r15
 372:	c3 01                         	mov.b	r1, \[r0\]
 374:	c3 f1                         	mov.b	r1, \[r15\]
 376:	c7 01 fc                      	mov.b	r1, 252\[r0\]
 379:	c7 f1 fc                      	mov.b	r1, 252\[r15\]
 37c:	cb 01 fc ff                   	mov.b	r1, 65532\[r0\]
 380:	cb f1 fc ff                   	mov.b	r1, 65532\[r15\]
 384:	c3 0f                         	mov.b	r15, \[r0\]
 386:	c3 ff                         	mov.b	r15, \[r15\]
 388:	c7 0f fc                      	mov.b	r15, 252\[r0\]
 38b:	c7 ff fc                      	mov.b	r15, 252\[r15\]
 38e:	cb 0f fc ff                   	mov.b	r15, 65532\[r0\]
 392:	cb ff fc ff                   	mov.b	r15, 65532\[r15\]
 396:	d3 01                         	mov.w	r1, \[r0\]
 398:	d3 f1                         	mov.w	r1, \[r15\]
 39a:	d7 01 7e                      	mov.w	r1, 252\[r0\]
 39d:	d7 f1 7e                      	mov.w	r1, 252\[r15\]
 3a0:	db 01 fe 7f                   	mov.w	r1, 65532\[r0\]
 3a4:	db f1 fe 7f                   	mov.w	r1, 65532\[r15\]
 3a8:	d3 0f                         	mov.w	r15, \[r0\]
 3aa:	d3 ff                         	mov.w	r15, \[r15\]
 3ac:	d7 0f 7e                      	mov.w	r15, 252\[r0\]
 3af:	d7 ff 7e                      	mov.w	r15, 252\[r15\]
 3b2:	db 0f fe 7f                   	mov.w	r15, 65532\[r0\]
 3b6:	db ff fe 7f                   	mov.w	r15, 65532\[r15\]
 3ba:	e3 01                         	mov.l	r1, \[r0\]
 3bc:	e3 f1                         	mov.l	r1, \[r15\]
 3be:	e7 01 3f                      	mov.l	r1, 252\[r0\]
 3c1:	e7 f1 3f                      	mov.l	r1, 252\[r15\]
 3c4:	eb 01 ff 3f                   	mov.l	r1, 65532\[r0\]
 3c8:	eb f1 ff 3f                   	mov.l	r1, 65532\[r15\]
 3cc:	e3 0f                         	mov.l	r15, \[r0\]
 3ce:	e3 ff                         	mov.l	r15, \[r15\]
 3d0:	e7 0f 3f                      	mov.l	r15, 252\[r0\]
 3d3:	e7 ff 3f                      	mov.l	r15, 252\[r15\]
 3d6:	eb 0f ff 3f                   	mov.l	r15, 65532\[r0\]
 3da:	eb ff ff 3f                   	mov.l	r15, 65532\[r15\]
 3de:	fe 00 00                      	mov.b	r0, \[r0, r0\]
 3e1:	fe 00 f0                      	mov.b	r0, \[r0, r15\]
 3e4:	fe 0f 00                      	mov.b	r0, \[r15, r0\]
 3e7:	fe 0f f0                      	mov.b	r0, \[r15, r15\]
 3ea:	fe 00 0f                      	mov.b	r15, \[r0, r0\]
 3ed:	fe 00 ff                      	mov.b	r15, \[r0, r15\]
 3f0:	fe 0f 0f                      	mov.b	r15, \[r15, r0\]
 3f3:	fe 0f ff                      	mov.b	r15, \[r15, r15\]
 3f6:	fe 10 00                      	mov.w	r0, \[r0, r0\]
 3f9:	fe 10 f0                      	mov.w	r0, \[r0, r15\]
 3fc:	fe 1f 00                      	mov.w	r0, \[r15, r0\]
 3ff:	fe 1f f0                      	mov.w	r0, \[r15, r15\]
 402:	fe 10 0f                      	mov.w	r15, \[r0, r0\]
 405:	fe 10 ff                      	mov.w	r15, \[r0, r15\]
 408:	fe 1f 0f                      	mov.w	r15, \[r15, r0\]
 40b:	fe 1f ff                      	mov.w	r15, \[r15, r15\]
 40e:	fe 20 00                      	mov.l	r0, \[r0, r0\]
 411:	fe 20 f0                      	mov.l	r0, \[r0, r15\]
 414:	fe 2f 00                      	mov.l	r0, \[r15, r0\]
 417:	fe 2f f0                      	mov.l	r0, \[r15, r15\]
 41a:	fe 20 0f                      	mov.l	r15, \[r0, r0\]
 41d:	fe 20 ff                      	mov.l	r15, \[r0, r15\]
 420:	fe 2f 0f                      	mov.l	r15, \[r15, r0\]
 423:	fe 2f ff                      	mov.l	r15, \[r15, r15\]
 426:	c0 00                         	mov.b	\[r0\], \[r0\]
 428:	c0 0f                         	mov.b	\[r0\], \[r15\]
 42a:	c4 00 fc                      	mov.b	\[r0\], 252\[r0\]
 42d:	c4 0f fc                      	mov.b	\[r0\], 252\[r15\]
 430:	c8 00 fc ff                   	mov.b	\[r0\], 65532\[r0\]
 434:	c8 0f fc ff                   	mov.b	\[r0\], 65532\[r15\]
 438:	c0 f0                         	mov.b	\[r15\], \[r0\]
 43a:	c0 ff                         	mov.b	\[r15\], \[r15\]
 43c:	c4 f0 fc                      	mov.b	\[r15\], 252\[r0\]
 43f:	c4 ff fc                      	mov.b	\[r15\], 252\[r15\]
 442:	c8 f0 fc ff                   	mov.b	\[r15\], 65532\[r0\]
 446:	c8 ff fc ff                   	mov.b	\[r15\], 65532\[r15\]
 44a:	c1 00 fc                      	mov.b	252\[r0\], \[r0\]
 44d:	c1 0f fc                      	mov.b	252\[r0\], \[r15\]
 450:	c5 00 fc fc                   	mov.b	252\[r0\], 252\[r0\]
 454:	c5 0f fc fc                   	mov.b	252\[r0\], 252\[r15\]
 458:	c9 00 fc fc ff                	mov.b	252\[r0\], 65532\[r0\]
 45d:	c9 0f fc fc ff                	mov.b	252\[r0\], 65532\[r15\]
 462:	c1 f0 fc                      	mov.b	252\[r15\], \[r0\]
 465:	c1 ff fc                      	mov.b	252\[r15\], \[r15\]
 468:	c5 f0 fc fc                   	mov.b	252\[r15\], 252\[r0\]
 46c:	c5 ff fc fc                   	mov.b	252\[r15\], 252\[r15\]
 470:	c9 f0 fc fc ff                	mov.b	252\[r15\], 65532\[r0\]
 475:	c9 ff fc fc ff                	mov.b	252\[r15\], 65532\[r15\]
 47a:	c2 00 fc ff                   	mov.b	65532\[r0\], \[r0\]
 47e:	c2 0f fc ff                   	mov.b	65532\[r0\], \[r15\]
 482:	c6 00 fc ff fc                	mov.b	65532\[r0\], 252\[r0\]
 487:	c6 0f fc ff fc                	mov.b	65532\[r0\], 252\[r15\]
 48c:	ca 00 fc ff fc ff             	mov.b	65532\[r0\], 65532\[r0\]
 492:	ca 0f fc ff fc ff             	mov.b	65532\[r0\], 65532\[r15\]
 498:	c2 f0 fc ff                   	mov.b	65532\[r15\], \[r0\]
 49c:	c2 ff fc ff                   	mov.b	65532\[r15\], \[r15\]
 4a0:	c6 f0 fc ff fc                	mov.b	65532\[r15\], 252\[r0\]
 4a5:	c6 ff fc ff fc                	mov.b	65532\[r15\], 252\[r15\]
 4aa:	ca f0 fc ff fc ff             	mov.b	65532\[r15\], 65532\[r0\]
 4b0:	ca ff fc ff fc ff             	mov.b	65532\[r15\], 65532\[r15\]
 4b6:	d0 00                         	mov.w	\[r0\], \[r0\]
 4b8:	d0 0f                         	mov.w	\[r0\], \[r15\]
 4ba:	d4 00 7e                      	mov.w	\[r0\], 252\[r0\]
 4bd:	d4 0f 7e                      	mov.w	\[r0\], 252\[r15\]
 4c0:	d8 00 fe 7f                   	mov.w	\[r0\], 65532\[r0\]
 4c4:	d8 0f fe 7f                   	mov.w	\[r0\], 65532\[r15\]
 4c8:	d0 f0                         	mov.w	\[r15\], \[r0\]
 4ca:	d0 ff                         	mov.w	\[r15\], \[r15\]
 4cc:	d4 f0 7e                      	mov.w	\[r15\], 252\[r0\]
 4cf:	d4 ff 7e                      	mov.w	\[r15\], 252\[r15\]
 4d2:	d8 f0 fe 7f                   	mov.w	\[r15\], 65532\[r0\]
 4d6:	d8 ff fe 7f                   	mov.w	\[r15\], 65532\[r15\]
 4da:	d1 00 7e                      	mov.w	252\[r0\], \[r0\]
 4dd:	d1 0f 7e                      	mov.w	252\[r0\], \[r15\]
 4e0:	d5 00 7e 7e                   	mov.w	252\[r0\], 252\[r0\]
 4e4:	d5 0f 7e 7e                   	mov.w	252\[r0\], 252\[r15\]
 4e8:	d9 00 7e fe 7f                	mov.w	252\[r0\], 65532\[r0\]
 4ed:	d9 0f 7e fe 7f                	mov.w	252\[r0\], 65532\[r15\]
 4f2:	d1 f0 7e                      	mov.w	252\[r15\], \[r0\]
 4f5:	d1 ff 7e                      	mov.w	252\[r15\], \[r15\]
 4f8:	d5 f0 7e 7e                   	mov.w	252\[r15\], 252\[r0\]
 4fc:	d5 ff 7e 7e                   	mov.w	252\[r15\], 252\[r15\]
 500:	d9 f0 7e fe 7f                	mov.w	252\[r15\], 65532\[r0\]
 505:	d9 ff 7e fe 7f                	mov.w	252\[r15\], 65532\[r15\]
 50a:	d2 00 fe 7f                   	mov.w	65532\[r0\], \[r0\]
 50e:	d2 0f fe 7f                   	mov.w	65532\[r0\], \[r15\]
 512:	d6 00 fe 7f 7e                	mov.w	65532\[r0\], 252\[r0\]
 517:	d6 0f fe 7f 7e                	mov.w	65532\[r0\], 252\[r15\]
 51c:	da 00 fe 7f fe 7f             	mov.w	65532\[r0\], 65532\[r0\]
 522:	da 0f fe 7f fe 7f             	mov.w	65532\[r0\], 65532\[r15\]
 528:	d2 f0 fe 7f                   	mov.w	65532\[r15\], \[r0\]
 52c:	d2 ff fe 7f                   	mov.w	65532\[r15\], \[r15\]
 530:	d6 f0 fe 7f 7e                	mov.w	65532\[r15\], 252\[r0\]
 535:	d6 ff fe 7f 7e                	mov.w	65532\[r15\], 252\[r15\]
 53a:	da f0 fe 7f fe 7f             	mov.w	65532\[r15\], 65532\[r0\]
 540:	da ff fe 7f fe 7f             	mov.w	65532\[r15\], 65532\[r15\]
 546:	e0 00                         	mov.l	\[r0\], \[r0\]
 548:	e0 0f                         	mov.l	\[r0\], \[r15\]
 54a:	e4 00 3f                      	mov.l	\[r0\], 252\[r0\]
 54d:	e4 0f 3f                      	mov.l	\[r0\], 252\[r15\]
 550:	e8 00 ff 3f                   	mov.l	\[r0\], 65532\[r0\]
 554:	e8 0f ff 3f                   	mov.l	\[r0\], 65532\[r15\]
 558:	e0 f0                         	mov.l	\[r15\], \[r0\]
 55a:	e0 ff                         	mov.l	\[r15\], \[r15\]
 55c:	e4 f0 3f                      	mov.l	\[r15\], 252\[r0\]
 55f:	e4 ff 3f                      	mov.l	\[r15\], 252\[r15\]
 562:	e8 f0 ff 3f                   	mov.l	\[r15\], 65532\[r0\]
 566:	e8 ff ff 3f                   	mov.l	\[r15\], 65532\[r15\]
 56a:	e1 00 3f                      	mov.l	252\[r0\], \[r0\]
 56d:	e1 0f 3f                      	mov.l	252\[r0\], \[r15\]
 570:	e5 00 3f 3f                   	mov.l	252\[r0\], 252\[r0\]
 574:	e5 0f 3f 3f                   	mov.l	252\[r0\], 252\[r15\]
 578:	e9 00 3f ff 3f                	mov.l	252\[r0\], 65532\[r0\]
 57d:	e9 0f 3f ff 3f                	mov.l	252\[r0\], 65532\[r15\]
 582:	e1 f0 3f                      	mov.l	252\[r15\], \[r0\]
 585:	e1 ff 3f                      	mov.l	252\[r15\], \[r15\]
 588:	e5 f0 3f 3f                   	mov.l	252\[r15\], 252\[r0\]
 58c:	e5 ff 3f 3f                   	mov.l	252\[r15\], 252\[r15\]
 590:	e9 f0 3f ff 3f                	mov.l	252\[r15\], 65532\[r0\]
 595:	e9 ff 3f ff 3f                	mov.l	252\[r15\], 65532\[r15\]
 59a:	e2 00 ff 3f                   	mov.l	65532\[r0\], \[r0\]
 59e:	e2 0f ff 3f                   	mov.l	65532\[r0\], \[r15\]
 5a2:	e6 00 ff 3f 3f                	mov.l	65532\[r0\], 252\[r0\]
 5a7:	e6 0f ff 3f 3f                	mov.l	65532\[r0\], 252\[r15\]
 5ac:	ea 00 ff 3f ff 3f             	mov.l	65532\[r0\], 65532\[r0\]
 5b2:	ea 0f ff 3f ff 3f             	mov.l	65532\[r0\], 65532\[r15\]
 5b8:	e2 f0 ff 3f                   	mov.l	65532\[r15\], \[r0\]
 5bc:	e2 ff ff 3f                   	mov.l	65532\[r15\], \[r15\]
 5c0:	e6 f0 ff 3f 3f                	mov.l	65532\[r15\], 252\[r0\]
 5c5:	e6 ff ff 3f 3f                	mov.l	65532\[r15\], 252\[r15\]
 5ca:	ea f0 ff 3f ff 3f             	mov.l	65532\[r15\], 65532\[r0\]
 5d0:	ea ff ff 3f ff 3f             	mov.l	65532\[r15\], 65532\[r15\]
 5d6:	fd 20 00                      	mov.b	r0, \[r0\+\]
 5d9:	fd 20 f0                      	mov.b	r0, \[r15\+\]
 5dc:	fd 20 0f                      	mov.b	r15, \[r0\+\]
 5df:	fd 20 ff                      	mov.b	r15, \[r15\+\]
 5e2:	fd 21 00                      	mov.w	r0, \[r0\+\]
 5e5:	fd 21 f0                      	mov.w	r0, \[r15\+\]
 5e8:	fd 21 0f                      	mov.w	r15, \[r0\+\]
 5eb:	fd 21 ff                      	mov.w	r15, \[r15\+\]
 5ee:	fd 22 00                      	mov.l	r0, \[r0\+\]
 5f1:	fd 22 f0                      	mov.l	r0, \[r15\+\]
 5f4:	fd 22 0f                      	mov.l	r15, \[r0\+\]
 5f7:	fd 22 ff                      	mov.l	r15, \[r15\+\]
 5fa:	fd 28 00                      	mov.b	\[r0\+\], r0
 5fd:	fd 28 0f                      	mov.b	\[r0\+\], r15
 600:	fd 28 f0                      	mov.b	\[r15\+\], r0
 603:	fd 28 ff                      	mov.b	\[r15\+\], r15
 606:	fd 29 00                      	mov.w	\[r0\+\], r0
 609:	fd 29 0f                      	mov.w	\[r0\+\], r15
 60c:	fd 29 f0                      	mov.w	\[r15\+\], r0
 60f:	fd 29 ff                      	mov.w	\[r15\+\], r15
 612:	fd 2a 00                      	mov.l	\[r0\+\], r0
 615:	fd 2a 0f                      	mov.l	\[r0\+\], r15
 618:	fd 2a f0                      	mov.l	\[r15\+\], r0
 61b:	fd 2a ff                      	mov.l	\[r15\+\], r15
 61e:	fd 24 00                      	mov.b	r0, \[-r0\]
 621:	fd 24 f0                      	mov.b	r0, \[-r15\]
 624:	fd 24 0f                      	mov.b	r15, \[-r0\]
 627:	fd 24 ff                      	mov.b	r15, \[-r15\]
 62a:	fd 25 00                      	mov.w	r0, \[-r0\]
 62d:	fd 25 f0                      	mov.w	r0, \[-r15\]
 630:	fd 25 0f                      	mov.w	r15, \[-r0\]
 633:	fd 25 ff                      	mov.w	r15, \[-r15\]
 636:	fd 26 00                      	mov.l	r0, \[-r0\]
 639:	fd 26 f0                      	mov.l	r0, \[-r15\]
 63c:	fd 26 0f                      	mov.l	r15, \[-r0\]
 63f:	fd 26 ff                      	mov.l	r15, \[-r15\]
 642:	fd 2c 00                      	mov.b	\[-r0\], r0
 645:	fd 2c 0f                      	mov.b	\[-r0\], r15
 648:	fd 2c f0                      	mov.b	\[-r15\], r0
 64b:	fd 2c ff                      	mov.b	\[-r15\], r15
 64e:	fd 2d 00                      	mov.w	\[-r0\], r0
 651:	fd 2d 0f                      	mov.w	\[-r0\], r15
 654:	fd 2d f0                      	mov.w	\[-r15\], r0
 657:	fd 2d ff                      	mov.w	\[-r15\], r15
 65a:	fd 2e 00                      	mov.l	\[-r0\], r0
 65d:	fd 2e 0f                      	mov.l	\[-r0\], r15
 660:	fd 2e f0                      	mov.l	\[-r15\], r0
 663:	fd 2e ff                      	mov.l	\[-r15\], r15
