#objdump: -dr
#as: -march=armv8-a+poe2

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	d5800020 	tchangef	x0, x1
.*:	d580001f 	tchangef	xzr, x0
.*:	d58003e1 	tchangef	x1, xzr
.*:	d5820020 	tchangef	x0, x1, nb
.*:	d582001f 	tchangef	xzr, x0, nb
.*:	d58203e0 	tchangef	x0, xzr, nb
.*:	d58201e0 	tchangef	x0, x15, nb
.*:	d5900000 	tchangef	x0, #0x0
.*:	d590003f 	tchangef	xzr, #0x1
.*:	d5900fea 	tchangef	x10, #0x7f
.*:	d5920000 	tchangef	x0, #0x0, nb
.*:	d592003f 	tchangef	xzr, #0x1, nb
.*:	d59207fe 	tchangef	x30, #0x3f, nb
.*:	d5920fea 	tchangef	x10, #0x7f, nb
.*:	d5840020 	tchangeb	x0, x1
.*:	d584001f 	tchangeb	xzr, x0
.*:	d58403e0 	tchangeb	x0, xzr
.*:	d5860020 	tchangeb	x0, x1, nb
.*:	d586001f 	tchangeb	xzr, x0, nb
.*:	d58603e0 	tchangeb	x0, xzr, nb
.*:	d58601e0 	tchangeb	x0, x15, nb
.*:	d5940000 	tchangeb	x0, #0x0
.*:	d594003f 	tchangeb	xzr, #0x1
.*:	d5940fea 	tchangeb	x10, #0x7f
.*:	d5960000 	tchangeb	x0, #0x0, nb
.*:	d596003f 	tchangeb	xzr, #0x1, nb
.*:	d59607fe 	tchangeb	x30, #0x3f, nb
.*:	d5960fef 	tchangeb	x15, #0x7f, nb
