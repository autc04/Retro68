#name: FEAT_LSUI Test
#objdump: -dr
#as:-march=armv9-a+lsui+fp
#as:-march=armv9.6-a

.*:     file format .*

Disassembly of section \.text:

.* <ldtxr>:
.*:	895f7c00 	ldtxr	w0, \[x0\]
.*:	895f7fe0 	ldtxr	w0, \[sp\]
.*:	895f7c1f 	ldtxr	wzr, \[x0\]
.*:	c95f7c00 	ldtxr	x0, \[x0\]
.*:	c95f7fe0 	ldtxr	x0, \[sp\]
.*:	c95f7c1f 	ldtxr	xzr, \[x0\]

.* <ldatxr>:
.*:	895ffc00 	ldatxr	w0, \[x0\]
.*:	895fffe0 	ldatxr	w0, \[sp\]
.*:	895ffc1f 	ldatxr	wzr, \[x0\]
.*:	c95ffc00 	ldatxr	x0, \[x0\]
.*:	c95fffe0 	ldatxr	x0, \[sp\]
.*:	c95ffc1f 	ldatxr	xzr, \[x0\]

.* <sttxr>:
.*:	89007c44 	sttxr	w0, w4, \[x2\]
.*:	89007fe4 	sttxr	w0, w4, \[sp\]
.*:	89007c5f 	sttxr	w0, wzr, \[x2\]
.*:	89007fff 	sttxr	w0, wzr, \[sp\]
.*:	891d7c04 	sttxr	w29, w4, \[x0\]
.*:	891d7fe4 	sttxr	w29, w4, \[sp\]
.*:	891d7c1f 	sttxr	w29, wzr, \[x0\]
.*:	891d7fff 	sttxr	w29, wzr, \[sp\]
.*:	c9007c44 	sttxr	w0, x4, \[x2\]
.*:	c9007fe4 	sttxr	w0, x4, \[sp\]
.*:	c9007c5f 	sttxr	w0, xzr, \[x2\]
.*:	c9007fff 	sttxr	w0, xzr, \[sp\]
.*:	c91d7c04 	sttxr	w29, x4, \[x0\]
.*:	c91d7fe4 	sttxr	w29, x4, \[sp\]
.*:	c91d7c1f 	sttxr	w29, xzr, \[x0\]
.*:	c91d7fff 	sttxr	w29, xzr, \[sp\]

.* <stltxr>:
.*:	8900fc44 	stltxr	w0, w4, \[x2\]
.*:	8900ffe4 	stltxr	w0, w4, \[sp\]
.*:	8900fc5f 	stltxr	w0, wzr, \[x2\]
.*:	8900ffff 	stltxr	w0, wzr, \[sp\]
.*:	891dfc04 	stltxr	w29, w4, \[x0\]
.*:	891dffe4 	stltxr	w29, w4, \[sp\]
.*:	891dfc1f 	stltxr	w29, wzr, \[x0\]
.*:	891dffff 	stltxr	w29, wzr, \[sp\]
.*:	c900fc44 	stltxr	w0, x4, \[x2\]
.*:	c900ffe4 	stltxr	w0, x4, \[sp\]
.*:	c900fc5f 	stltxr	w0, xzr, \[x2\]
.*:	c900ffff 	stltxr	w0, xzr, \[sp\]
.*:	c91dfc04 	stltxr	w29, x4, \[x0\]
.*:	c91dffe4 	stltxr	w29, x4, \[sp\]
.*:	c91dfc1f 	stltxr	w29, xzr, \[x0\]
.*:	c91dffff 	stltxr	w29, xzr, \[sp\]

.* <cast>:
.*:	c9807c00 	cast	x0, x0, \[x0\]
.*:	c9807fe0 	cast	x0, x0, \[sp\]
.*:	c9807c1f 	cast	x0, xzr, \[x0\]
.*:	c9807fff 	cast	x0, xzr, \[sp\]
.*:	c99f7c00 	cast	xzr, x0, \[x0\]
.*:	c99f7fe0 	cast	xzr, x0, \[sp\]
.*:	c99f7c1f 	cast	xzr, xzr, \[x0\]
.*:	c99f7fff 	cast	xzr, xzr, \[sp\]

.* <casat>:
.*:	c9c07c00 	casat	x0, x0, \[x0\]
.*:	c9c07fe0 	casat	x0, x0, \[sp\]
.*:	c9c07c1f 	casat	x0, xzr, \[x0\]
.*:	c9c07fff 	casat	x0, xzr, \[sp\]
.*:	c9df7c00 	casat	xzr, x0, \[x0\]
.*:	c9df7fe0 	casat	xzr, x0, \[sp\]
.*:	c9df7c1f 	casat	xzr, xzr, \[x0\]
.*:	c9df7fff 	casat	xzr, xzr, \[sp\]

.* <casalt>:
.*:	c9c0fc00 	casalt	x0, x0, \[x0\]
.*:	c9c0ffe0 	casalt	x0, x0, \[sp\]
.*:	c9c0fc1f 	casalt	x0, xzr, \[x0\]
.*:	c9c0ffff 	casalt	x0, xzr, \[sp\]
.*:	c9dffc00 	casalt	xzr, x0, \[x0\]
.*:	c9dfffe0 	casalt	xzr, x0, \[sp\]
.*:	c9dffc1f 	casalt	xzr, xzr, \[x0\]
.*:	c9dfffff 	casalt	xzr, xzr, \[sp\]

.* <caslt>:
.*:	c980fc00 	caslt	x0, x0, \[x0\]
.*:	c980ffe0 	caslt	x0, x0, \[sp\]
.*:	c980fc1f 	caslt	x0, xzr, \[x0\]
.*:	c980ffff 	caslt	x0, xzr, \[sp\]
.*:	c99ffc00 	caslt	xzr, x0, \[x0\]
.*:	c99fffe0 	caslt	xzr, x0, \[sp\]
.*:	c99ffc1f 	caslt	xzr, xzr, \[x0\]
.*:	c99fffff 	caslt	xzr, xzr, \[sp\]

.* <caspt>:
.*:	49807c00 	caspt	x0, x1, x0, x1, \[x0\]
.*:	49807fe0 	caspt	x0, x1, x0, x1, \[sp\]
.*:	49807c1c 	caspt	x0, x1, x28, x29, \[x0\]
.*:	49807ffc 	caspt	x0, x1, x28, x29, \[sp\]
.*:	499c7c00 	caspt	x28, x29, x0, x1, \[x0\]
.*:	499c7fe0 	caspt	x28, x29, x0, x1, \[sp\]
.*:	499c7c1c 	caspt	x28, x29, x28, x29, \[x0\]
.*:	499c7ffc 	caspt	x28, x29, x28, x29, \[sp\]

