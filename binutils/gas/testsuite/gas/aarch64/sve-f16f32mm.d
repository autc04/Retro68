#name: SVE_F16F32MM FMMLA instructions
#as: -march=armv8-a+sve-f16f32mm
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <a>:
.*:	6420e400 	fmmla	z0.s, z0.h, z0.h
.*:	643fe400 	fmmla	z0.s, z0.h, z31.h
.*:	6420e7e0 	fmmla	z0.s, z31.h, z0.h
.*:	643fe7e0 	fmmla	z0.s, z31.h, z31.h
.*:	6420e41f 	fmmla	z31.s, z0.h, z0.h
.*:	643fe41f 	fmmla	z31.s, z0.h, z31.h
.*:	6420e7ff 	fmmla	z31.s, z31.h, z0.h
.*:	643fe7ff 	fmmla	z31.s, z31.h, z31.h

.* <b>:
.*:	0420bde0 	movprfx	z0, z15
.*:	6421e420 	fmmla	z0.s, z1.h, z1.h
.*:	0420bde0 	movprfx	z0, z15
.*:	643fe420 	fmmla	z0.s, z1.h, z31.h
.*:	0420bde0 	movprfx	z0, z15
.*:	6421e7e0 	fmmla	z0.s, z31.h, z1.h
.*:	0420bde0 	movprfx	z0, z15
.*:	643fe7e0 	fmmla	z0.s, z31.h, z31.h
.*:	0420bdff 	movprfx	z31, z15
.*:	6420e41f 	fmmla	z31.s, z0.h, z0.h
.*:	0420bdff 	movprfx	z31, z15
.*:	643ee41f 	fmmla	z31.s, z0.h, z30.h
.*:	0420bdff 	movprfx	z31, z15
.*:	6420e7df 	fmmla	z31.s, z30.h, z0.h
.*:	0420bdff 	movprfx	z31, z15
.*:	643ee7df 	fmmla	z31.s, z30.h, z30.h
