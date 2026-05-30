#name: F8F16MM SVE2 FMMLA instructions
#as: -march=armv8-a+sve2+f8f16mm
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	6460e000 	fmmla	z0.h, z0.b, z0.b
.*:	647fe000 	fmmla	z0.h, z0.b, z31.b
.*:	6460e3e0 	fmmla	z0.h, z31.b, z0.b
.*:	647fe3e0 	fmmla	z0.h, z31.b, z31.b
.*:	6460e01f 	fmmla	z31.h, z0.b, z0.b
.*:	647fe01f 	fmmla	z31.h, z0.b, z31.b
.*:	6460e3ff 	fmmla	z31.h, z31.b, z0.b
.*:	647fe3ff 	fmmla	z31.h, z31.b, z31.b

.* <b>:
.*:	0420bde0 	movprfx	z0, z15
.*:	6461e020 	fmmla	z0.h, z1.b, z1.b
.*:	0420bde0 	movprfx	z0, z15
.*:	647fe020 	fmmla	z0.h, z1.b, z31.b
.*:	0420bde0 	movprfx	z0, z15
.*:	6461e3e0 	fmmla	z0.h, z31.b, z1.b
.*:	0420bde0 	movprfx	z0, z15
.*:	647fe3e0 	fmmla	z0.h, z31.b, z31.b
.*:	0420bdff 	movprfx	z31, z15
.*:	6460e01f 	fmmla	z31.h, z0.b, z0.b
.*:	0420bdff 	movprfx	z31, z15
.*:	647ee01f 	fmmla	z31.h, z0.b, z30.b
.*:	0420bdff 	movprfx	z31, z15
.*:	6460e3df 	fmmla	z31.h, z30.b, z0.b
.*:	0420bdff 	movprfx	z31, z15
.*:	647ee3df 	fmmla	z31.h, z30.b, z30.b
