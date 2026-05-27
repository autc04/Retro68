#name: s390x opcodes (arch15)
#objdump: -dr

.*: +file format .*

Disassembly of section .text:

.* <foo>:
.*:	e7 f1 4d 00 87 89 [	 ]*vblend	%v15,%v17,%v20,%v24,13
.*:	e7 f1 40 00 87 89 [	 ]*vblendb	%v15,%v17,%v20,%v24
.*:	e7 f1 41 00 87 89 [	 ]*vblendh	%v15,%v17,%v20,%v24
.*:	e7 f1 42 00 87 89 [	 ]*vblendf	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 89 [	 ]*vblendg	%v15,%v17,%v20,%v24
.*:	e7 f1 44 00 87 89 [	 ]*vblendq	%v15,%v17,%v20,%v24
.*:	e7 f1 40 fd 87 88 [	 ]*veval	%v15,%v17,%v20,%v24,253
.*:	e7 f1 00 00 d4 54 [	 ]*vgem	%v15,%v17,13
.*:	e7 f1 00 00 04 54 [	 ]*vgemb	%v15,%v17
.*:	e7 f1 00 00 14 54 [	 ]*vgemh	%v15,%v17
.*:	e7 f1 00 00 24 54 [	 ]*vgemf	%v15,%v17
.*:	e7 f1 00 00 34 54 [	 ]*vgemg	%v15,%v17
.*:	e7 f1 00 00 44 54 [	 ]*vgemq	%v15,%v17
.*:	e7 f1 00 00 34 d7 [	 ]*vuphg	%v15,%v17
.*:	e7 f1 00 00 34 d5 [	 ]*vuplhg	%v15,%v17
.*:	e7 f1 00 00 34 d6 [	 ]*vuplg	%v15,%v17
.*:	e7 f1 00 00 34 d4 [	 ]*vupllg	%v15,%v17
.*:	e7 f1 40 00 46 f2 [	 ]*vavgq	%v15,%v17,%v20
.*:	e7 f1 40 00 46 f0 [	 ]*vavglq	%v15,%v17,%v20
.*:	e7 f1 00 00 44 db [	 ]*vecq	%v15,%v17
.*:	e7 f1 00 00 44 d9 [	 ]*veclq	%v15,%v17
.*:	e7 f1 40 00 46 f8 [	 ]*vceqq	%v15,%v17,%v20
.*:	e7 f1 40 10 46 f8 [	 ]*vceqqs	%v15,%v17,%v20
.*:	e7 f1 40 00 46 fb [	 ]*vchq	%v15,%v17,%v20
.*:	e7 f1 40 10 46 fb [	 ]*vchqs	%v15,%v17,%v20
.*:	e7 f1 40 00 46 f9 [	 ]*vchlq	%v15,%v17,%v20
.*:	e7 f1 40 10 46 f9 [	 ]*vchlqs	%v15,%v17,%v20
.*:	e7 f1 00 00 44 53 [	 ]*vclzq	%v15,%v17
.*:	e7 f1 00 00 44 52 [	 ]*vctzq	%v15,%v17
.*:	e7 f1 00 00 44 de [	 ]*vlcq	%v15,%v17
.*:	e7 f1 00 00 44 df [	 ]*vlpq	%v15,%v17
.*:	e7 f1 40 00 46 ff [	 ]*vmxq	%v15,%v17,%v20
.*:	e7 f1 40 00 46 fd [	 ]*vmxlq	%v15,%v17,%v20
.*:	e7 f1 40 00 46 fe [	 ]*vmnq	%v15,%v17,%v20
.*:	e7 f1 40 00 46 fc [	 ]*vmnlq	%v15,%v17,%v20
.*:	e7 f1 43 00 87 aa [	 ]*vmalg	%v15,%v17,%v20,%v24
.*:	e7 f1 44 00 87 aa [	 ]*vmalq	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 ab [	 ]*vmahg	%v15,%v17,%v20,%v24
.*:	e7 f1 44 00 87 ab [	 ]*vmahq	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 a9 [	 ]*vmalhg	%v15,%v17,%v20,%v24
.*:	e7 f1 44 00 87 a9 [	 ]*vmalhq	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 ae [	 ]*vmaeg	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 ac [	 ]*vmaleg	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 af [	 ]*vmaog	%v15,%v17,%v20,%v24
.*:	e7 f1 43 00 87 ad [	 ]*vmalog	%v15,%v17,%v20,%v24
.*:	e7 f1 40 00 36 a3 [	 ]*vmhg	%v15,%v17,%v20
.*:	e7 f1 40 00 46 a3 [	 ]*vmhq	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a1 [	 ]*vmlhg	%v15,%v17,%v20
.*:	e7 f1 40 00 46 a1 [	 ]*vmlhq	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a2 [	 ]*vmlg	%v15,%v17,%v20
.*:	e7 f1 40 00 46 a2 [	 ]*vmlq	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a6 [	 ]*vmeg	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a4 [	 ]*vmleg	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a7 [	 ]*vmog	%v15,%v17,%v20
.*:	e7 f1 40 00 36 a5 [	 ]*vmlog	%v15,%v17,%v20
.*:	e7 f1 40 0c d6 b2 [	 ]*vd	%v15,%v17,%v20,13,12
.*:	e7 f1 40 0d 26 b2 [	 ]*vdf	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 36 b2 [	 ]*vdg	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 46 b2 [	 ]*vdq	%v15,%v17,%v20,13
.*:	e7 f1 40 0c d6 b0 [	 ]*vdl	%v15,%v17,%v20,13,12
.*:	e7 f1 40 0d 26 b0 [	 ]*vdlf	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 36 b0 [	 ]*vdlg	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 46 b0 [	 ]*vdlq	%v15,%v17,%v20,13
.*:	e7 f1 40 0c d6 b3 [	 ]*vr	%v15,%v17,%v20,13,12
.*:	e7 f1 40 0d 26 b3 [	 ]*vrf	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 36 b3 [	 ]*vrg	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 46 b3 [	 ]*vrq	%v15,%v17,%v20,13
.*:	e7 f1 40 0c d6 b1 [	 ]*vrl	%v15,%v17,%v20,13,12
.*:	e7 f1 40 0d 26 b1 [	 ]*vrlf	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 36 b1 [	 ]*vrlg	%v15,%v17,%v20,13
.*:	e7 f1 40 0d 46 b1 [	 ]*vrlq	%v15,%v17,%v20,13
.*:	b9 68 00 69 [	 ]*clzg	%r6,%r9
.*:	b9 69 00 69 [	 ]*ctzg	%r6,%r9
.*:	e3 69 b8 f0 fd 60 [	 ]*lxab	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 62 [	 ]*lxah	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 64 [	 ]*lxaf	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 66 [	 ]*lxag	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 68 [	 ]*lxaq	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 61 [	 ]*llxab	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 63 [	 ]*llxah	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 65 [	 ]*llxaf	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 67 [	 ]*llxag	%r6,-10000\(%r9,%r11\)
.*:	e3 69 b8 f0 fd 69 [	 ]*llxaq	%r6,-10000\(%r9,%r11\)
.*:	b9 6c b0 69 [	 ]*bextg	%r6,%r9,%r11
.*:	b9 6d b0 69 [	 ]*bdepg	%r6,%r9,%r11
.*:	b9 3e 00 69 [	 ]*kimd	%r6,%r9
.*:	b9 3e d0 69 [	 ]*kimd	%r6,%r9,13
.*:	b9 3f 00 69 [	 ]*klmd	%r6,%r9
.*:	b9 3f d0 69 [	 ]*klmd	%r6,%r9,13
.*:	e6 f1 00 d0 04 4e [	 ]*vcvbq	%v15,%v17,13
.*:	e6 f1 00 cf d4 4a [	 ]*vcvdq	%v15,%v17,253,12
.*:	e6 0f 00 00 00 5f [	 ]*vtp	%v15
.*:	e6 0f 0f ff d0 5f [	 ]*vtp	%v15,65533
.*:	e6 0f 1f ff d2 7f [	 ]*vtz	%v15,%v17,65533
.*:	c8 36 10 0a 20 14 [	 ]*cal	%r3,10\(%r1\),20\(%r2\)
.*:	c8 37 10 0a 20 14 [	 ]*calg	%r3,10\(%r1\),20\(%r2\)
.*:	c8 3f 10 0a 20 14 [	 ]*calgf	%r3,10\(%r1\),20\(%r2\)
.*:	eb 13 28 f0 fd 16 [	 ]*pfcr	%r1,%r3,-10000\(%r2\)