.* <caspat>:
.*:	49c07c00 	caspat	x0, x1, x0, x1, \[x0\]
.*:	49c07fe0 	caspat	x0, x1, x0, x1, \[sp\]
.*:	49c07c1c 	caspat	x0, x1, x28, x29, \[x0\]
.*:	49c07ffc 	caspat	x0, x1, x28, x29, \[sp\]
.*:	49dc7c00 	caspat	x28, x29, x0, x1, \[x0\]
.*:	49dc7fe0 	caspat	x28, x29, x0, x1, \[sp\]
.*:	49dc7c1c 	caspat	x28, x29, x28, x29, \[x0\]
.*:	49dc7ffc 	caspat	x28, x29, x28, x29, \[sp\]

.* <caspalt>:
.*:	49c0fc00 	caspalt	x0, x1, x0, x1, \[x0\]
.*:	49c0ffe0 	caspalt	x0, x1, x0, x1, \[sp\]
.*:	49c0fc1c 	caspalt	x0, x1, x28, x29, \[x0\]
.*:	49c0fffc 	caspalt	x0, x1, x28, x29, \[sp\]
.*:	49dcfc00 	caspalt	x28, x29, x0, x1, \[x0\]
.*:	49dcffe0 	caspalt	x28, x29, x0, x1, \[sp\]
.*:	49dcfc1c 	caspalt	x28, x29, x28, x29, \[x0\]
.*:	49dcfffc 	caspalt	x28, x29, x28, x29, \[sp\]

.* <casplt>:
.*:	4980fc00 	casplt	x0, x1, x0, x1, \[x0\]
.*:	4980ffe0 	casplt	x0, x1, x0, x1, \[sp\]
.*:	4980fc1c 	casplt	x0, x1, x28, x29, \[x0\]
.*:	4980fffc 	casplt	x0, x1, x28, x29, \[sp\]
.*:	499cfc00 	casplt	x28, x29, x0, x1, \[x0\]
.*:	499cffe0 	casplt	x28, x29, x0, x1, \[sp\]
.*:	499cfc1c 	casplt	x28, x29, x28, x29, \[x0\]
.*:	499cfffc 	casplt	x28, x29, x28, x29, \[sp\]

