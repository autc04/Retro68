#name: s390x reloc
#objdump: -dr

.*: +file format .*

Disassembly of section .text:

.* <foo>:
   0:	c0 e5 00 00 00 00 [ 	]*brasl	%r14,0 <foo>
[ 	]*2: R_390_PC32DBL	test_R_390_PC32DBL\+0x2
   6:	c0 e5 00 00 00 00 [ 	]*brasl	%r14,6 <foo\+0x6>
[ 	]*8: R_390_PC32DBL	test_R_390_PLT32DBL\+0x2
[ 	]*...
[ 	]*c: R_390_64	test_R_390_64
[ 	]*14: R_390_PC64	test_R_390_PC64\+0x14
[ 	]*1c: R_390_GOT64	test_R_390_GOT64
[ 	]*24: R_390_PLT64	test_R_390_PLT64
  2c:	c0 10 00 00 00 00 [ 	]*larl	%r1,2c <foo\+0x2c>
[ 	]*2e: R_390_GOTENT	test_R_390_GOTENT\+0x2
[ 	]*...
[ 	]*32: R_390_GOTOFF64	test_R_390_GOTOFF64
[ 	]*3a: R_390_PLTOFF64	test_R_390_PLTOFF64
[ 	]*42: R_390_GOTPLT64	test_R_390_GOTPLT64
  4a:	c0 10 00 00 00 00 [ 	]*larl	%r1,4a <foo\+0x4a>
[ 	]*4c: R_390_GOTPLTENT	test_R_390_GOTPLTENT\+0x2
  50:	c0 11 00 00 00 00 [ 	]*lgfi	%r1,0
[ 	]*52: R_390_32	test_R_390_32
  56:	c0 11 00 00 00 00 [ 	]*lgfi	%r1,0
[ 	]*58: R_390_PC32	test_R_390_PC32\+0x58

.* <bar>:
  5c:	c0 e5 00 00 00 00 [ 	]*brasl	%r14,5c <bar>
[ 	]*5e: R_390_PLT32DBL	foo\+0x2
[ 	]*...
[ 	]*62: R_390_PLT64	foo\+0x6
  6a:	07 07 [ 	]*nopr	%r7
