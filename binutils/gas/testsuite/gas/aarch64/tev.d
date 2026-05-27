#objdump: -dr
#as: -march=armv8-a+tev

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	d4e00000 	tenter	#0x0
.*:	d4e00020 	tenter	#0x1
.*:	d4e00060 	tenter	#0x3
.*:	d4e000e0 	tenter	#0x7
.*:	d4e001e0 	tenter	#0xf
.*:	d4e003e0 	tenter	#0x1f
.*:	d4e007e0 	tenter	#0x3f
.*:	d4e00fe0 	tenter	#0x7f
.*:	d4e20000 	tenter	#0x0, nb
.*:	d4e20020 	tenter	#0x1, nb
.*:	d4e20060 	tenter	#0x3, nb
.*:	d4e200e0 	tenter	#0x7, nb
.*:	d4e201e0 	tenter	#0xf, nb
.*:	d4e203e0 	tenter	#0x1f, nb
.*:	d4e207e0 	tenter	#0x3f, nb
.*:	d4e20fe0 	tenter	#0x7f, nb
.*:	d6ff03e0 	texit
.*:	d6ff07e0 	texit	nb
.*:	d6ff07e0 	texit	nb
.*:	d6ff07e0 	texit	nb
.*:	d6ff07e0 	texit	nb
