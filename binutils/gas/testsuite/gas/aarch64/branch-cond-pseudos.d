#as: -march=armv8-a
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	54000000 	b.eq	0 \<\.text\>  // b\.none
 *[0-9a-f]+:	54ffffe0 	b.eq	0 \<\.text\>  // b\.none
 *[0-9a-f]+:	54000001 	b.ne	8 \<\.text\+0x8\>  // b\.any
 *[0-9a-f]+:	54ffffe1 	b.ne	8 \<\.text\+0x8\>  // b\.any
 *[0-9a-f]+:	54000002 	b.cs	10 \<\.text\+0x10\>  // b\.hs, b\.nlast
 *[0-9a-f]+:	54ffffe2 	b.cs	10 \<\.text\+0x10\>  // b\.hs, b\.nlast
 *[0-9a-f]+:	54000002 	b.cs	18 \<\.text\+0x18\>  // b\.hs, b\.nlast
 *[0-9a-f]+:	54ffffe2 	b.cs	18 \<\.text\+0x18\>  // b\.hs, b\.nlast
 *[0-9a-f]+:	54000003 	b.cc	20 \<\.text\+0x20\>  // b\.lo, b\.ul, b\.last
 *[0-9a-f]+:	54ffffe3 	b.cc	20 \<\.text\+0x20\>  // b\.lo, b\.ul, b\.last
 *[0-9a-f]+:	54000003 	b.cc	28 \<\.text\+0x28\>  // b\.lo, b\.ul, b\.last
 *[0-9a-f]+:	54ffffe3 	b.cc	28 \<\.text\+0x28\>  // b\.lo, b\.ul, b\.last
 *[0-9a-f]+:	54000004 	b.mi	30 \<\.text\+0x30\>  // b\.first
 *[0-9a-f]+:	54ffffe4 	b.mi	30 \<\.text\+0x30\>  // b\.first
 *[0-9a-f]+:	54000005 	b.pl	38 \<\.text\+0x38\>  // b\.nfrst
 *[0-9a-f]+:	54ffffe5 	b.pl	38 \<\.text\+0x38\>  // b\.nfrst
 *[0-9a-f]+:	54000006 	b.vs	40 \<\.text\+0x40\>
 *[0-9a-f]+:	54ffffe6 	b.vs	40 \<\.text\+0x40\>
 *[0-9a-f]+:	54000007 	b.vc	48 \<\.text\+0x48\>
 *[0-9a-f]+:	54ffffe7 	b.vc	48 \<\.text\+0x48\>
 *[0-9a-f]+:	54000008 	b.hi	50 \<\.text\+0x50\>  // b\.pmore
 *[0-9a-f]+:	54ffffe8 	b.hi	50 \<\.text\+0x50\>  // b\.pmore
 *[0-9a-f]+:	54000009 	b.ls	58 \<\.text\+0x58\>  // b\.plast
 *[0-9a-f]+:	54ffffe9 	b.ls	58 \<\.text\+0x58\>  // b\.plast
 *[0-9a-f]+:	5400000a 	b.ge	60 \<\.text\+0x60\>  // b\.tcont
 *[0-9a-f]+:	54ffffea 	b.ge	60 \<\.text\+0x60\>  // b\.tcont
 *[0-9a-f]+:	5400000b 	b.lt	68 \<\.text\+0x68\>  // b\.tstop
 *[0-9a-f]+:	54ffffeb 	b.lt	68 \<\.text\+0x68\>  // b\.tstop
 *[0-9a-f]+:	5400000c 	b.gt	70 \<\.text\+0x70\>
 *[0-9a-f]+:	54ffffec 	b.gt	70 \<\.text\+0x70\>
 *[0-9a-f]+:	5400000d 	b.le	78 \<\.text\+0x78\>
 *[0-9a-f]+:	54ffffed 	b.le	78 \<\.text\+0x78\>
