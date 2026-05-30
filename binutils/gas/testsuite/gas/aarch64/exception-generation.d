#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	d4000001 	svc	#0x0
 *[0-9a-f]+:	d41fffe1 	svc	#0xffff
 *[0-9a-f]+:	d4000002 	hvc	#0x0
 *[0-9a-f]+:	d41fffe2 	hvc	#0xffff
 *[0-9a-f]+:	d4000003 	smc	#0x0
 *[0-9a-f]+:	d41fffe3 	smc	#0xffff
 *[0-9a-f]+:	d4200000 	brk	#0x0
 *[0-9a-f]+:	d43fffe0 	brk	#0xffff
 *[0-9a-f]+:	d4400000 	hlt	#0x0
 *[0-9a-f]+:	d45fffe0 	hlt	#0xffff
 *[0-9a-f]+:	d4a00001 	dcps1
 *[0-9a-f]+:	d4a00001 	dcps1
 *[0-9a-f]+:	d4bfffe1 	dcps1	#0xffff
 *[0-9a-f]+:	d4a00002 	dcps2
 *[0-9a-f]+:	d4a00002 	dcps2
 *[0-9a-f]+:	d4bfffe2 	dcps2	#0xffff
 *[0-9a-f]+:	d4a00003 	dcps3
 *[0-9a-f]+:	d4a00003 	dcps3
 *[0-9a-f]+:	d4bfffe3 	dcps3	#0xffff