.* <ldtp>:
.*:	e9400800 	ldtp	x0, x2, \[x0\]
.*:	e97f8800 	ldtp	x0, x2, \[x0, #-8\]
.*:	e9400be0 	ldtp	x0, x2, \[sp\]
.*:	e97f8be0 	ldtp	x0, x2, \[sp, #-8\]
.*:	e9407c00 	ldtp	x0, xzr, \[x0\]
.*:	e97ffc00 	ldtp	x0, xzr, \[x0, #-8\]
.*:	e9407fe0 	ldtp	x0, xzr, \[sp\]
.*:	e97fffe0 	ldtp	x0, xzr, \[sp, #-8\]
.*:	e940081f 	ldtp	xzr, x2, \[x0\]
.*:	e97f881f 	ldtp	xzr, x2, \[x0, #-8\]
.*:	e9400bff 	ldtp	xzr, x2, \[sp\]
.*:	e97f8bff 	ldtp	xzr, x2, \[sp, #-8\]
.*:	e940741f 	ldtp	xzr, x29, \[x0\]
.*:	e97ff41f 	ldtp	xzr, x29, \[x0, #-8\]
.*:	e94077ff 	ldtp	xzr, x29, \[sp\]
.*:	e97ff7ff 	ldtp	xzr, x29, \[sp, #-8\]
.*:	e9c11040 	ldtp	x0, x4, \[x2, #16\]!
.*:	e9ff9040 	ldtp	x0, x4, \[x2, #-8\]!
.*:	e9c113e0 	ldtp	x0, x4, \[sp, #16\]!
.*:	e9ff93e0 	ldtp	x0, x4, \[sp, #-8\]!
.*:	e9c17c40 	ldtp	x0, xzr, \[x2, #16\]!
.*:	e9fffc40 	ldtp	x0, xzr, \[x2, #-8\]!
.*:	e9c17fe0 	ldtp	x0, xzr, \[sp, #16\]!
.*:	e9ffffe0 	ldtp	x0, xzr, \[sp, #-8\]!
.*:	e9c1005f 	ldtp	xzr, x0, \[x2, #16\]!
.*:	e9ff805f 	ldtp	xzr, x0, \[x2, #-8\]!
.*:	e9c103ff 	ldtp	xzr, x0, \[sp, #16\]!
.*:	e9ff83ff 	ldtp	xzr, x0, \[sp, #-8\]!
.*:	e9c1745f 	ldtp	xzr, x29, \[x2, #16\]!
.*:	e9fff45f 	ldtp	xzr, x29, \[x2, #-8\]!
.*:	e9c177ff 	ldtp	xzr, x29, \[sp, #16\]!
.*:	e9fff7ff 	ldtp	xzr, x29, \[sp, #-8\]!
.*:	e8c11040 	ldtp	x0, x4, \[x2\], #16
.*:	e8ff9040 	ldtp	x0, x4, \[x2\], #-8
.*:	e8c113e0 	ldtp	x0, x4, \[sp\], #16
.*:	e8ff93e0 	ldtp	x0, x4, \[sp\], #-8
.*:	e8c17c40 	ldtp	x0, xzr, \[x2\], #16
.*:	e8fffc40 	ldtp	x0, xzr, \[x2\], #-8
.*:	e8c17fe0 	ldtp	x0, xzr, \[sp\], #16
.*:	e8ffffe0 	ldtp	x0, xzr, \[sp\], #-8
.*:	e8c1005f 	ldtp	xzr, x0, \[x2\], #16
.*:	e8ff805f 	ldtp	xzr, x0, \[x2\], #-8
.*:	e8c103ff 	ldtp	xzr, x0, \[sp\], #16
.*:	e8ff83ff 	ldtp	xzr, x0, \[sp\], #-8
.*:	e8c1745f 	ldtp	xzr, x29, \[x2\], #16
.*:	e8fff45f 	ldtp	xzr, x29, \[x2\], #-8
.*:	e8c177ff 	ldtp	xzr, x29, \[sp\], #16
.*:	e8fff7ff 	ldtp	xzr, x29, \[sp\], #-8
.*:	ed400800 	ldtp	q0, q2, \[x0\]
.*:	ed7f8800 	ldtp	q0, q2, \[x0, #-16\]
.*:	ed400be0 	ldtp	q0, q2, \[sp\]
.*:	ed7f8be0 	ldtp	q0, q2, \[sp, #-16\]
.*:	ed407c00 	ldtp	q0, q31, \[x0\]
.*:	ed7ffc00 	ldtp	q0, q31, \[x0, #-16\]
.*:	ed407fe0 	ldtp	q0, q31, \[sp\]
.*:	ed7fffe0 	ldtp	q0, q31, \[sp, #-16\]
.*:	ed40001f 	ldtp	q31, q0, \[x0\]
.*:	ed7f801f 	ldtp	q31, q0, \[x0, #-16\]
.*:	ed4003ff 	ldtp	q31, q0, \[sp\]
.*:	ed7f83ff 	ldtp	q31, q0, \[sp, #-16\]
.*:	ed40741f 	ldtp	q31, q29, \[x0\]
.*:	ed7ff41f 	ldtp	q31, q29, \[x0, #-16\]
.*:	ed4077ff 	ldtp	q31, q29, \[sp\]
.*:	ed7ff7ff 	ldtp	q31, q29, \[sp, #-16\]
.*:	edc10800 	ldtp	q0, q2, \[x0, #32\]!
.*:	edff8800 	ldtp	q0, q2, \[x0, #-16\]!
.*:	edc10be0 	ldtp	q0, q2, \[sp, #32\]!
.*:	edff8be0 	ldtp	q0, q2, \[sp, #-16\]!
.*:	edc17c00 	ldtp	q0, q31, \[x0, #32\]!
.*:	edfffc00 	ldtp	q0, q31, \[x0, #-16\]!
.*:	edc17fe0 	ldtp	q0, q31, \[sp, #32\]!
.*:	edffffe0 	ldtp	q0, q31, \[sp, #-16\]!
.*:	edc1081f 	ldtp	q31, q2, \[x0, #32\]!
.*:	edff881f 	ldtp	q31, q2, \[x0, #-16\]!
.*:	edc10bff 	ldtp	q31, q2, \[sp, #32\]!
.*:	edff8bff 	ldtp	q31, q2, \[sp, #-16\]!
.*:	edc1741f 	ldtp	q31, q29, \[x0, #32\]!
.*:	edfff41f 	ldtp	q31, q29, \[x0, #-16\]!
.*:	edc177ff 	ldtp	q31, q29, \[sp, #32\]!
.*:	edfff7ff 	ldtp	q31, q29, \[sp, #-16\]!
.*:	ecc10800 	ldtp	q0, q2, \[x0\], #32
.*:	ecff8800 	ldtp	q0, q2, \[x0\], #-16
.*:	ecc10be0 	ldtp	q0, q2, \[sp\], #32
.*:	ecff8be0 	ldtp	q0, q2, \[sp\], #-16
.*:	ecc17c00 	ldtp	q0, q31, \[x0\], #32
.*:	ecfffc00 	ldtp	q0, q31, \[x0\], #-16
.*:	ecc17fe0 	ldtp	q0, q31, \[sp\], #32
.*:	ecffffe0 	ldtp	q0, q31, \[sp\], #-16
.*:	ecc1081f 	ldtp	q31, q2, \[x0\], #32
.*:	ecff881f 	ldtp	q31, q2, \[x0\], #-16
.*:	ecc10bff 	ldtp	q31, q2, \[sp\], #32
.*:	ecff8bff 	ldtp	q31, q2, \[sp\], #-16
.*:	ecc1741f 	ldtp	q31, q29, \[x0\], #32
.*:	ecfff41f 	ldtp	q31, q29, \[x0\], #-16
.*:	ecc177ff 	ldtp	q31, q29, \[sp\], #32
.*:	ecfff7ff 	ldtp	q31, q29, \[sp\], #-16

.* <sttp>:
.*:	e9000800 	sttp	x0, x2, \[x0\]
.*:	e93f8800 	sttp	x0, x2, \[x0, #-8\]
.*:	e9000be0 	sttp	x0, x2, \[sp\]
.*:	e93f8be0 	sttp	x0, x2, \[sp, #-8\]
.*:	e9007c00 	sttp	x0, xzr, \[x0\]
.*:	e93ffc00 	sttp	x0, xzr, \[x0, #-8\]
.*:	e9007fe0 	sttp	x0, xzr, \[sp\]
.*:	e93fffe0 	sttp	x0, xzr, \[sp, #-8\]
.*:	e900081f 	sttp	xzr, x2, \[x0\]
.*:	e93f881f 	sttp	xzr, x2, \[x0, #-8\]
.*:	e9000bff 	sttp	xzr, x2, \[sp\]
.*:	e93f8bff 	sttp	xzr, x2, \[sp, #-8\]
.*:	e900741f 	sttp	xzr, x29, \[x0\]
.*:	e93ff41f 	sttp	xzr, x29, \[x0, #-8\]
.*:	e90077ff 	sttp	xzr, x29, \[sp\]
.*:	e93ff7ff 	sttp	xzr, x29, \[sp, #-8\]
.*:	e9811040 	sttp	x0, x4, \[x2, #16\]!
.*:	e9bf9040 	sttp	x0, x4, \[x2, #-8\]!
.*:	e98113e0 	sttp	x0, x4, \[sp, #16\]!
.*:	e9bf93e0 	sttp	x0, x4, \[sp, #-8\]!
.*:	e9817c40 	sttp	x0, xzr, \[x2, #16\]!
.*:	e9bffc40 	sttp	x0, xzr, \[x2, #-8\]!
.*:	e9817fe0 	sttp	x0, xzr, \[sp, #16\]!
.*:	e9bfffe0 	sttp	x0, xzr, \[sp, #-8\]!
.*:	e981005f 	sttp	xzr, x0, \[x2, #16\]!
.*:	e9bf805f 	sttp	xzr, x0, \[x2, #-8\]!
.*:	e98103ff 	sttp	xzr, x0, \[sp, #16\]!
.*:	e9bf83ff 	sttp	xzr, x0, \[sp, #-8\]!
.*:	e981745f 	sttp	xzr, x29, \[x2, #16\]!
.*:	e9bff45f 	sttp	xzr, x29, \[x2, #-8\]!
.*:	e98177ff 	sttp	xzr, x29, \[sp, #16\]!
.*:	e9bff7ff 	sttp	xzr, x29, \[sp, #-8\]!
.*:	e8811040 	sttp	x0, x4, \[x2\], #16
.*:	e8bf9040 	sttp	x0, x4, \[x2\], #-8
.*:	e88113e0 	sttp	x0, x4, \[sp\], #16
.*:	e8bf93e0 	sttp	x0, x4, \[sp\], #-8
.*:	e8817c40 	sttp	x0, xzr, \[x2\], #16
.*:	e8bffc40 	sttp	x0, xzr, \[x2\], #-8
.*:	e8817fe0 	sttp	x0, xzr, \[sp\], #16
.*:	e8bfffe0 	sttp	x0, xzr, \[sp\], #-8
.*:	e881005f 	sttp	xzr, x0, \[x2\], #16
.*:	e8bf805f 	sttp	xzr, x0, \[x2\], #-8
.*:	e88103ff 	sttp	xzr, x0, \[sp\], #16
.*:	e8bf83ff 	sttp	xzr, x0, \[sp\], #-8
.*:	e881745f 	sttp	xzr, x29, \[x2\], #16
.*:	e8bff45f 	sttp	xzr, x29, \[x2\], #-8
.*:	e88177ff 	sttp	xzr, x29, \[sp\], #16
.*:	e8bff7ff 	sttp	xzr, x29, \[sp\], #-8
.*:	ed000800 	sttp	q0, q2, \[x0\]
.*:	ed3f8800 	sttp	q0, q2, \[x0, #-16\]
.*:	ed000be0 	sttp	q0, q2, \[sp\]
.*:	ed3f8be0 	sttp	q0, q2, \[sp, #-16\]
.*:	ed007c00 	sttp	q0, q31, \[x0\]
.*:	ed3ffc00 	sttp	q0, q31, \[x0, #-16\]
.*:	ed007fe0 	sttp	q0, q31, \[sp\]
.*:	ed3fffe0 	sttp	q0, q31, \[sp, #-16\]
.*:	ed00001f 	sttp	q31, q0, \[x0\]
.*:	ed3f801f 	sttp	q31, q0, \[x0, #-16\]
.*:	ed0003ff 	sttp	q31, q0, \[sp\]
.*:	ed3f83ff 	sttp	q31, q0, \[sp, #-16\]
.*:	ed00741f 	sttp	q31, q29, \[x0\]
.*:	ed3ff41f 	sttp	q31, q29, \[x0, #-16\]
.*:	ed0077ff 	sttp	q31, q29, \[sp\]
.*:	ed3ff7ff 	sttp	q31, q29, \[sp, #-16\]
.*:	ed810800 	sttp	q0, q2, \[x0, #32\]!
.*:	edbf8800 	sttp	q0, q2, \[x0, #-16\]!
.*:	ed810be0 	sttp	q0, q2, \[sp, #32\]!
.*:	edbf8be0 	sttp	q0, q2, \[sp, #-16\]!
.*:	ed817c00 	sttp	q0, q31, \[x0, #32\]!
.*:	edbffc00 	sttp	q0, q31, \[x0, #-16\]!
.*:	ed817fe0 	sttp	q0, q31, \[sp, #32\]!
.*:	edbfffe0 	sttp	q0, q31, \[sp, #-16\]!
.*:	ed81081f 	sttp	q31, q2, \[x0, #32\]!
.*:	edbf881f 	sttp	q31, q2, \[x0, #-16\]!
.*:	ed810bff 	sttp	q31, q2, \[sp, #32\]!
.*:	edbf8bff 	sttp	q31, q2, \[sp, #-16\]!
.*:	ed81741f 	sttp	q31, q29, \[x0, #32\]!
.*:	edbff41f 	sttp	q31, q29, \[x0, #-16\]!
.*:	ed8177ff 	sttp	q31, q29, \[sp, #32\]!
.*:	edbff7ff 	sttp	q31, q29, \[sp, #-16\]!
.*:	ec810800 	sttp	q0, q2, \[x0\], #32
.*:	ecbf8800 	sttp	q0, q2, \[x0\], #-16
.*:	ec810be0 	sttp	q0, q2, \[sp\], #32
.*:	ecbf8be0 	sttp	q0, q2, \[sp\], #-16
.*:	ec817c00 	sttp	q0, q31, \[x0\], #32
.*:	ecbffc00 	sttp	q0, q31, \[x0\], #-16
.*:	ec817fe0 	sttp	q0, q31, \[sp\], #32
.*:	ecbfffe0 	sttp	q0, q31, \[sp\], #-16
.*:	ec81081f 	sttp	q31, q2, \[x0\], #32
.*:	ecbf881f 	sttp	q31, q2, \[x0\], #-16
.*:	ec810bff 	sttp	q31, q2, \[sp\], #32
.*:	ecbf8bff 	sttp	q31, q2, \[sp\], #-16
.*:	ec81741f 	sttp	q31, q29, \[x0\], #32
.*:	ecbff41f 	sttp	q31, q29, \[x0\], #-16
.*:	ec8177ff 	sttp	q31, q29, \[sp\], #32
.*:	ecbff7ff 	sttp	q31, q29, \[sp\], #-16

.* <swpt>:
.*:	19208400 	swpt	w0, w0, \[x0\]
.*:	192087e0 	swpt	w0, w0, \[sp\]
.*:	1920841f 	swpt	w0, wzr, \[x0\]
.*:	192087ff 	swpt	w0, wzr, \[sp\]
.*:	193f8400 	swpt	wzr, w0, \[x0\]
.*:	193f87e0 	swpt	wzr, w0, \[sp\]
.*:	193f841f 	swpt	wzr, wzr, \[x0\]
.*:	193f87ff 	swpt	wzr, wzr, \[sp\]
.*:	59208400 	swpt	x0, x0, \[x0\]
.*:	592087e0 	swpt	x0, x0, \[sp\]
.*:	5920841f 	swpt	x0, xzr, \[x0\]
.*:	592087ff 	swpt	x0, xzr, \[sp\]
.*:	593f8400 	swpt	xzr, x0, \[x0\]
.*:	593f87e0 	swpt	xzr, x0, \[sp\]
.*:	593f841f 	swpt	xzr, xzr, \[x0\]
.*:	593f87ff 	swpt	xzr, xzr, \[sp\]

.* <swpta>:
.*:	19a08400 	swpta	w0, w0, \[x0\]
.*:	19a087e0 	swpta	w0, w0, \[sp\]
.*:	19a0841f 	swpta	w0, wzr, \[x0\]
.*:	19a087ff 	swpta	w0, wzr, \[sp\]
.*:	19bf8400 	swpta	wzr, w0, \[x0\]
.*:	19bf87e0 	swpta	wzr, w0, \[sp\]
.*:	19bf841f 	swpta	wzr, wzr, \[x0\]
.*:	19bf87ff 	swpta	wzr, wzr, \[sp\]
.*:	59a08400 	swpta	x0, x0, \[x0\]
.*:	59a087e0 	swpta	x0, x0, \[sp\]
.*:	59a0841f 	swpta	x0, xzr, \[x0\]
.*:	59a087ff 	swpta	x0, xzr, \[sp\]
.*:	59bf8400 	swpta	xzr, x0, \[x0\]
.*:	59bf87e0 	swpta	xzr, x0, \[sp\]
.*:	59bf841f 	swpta	xzr, xzr, \[x0\]
.*:	59bf87ff 	swpta	xzr, xzr, \[sp\]

.* <swptal>:
.*:	19e08400 	swptal	w0, w0, \[x0\]
.*:	19e087e0 	swptal	w0, w0, \[sp\]
.*:	19e0841f 	swptal	w0, wzr, \[x0\]
.*:	19e087ff 	swptal	w0, wzr, \[sp\]
.*:	19ff8400 	swptal	wzr, w0, \[x0\]
.*:	19ff87e0 	swptal	wzr, w0, \[sp\]
.*:	19ff841f 	swptal	wzr, wzr, \[x0\]
.*:	19ff87ff 	swptal	wzr, wzr, \[sp\]
.*:	59e08400 	swptal	x0, x0, \[x0\]
.*:	59e087e0 	swptal	x0, x0, \[sp\]
.*:	59e0841f 	swptal	x0, xzr, \[x0\]
.*:	59e087ff 	swptal	x0, xzr, \[sp\]
.*:	59ff8400 	swptal	xzr, x0, \[x0\]
.*:	59ff87e0 	swptal	xzr, x0, \[sp\]
.*:	59ff841f 	swptal	xzr, xzr, \[x0\]
.*:	59ff87ff 	swptal	xzr, xzr, \[sp\]

.* <swptl>:
.*:	19608400 	swptl	w0, w0, \[x0\]
.*:	196087e0 	swptl	w0, w0, \[sp\]
.*:	1960841f 	swptl	w0, wzr, \[x0\]
.*:	196087ff 	swptl	w0, wzr, \[sp\]
.*:	197f8400 	swptl	wzr, w0, \[x0\]
.*:	197f87e0 	swptl	wzr, w0, \[sp\]
.*:	197f841f 	swptl	wzr, wzr, \[x0\]
.*:	197f87ff 	swptl	wzr, wzr, \[sp\]
.*:	59608400 	swptl	x0, x0, \[x0\]
.*:	596087e0 	swptl	x0, x0, \[sp\]
.*:	5960841f 	swptl	x0, xzr, \[x0\]
.*:	596087ff 	swptl	x0, xzr, \[sp\]
.*:	597f8400 	swptl	xzr, x0, \[x0\]
.*:	597f87e0 	swptl	xzr, x0, \[sp\]
.*:	597f841f 	swptl	xzr, xzr, \[x0\]
.*:	597f87ff 	swptl	xzr, xzr, \[sp\]

.* <ldtadd>:
.*:	19200400 	ldtadd	w0, w0, \[x0\]
.*:	192007e0 	ldtadd	w0, w0, \[sp\]
.*:	1920041f 	sttadd	w0, \[x0\]
.*:	192007ff 	sttadd	w0, \[sp\]
.*:	193f0400 	ldtadd	wzr, w0, \[x0\]
.*:	193f07e0 	ldtadd	wzr, w0, \[sp\]
.*:	193f041f 	sttadd	wzr, \[x0\]
.*:	193f07ff 	sttadd	wzr, \[sp\]
.*:	1920041d 	ldtadd	w0, w29, \[x0\]
.*:	192007fd 	ldtadd	w0, w29, \[sp\]
.*:	193f041d 	ldtadd	wzr, w29, \[x0\]
.*:	193f07fd 	ldtadd	wzr, w29, \[sp\]
.*:	59200400 	ldtadd	x0, x0, \[x0\]
.*:	592007e0 	ldtadd	x0, x0, \[sp\]
.*:	5920041f 	sttadd	x0, \[x0\]
.*:	592007ff 	sttadd	x0, \[sp\]
.*:	593f0400 	ldtadd	xzr, x0, \[x0\]
.*:	593f07e0 	ldtadd	xzr, x0, \[sp\]
.*:	593f041f 	sttadd	xzr, \[x0\]
.*:	593f07ff 	sttadd	xzr, \[sp\]
.*:	5920041d 	ldtadd	x0, x29, \[x0\]
.*:	592007fd 	ldtadd	x0, x29, \[sp\]
.*:	593f041d 	ldtadd	xzr, x29, \[x0\]
.*:	593f07fd 	ldtadd	xzr, x29, \[sp\]

.* <sttadd>:
.*:	1920041f 	sttadd	w0, \[x0\]
.*:	192007ff 	sttadd	w0, \[sp\]
.*:	193f041f 	sttadd	wzr, \[x0\]
.*:	193f07ff 	sttadd	wzr, \[sp\]
.*:	5920041f 	sttadd	x0, \[x0\]
.*:	592007ff 	sttadd	x0, \[sp\]
.*:	593f041f 	sttadd	xzr, \[x0\]
.*:	593f07ff 	sttadd	xzr, \[sp\]

.* <ldtadda>:
.*:	19a00400 	ldtadda	w0, w0, \[x0\]
.*:	19a007e0 	ldtadda	w0, w0, \[sp\]
.*:	19a0041f 	ldtadda	w0, wzr, \[x0\]
.*:	19a007ff 	ldtadda	w0, wzr, \[sp\]
.*:	19bf0400 	ldtadda	wzr, w0, \[x0\]
.*:	19bf07e0 	ldtadda	wzr, w0, \[sp\]
.*:	19bf041f 	ldtadda	wzr, wzr, \[x0\]
.*:	19bf07ff 	ldtadda	wzr, wzr, \[sp\]
.*:	59a00400 	ldtadda	x0, x0, \[x0\]
.*:	59a007e0 	ldtadda	x0, x0, \[sp\]
.*:	59a0041f 	ldtadda	x0, xzr, \[x0\]
.*:	59a007ff 	ldtadda	x0, xzr, \[sp\]
.*:	59bf0400 	ldtadda	xzr, x0, \[x0\]
.*:	59bf07e0 	ldtadda	xzr, x0, \[sp\]
.*:	59bf041f 	ldtadda	xzr, xzr, \[x0\]
.*:	59bf07ff 	ldtadda	xzr, xzr, \[sp\]

.* <ldtaddal>:
.*:	19e00400 	ldtaddal	w0, w0, \[x0\]
.*:	19e007e0 	ldtaddal	w0, w0, \[sp\]
.*:	19e0041f 	ldtaddal	w0, wzr, \[x0\]
.*:	19e007ff 	ldtaddal	w0, wzr, \[sp\]
.*:	19ff0400 	ldtaddal	wzr, w0, \[x0\]
.*:	19ff07e0 	ldtaddal	wzr, w0, \[sp\]
.*:	19ff041f 	ldtaddal	wzr, wzr, \[x0\]
.*:	19ff07ff 	ldtaddal	wzr, wzr, \[sp\]
.*:	59e00400 	ldtaddal	x0, x0, \[x0\]
.*:	59e007e0 	ldtaddal	x0, x0, \[sp\]
.*:	59e0041f 	ldtaddal	x0, xzr, \[x0\]
.*:	59e007ff 	ldtaddal	x0, xzr, \[sp\]
.*:	59ff0400 	ldtaddal	xzr, x0, \[x0\]
.*:	59ff07e0 	ldtaddal	xzr, x0, \[sp\]
.*:	59ff041f 	ldtaddal	xzr, xzr, \[x0\]
.*:	59ff07ff 	ldtaddal	xzr, xzr, \[sp\]

.* <ldtaddl>:
.*:	19600400 	ldtaddl	w0, w0, \[x0\]
.*:	196007e0 	ldtaddl	w0, w0, \[sp\]
.*:	1960041f 	sttaddl	w0, \[x0\]
.*:	196007ff 	sttaddl	w0, \[sp\]
.*:	197f0400 	ldtaddl	wzr, w0, \[x0\]
.*:	197f07e0 	ldtaddl	wzr, w0, \[sp\]
.*:	197f041f 	sttaddl	wzr, \[x0\]
.*:	197f07ff 	sttaddl	wzr, \[sp\]
.*:	1960041d 	ldtaddl	w0, w29, \[x0\]
.*:	196007fd 	ldtaddl	w0, w29, \[sp\]
.*:	197f041d 	ldtaddl	wzr, w29, \[x0\]
.*:	197f07fd 	ldtaddl	wzr, w29, \[sp\]
.*:	59600400 	ldtaddl	x0, x0, \[x0\]
.*:	596007e0 	ldtaddl	x0, x0, \[sp\]
.*:	5960041f 	sttaddl	x0, \[x0\]
.*:	596007ff 	sttaddl	x0, \[sp\]
.*:	597f0400 	ldtaddl	xzr, x0, \[x0\]
.*:	597f07e0 	ldtaddl	xzr, x0, \[sp\]
.*:	597f041f 	sttaddl	xzr, \[x0\]
.*:	597f07ff 	sttaddl	xzr, \[sp\]
.*:	5960041d 	ldtaddl	x0, x29, \[x0\]
.*:	596007fd 	ldtaddl	x0, x29, \[sp\]
.*:	597f041d 	ldtaddl	xzr, x29, \[x0\]
.*:	597f07fd 	ldtaddl	xzr, x29, \[sp\]

.* <sttaddl>:
.*:	1960041f 	sttaddl	w0, \[x0\]
.*:	196007ff 	sttaddl	w0, \[sp\]
.*:	197f041f 	sttaddl	wzr, \[x0\]
.*:	197f07ff 	sttaddl	wzr, \[sp\]
.*:	5960041f 	sttaddl	x0, \[x0\]
.*:	596007ff 	sttaddl	x0, \[sp\]
.*:	597f041f 	sttaddl	xzr, \[x0\]
.*:	597f07ff 	sttaddl	xzr, \[sp\]

.* <ldtclr>:
.*:	19201400 	ldtclr	w0, w0, \[x0\]
.*:	192017e0 	ldtclr	w0, w0, \[sp\]
.*:	1920141f 	sttclr	w0, \[x0\]
.*:	192017ff 	sttclr	w0, \[sp\]
.*:	193f1400 	ldtclr	wzr, w0, \[x0\]
.*:	193f17e0 	ldtclr	wzr, w0, \[sp\]
.*:	193f141f 	sttclr	wzr, \[x0\]
.*:	193f17ff 	sttclr	wzr, \[sp\]
.*:	1920141d 	ldtclr	w0, w29, \[x0\]
.*:	192017fd 	ldtclr	w0, w29, \[sp\]
.*:	193f141d 	ldtclr	wzr, w29, \[x0\]
.*:	193f17fd 	ldtclr	wzr, w29, \[sp\]
.*:	59201400 	ldtclr	x0, x0, \[x0\]
.*:	592017e0 	ldtclr	x0, x0, \[sp\]
.*:	5920141f 	sttclr	x0, \[x0\]
.*:	592017ff 	sttclr	x0, \[sp\]
.*:	593f1400 	ldtclr	xzr, x0, \[x0\]
.*:	593f17e0 	ldtclr	xzr, x0, \[sp\]
.*:	593f141f 	sttclr	xzr, \[x0\]
.*:	593f17ff 	sttclr	xzr, \[sp\]
.*:	5920141d 	ldtclr	x0, x29, \[x0\]
.*:	592017fd 	ldtclr	x0, x29, \[sp\]
.*:	593f141d 	ldtclr	xzr, x29, \[x0\]
.*:	593f17fd 	ldtclr	xzr, x29, \[sp\]

.* <sttclr>:
.*:	1920141f 	sttclr	w0, \[x0\]
.*:	192017ff 	sttclr	w0, \[sp\]
.*:	193f141f 	sttclr	wzr, \[x0\]
.*:	193f17ff 	sttclr	wzr, \[sp\]
.*:	5920141f 	sttclr	x0, \[x0\]
.*:	592017ff 	sttclr	x0, \[sp\]
.*:	593f141f 	sttclr	xzr, \[x0\]
.*:	593f17ff 	sttclr	xzr, \[sp\]

.* <ldtclra>:
.*:	19a01400 	ldtclra	w0, w0, \[x0\]
.*:	19a017e0 	ldtclra	w0, w0, \[sp\]
.*:	19a0141f 	ldtclra	w0, wzr, \[x0\]
.*:	19a017ff 	ldtclra	w0, wzr, \[sp\]
.*:	19bf1400 	ldtclra	wzr, w0, \[x0\]
.*:	19bf17e0 	ldtclra	wzr, w0, \[sp\]
.*:	19bf141f 	ldtclra	wzr, wzr, \[x0\]
.*:	19bf17ff 	ldtclra	wzr, wzr, \[sp\]
.*:	59a01400 	ldtclra	x0, x0, \[x0\]
.*:	59a017e0 	ldtclra	x0, x0, \[sp\]
.*:	59a0141f 	ldtclra	x0, xzr, \[x0\]
.*:	59a017ff 	ldtclra	x0, xzr, \[sp\]
.*:	59bf1400 	ldtclra	xzr, x0, \[x0\]
.*:	59bf17e0 	ldtclra	xzr, x0, \[sp\]
.*:	59bf141f 	ldtclra	xzr, xzr, \[x0\]
.*:	59bf17ff 	ldtclra	xzr, xzr, \[sp\]

.* <ldtclral>:
.*:	19e01400 	ldtclral	w0, w0, \[x0\]
.*:	19e017e0 	ldtclral	w0, w0, \[sp\]
.*:	19e0141f 	ldtclral	w0, wzr, \[x0\]
.*:	19e017ff 	ldtclral	w0, wzr, \[sp\]
.*:	19ff1400 	ldtclral	wzr, w0, \[x0\]
.*:	19ff17e0 	ldtclral	wzr, w0, \[sp\]
.*:	19ff141f 	ldtclral	wzr, wzr, \[x0\]
.*:	19ff17ff 	ldtclral	wzr, wzr, \[sp\]
.*:	59e01400 	ldtclral	x0, x0, \[x0\]
.*:	59e017e0 	ldtclral	x0, x0, \[sp\]
.*:	59e0141f 	ldtclral	x0, xzr, \[x0\]
.*:	59e017ff 	ldtclral	x0, xzr, \[sp\]
.*:	59ff1400 	ldtclral	xzr, x0, \[x0\]
.*:	59ff17e0 	ldtclral	xzr, x0, \[sp\]
.*:	59ff141f 	ldtclral	xzr, xzr, \[x0\]
.*:	59ff17ff 	ldtclral	xzr, xzr, \[sp\]

.* <ldtclrl>:
.*:	19601400 	ldtclrl	w0, w0, \[x0\]
.*:	196017e0 	ldtclrl	w0, w0, \[sp\]
.*:	1960141f 	sttclrl	w0, \[x0\]
.*:	196017ff 	sttclrl	w0, \[sp\]
.*:	197f1400 	ldtclrl	wzr, w0, \[x0\]
.*:	197f17e0 	ldtclrl	wzr, w0, \[sp\]
.*:	197f141f 	sttclrl	wzr, \[x0\]
.*:	197f17ff 	sttclrl	wzr, \[sp\]
.*:	1960141d 	ldtclrl	w0, w29, \[x0\]
.*:	196017fd 	ldtclrl	w0, w29, \[sp\]
.*:	197f141d 	ldtclrl	wzr, w29, \[x0\]
.*:	197f17fd 	ldtclrl	wzr, w29, \[sp\]
.*:	59601400 	ldtclrl	x0, x0, \[x0\]
.*:	596017e0 	ldtclrl	x0, x0, \[sp\]
.*:	5960141f 	sttclrl	x0, \[x0\]
.*:	596017ff 	sttclrl	x0, \[sp\]
.*:	597f1400 	ldtclrl	xzr, x0, \[x0\]
.*:	597f17e0 	ldtclrl	xzr, x0, \[sp\]
.*:	597f141f 	sttclrl	xzr, \[x0\]
.*:	597f17ff 	sttclrl	xzr, \[sp\]
.*:	5960141d 	ldtclrl	x0, x29, \[x0\]
.*:	596017fd 	ldtclrl	x0, x29, \[sp\]
.*:	597f141d 	ldtclrl	xzr, x29, \[x0\]
.*:	597f17fd 	ldtclrl	xzr, x29, \[sp\]

.* <sttclrl>:
.*:	1960141f 	sttclrl	w0, \[x0\]
.*:	196017ff 	sttclrl	w0, \[sp\]
.*:	197f141f 	sttclrl	wzr, \[x0\]
.*:	197f17ff 	sttclrl	wzr, \[sp\]
.*:	5960141f 	sttclrl	x0, \[x0\]
.*:	596017ff 	sttclrl	x0, \[sp\]
.*:	597f141f 	sttclrl	xzr, \[x0\]
.*:	597f17ff 	sttclrl	xzr, \[sp\]

.* <ldtset>:
.*:	19203400 	ldtset	w0, w0, \[x0\]
.*:	192037e0 	ldtset	w0, w0, \[sp\]
.*:	1920341f 	sttset	w0, \[x0\]
.*:	192037ff 	sttset	w0, \[sp\]
.*:	193f3400 	ldtset	wzr, w0, \[x0\]
.*:	193f37e0 	ldtset	wzr, w0, \[sp\]
.*:	193f341f 	sttset	wzr, \[x0\]
.*:	193f37ff 	sttset	wzr, \[sp\]
.*:	1920341d 	ldtset	w0, w29, \[x0\]
.*:	192037fd 	ldtset	w0, w29, \[sp\]
.*:	193f341d 	ldtset	wzr, w29, \[x0\]
.*:	193f37fd 	ldtset	wzr, w29, \[sp\]
.*:	59203400 	ldtset	x0, x0, \[x0\]
.*:	592037e0 	ldtset	x0, x0, \[sp\]
.*:	5920341f 	sttset	x0, \[x0\]
.*:	592037ff 	sttset	x0, \[sp\]
.*:	593f3400 	ldtset	xzr, x0, \[x0\]
.*:	593f37e0 	ldtset	xzr, x0, \[sp\]
.*:	593f341f 	sttset	xzr, \[x0\]
.*:	593f37ff 	sttset	xzr, \[sp\]
.*:	5920341d 	ldtset	x0, x29, \[x0\]
.*:	592037fd 	ldtset	x0, x29, \[sp\]
.*:	593f341d 	ldtset	xzr, x29, \[x0\]
.*:	593f37fd 	ldtset	xzr, x29, \[sp\]

.* <sttset>:
.*:	1920341f 	sttset	w0, \[x0\]
.*:	192037ff 	sttset	w0, \[sp\]
.*:	193f341f 	sttset	wzr, \[x0\]
.*:	193f37ff 	sttset	wzr, \[sp\]
.*:	5920341f 	sttset	x0, \[x0\]
.*:	592037ff 	sttset	x0, \[sp\]
.*:	593f341f 	sttset	xzr, \[x0\]
.*:	593f37ff 	sttset	xzr, \[sp\]

.* <ldtseta>:
.*:	19a03400 	ldtseta	w0, w0, \[x0\]
.*:	19a037e0 	ldtseta	w0, w0, \[sp\]
.*:	19a0341f 	ldtseta	w0, wzr, \[x0\]
.*:	19a037ff 	ldtseta	w0, wzr, \[sp\]
.*:	19bf3400 	ldtseta	wzr, w0, \[x0\]
.*:	19bf37e0 	ldtseta	wzr, w0, \[sp\]
.*:	19bf341f 	ldtseta	wzr, wzr, \[x0\]
.*:	19bf37ff 	ldtseta	wzr, wzr, \[sp\]
.*:	59a03400 	ldtseta	x0, x0, \[x0\]
.*:	59a037e0 	ldtseta	x0, x0, \[sp\]
.*:	59a0341f 	ldtseta	x0, xzr, \[x0\]
.*:	59a037ff 	ldtseta	x0, xzr, \[sp\]
.*:	59bf3400 	ldtseta	xzr, x0, \[x0\]
.*:	59bf37e0 	ldtseta	xzr, x0, \[sp\]
.*:	59bf341f 	ldtseta	xzr, xzr, \[x0\]
.*:	59bf37ff 	ldtseta	xzr, xzr, \[sp\]

.* <ldtsetal>:
.*:	19e03400 	ldtsetal	w0, w0, \[x0\]
.*:	19e037e0 	ldtsetal	w0, w0, \[sp\]
.*:	19e0341f 	ldtsetal	w0, wzr, \[x0\]
.*:	19e037ff 	ldtsetal	w0, wzr, \[sp\]
.*:	19ff3400 	ldtsetal	wzr, w0, \[x0\]
.*:	19ff37e0 	ldtsetal	wzr, w0, \[sp\]
.*:	19ff341f 	ldtsetal	wzr, wzr, \[x0\]
.*:	19ff37ff 	ldtsetal	wzr, wzr, \[sp\]
.*:	59e03400 	ldtsetal	x0, x0, \[x0\]
.*:	59e037e0 	ldtsetal	x0, x0, \[sp\]
.*:	59e0341f 	ldtsetal	x0, xzr, \[x0\]
.*:	59e037ff 	ldtsetal	x0, xzr, \[sp\]
.*:	59ff3400 	ldtsetal	xzr, x0, \[x0\]
.*:	59ff37e0 	ldtsetal	xzr, x0, \[sp\]
.*:	59ff341f 	ldtsetal	xzr, xzr, \[x0\]
.*:	59ff37ff 	ldtsetal	xzr, xzr, \[sp\]

.* <ldtsetl>:
.*:	19603400 	ldtsetl	w0, w0, \[x0\]
.*:	196037e0 	ldtsetl	w0, w0, \[sp\]
.*:	1960341f 	sttsetl	w0, \[x0\]
.*:	196037ff 	sttsetl	w0, \[sp\]
.*:	197f3400 	ldtsetl	wzr, w0, \[x0\]
.*:	197f37e0 	ldtsetl	wzr, w0, \[sp\]
.*:	197f341f 	sttsetl	wzr, \[x0\]
.*:	197f37ff 	sttsetl	wzr, \[sp\]
.*:	1960341d 	ldtsetl	w0, w29, \[x0\]
.*:	196037fd 	ldtsetl	w0, w29, \[sp\]
.*:	197f341d 	ldtsetl	wzr, w29, \[x0\]
.*:	197f37fd 	ldtsetl	wzr, w29, \[sp\]
.*:	59603400 	ldtsetl	x0, x0, \[x0\]
.*:	596037e0 	ldtsetl	x0, x0, \[sp\]
.*:	5960341f 	sttsetl	x0, \[x0\]
.*:	596037ff 	sttsetl	x0, \[sp\]
.*:	597f3400 	ldtsetl	xzr, x0, \[x0\]
.*:	597f37e0 	ldtsetl	xzr, x0, \[sp\]
.*:	597f341f 	sttsetl	xzr, \[x0\]
.*:	597f37ff 	sttsetl	xzr, \[sp\]
.*:	5960341d 	ldtsetl	x0, x29, \[x0\]
.*:	596037fd 	ldtsetl	x0, x29, \[sp\]
.*:	597f341d 	ldtsetl	xzr, x29, \[x0\]
.*:	597f37fd 	ldtsetl	xzr, x29, \[sp\]

.* <sttsetl>:
.*:	1960341f 	sttsetl	w0, \[x0\]
.*:	196037ff 	sttsetl	w0, \[sp\]
.*:	197f341f 	sttsetl	wzr, \[x0\]
.*:	197f37ff 	sttsetl	wzr, \[sp\]
.*:	5960341f 	sttsetl	x0, \[x0\]
.*:	596037ff 	sttsetl	x0, \[sp\]
.*:	597f341f 	sttsetl	xzr, \[x0\]
.*:	597f37ff 	sttsetl	xzr, \[sp\]

.* <ldtnp>:
.*:	e8400800 	ldtnp	x0, x2, \[x0\]
.*:	e87f8800 	ldtnp	x0, x2, \[x0, #-8\]
.*:	e8400be0 	ldtnp	x0, x2, \[sp\]
.*:	e87f8be0 	ldtnp	x0, x2, \[sp, #-8\]
.*:	e8407c00 	ldtnp	x0, xzr, \[x0\]
.*:	e87ffc00 	ldtnp	x0, xzr, \[x0, #-8\]
.*:	e8407fe0 	ldtnp	x0, xzr, \[sp\]
.*:	e87fffe0 	ldtnp	x0, xzr, \[sp, #-8\]
.*:	e840081f 	ldtnp	xzr, x2, \[x0\]
.*:	e87f881f 	ldtnp	xzr, x2, \[x0, #-8\]
.*:	e8400bff 	ldtnp	xzr, x2, \[sp\]
.*:	e87f8bff 	ldtnp	xzr, x2, \[sp, #-8\]
.*:	e840741f 	ldtnp	xzr, x29, \[x0\]
.*:	e87ff41f 	ldtnp	xzr, x29, \[x0, #-8\]
.*:	e84077ff 	ldtnp	xzr, x29, \[sp\]
.*:	e87ff7ff 	ldtnp	xzr, x29, \[sp, #-8\]
.*:	ec400800 	ldtnp	q0, q2, \[x0\]
.*:	ec7f8800 	ldtnp	q0, q2, \[x0, #-16\]
.*:	ec400be0 	ldtnp	q0, q2, \[sp\]
.*:	ec7f8be0 	ldtnp	q0, q2, \[sp, #-16\]
.*:	ec407c00 	ldtnp	q0, q31, \[x0\]
.*:	ec7ffc00 	ldtnp	q0, q31, \[x0, #-16\]
.*:	ec407fe0 	ldtnp	q0, q31, \[sp\]
.*:	ec7fffe0 	ldtnp	q0, q31, \[sp, #-16\]
.*:	ec40001f 	ldtnp	q31, q0, \[x0\]
.*:	ec7f801f 	ldtnp	q31, q0, \[x0, #-16\]
.*:	ec4003ff 	ldtnp	q31, q0, \[sp\]
.*:	ec7f83ff 	ldtnp	q31, q0, \[sp, #-16\]
.*:	ec40741f 	ldtnp	q31, q29, \[x0\]
.*:	ec7ff41f 	ldtnp	q31, q29, \[x0, #-16\]
.*:	ec4077ff 	ldtnp	q31, q29, \[sp\]
.*:	ec7ff7ff 	ldtnp	q31, q29, \[sp, #-16\]

.* <sttnp>:
.*:	e8000800 	sttnp	x0, x2, \[x0\]
.*:	e83f8800 	sttnp	x0, x2, \[x0, #-8\]
.*:	e8000be0 	sttnp	x0, x2, \[sp\]
.*:	e83f8be0 	sttnp	x0, x2, \[sp, #-8\]
.*:	e8007c00 	sttnp	x0, xzr, \[x0\]
.*:	e83ffc00 	sttnp	x0, xzr, \[x0, #-8\]
.*:	e8007fe0 	sttnp	x0, xzr, \[sp\]
.*:	e83fffe0 	sttnp	x0, xzr, \[sp, #-8\]
.*:	e800081f 	sttnp	xzr, x2, \[x0\]
.*:	e83f881f 	sttnp	xzr, x2, \[x0, #-8\]
.*:	e8000bff 	sttnp	xzr, x2, \[sp\]
.*:	e83f8bff 	sttnp	xzr, x2, \[sp, #-8\]
.*:	e800741f 	sttnp	xzr, x29, \[x0\]
.*:	e83ff41f 	sttnp	xzr, x29, \[x0, #-8\]
.*:	e80077ff 	sttnp	xzr, x29, \[sp\]
.*:	e83ff7ff 	sttnp	xzr, x29, \[sp, #-8\]
.*:	ec000800 	sttnp	q0, q2, \[x0\]
.*:	ec3f8800 	sttnp	q0, q2, \[x0, #-16\]
.*:	ec000be0 	sttnp	q0, q2, \[sp\]
.*:	ec3f8be0 	sttnp	q0, q2, \[sp, #-16\]
.*:	ec007c00 	sttnp	q0, q31, \[x0\]
.*:	ec3ffc00 	sttnp	q0, q31, \[x0, #-16\]
.*:	ec007fe0 	sttnp	q0, q31, \[sp\]
.*:	ec3fffe0 	sttnp	q0, q31, \[sp, #-16\]
.*:	ec00001f 	sttnp	q31, q0, \[x0\]
.*:	ec3f801f 	sttnp	q31, q0, \[x0, #-16\]
.*:	ec0003ff 	sttnp	q31, q0, \[sp\]
.*:	ec3f83ff 	sttnp	q31, q0, \[sp, #-16\]
.*:	ec00741f 	sttnp	q31, q29, \[x0\]
.*:	ec3ff41f 	sttnp	q31, q29, \[x0, #-16\]
.*:	ec0077ff 	sttnp	q31, q29, \[sp\]
.*:	ec3ff7ff 	sttnp	q31, q29, \[sp, #-16\]
