#name: FEAT_SVE_BFSCALE instruction test
#as: -march=armv8-a+sve-bfscale+sve2
#objdump: -dr

.*:     file format .*


Disassembly of section .*:

.* <bfscale>:
.*:	65098000 	bfscale	z0.h, p0/m, z0.h, z0.h
.*:	650983e0 	bfscale	z0.h, p0/m, z0.h, z31.h
.*:	65099c00 	bfscale	z0.h, p7/m, z0.h, z0.h
.*:	65099fe0 	bfscale	z0.h, p7/m, z0.h, z31.h
.*:	6509801f 	bfscale	z31.h, p0/m, z31.h, z0.h
.*:	650983ff 	bfscale	z31.h, p0/m, z31.h, z31.h
.*:	65099c1f 	bfscale	z31.h, p7/m, z31.h, z0.h
.*:	65099fff 	bfscale	z31.h, p7/m, z31.h, z31.h
.*:	0420bde0 	movprfx	z0, z15
.*:	65098020 	bfscale	z0.h, p0/m, z0.h, z1.h
.*:	0420bde0 	movprfx	z0, z15
.*:	650983e0 	bfscale	z0.h, p0/m, z0.h, z31.h
.*:	0420bde0 	movprfx	z0, z15
.*:	65099c20 	bfscale	z0.h, p7/m, z0.h, z1.h
.*:	0420bde0 	movprfx	z0, z15
.*:	65099fe0 	bfscale	z0.h, p7/m, z0.h, z31.h
.*:	0420bdff 	movprfx	z31, z15
.*:	6509801f 	bfscale	z31.h, p0/m, z31.h, z0.h
.*:	0420bdff 	movprfx	z31, z15
.*:	650983df 	bfscale	z31.h, p0/m, z31.h, z30.h
.*:	0420bdff 	movprfx	z31, z15
.*:	65099c1f 	bfscale	z31.h, p7/m, z31.h, z0.h
.*:	0420bdff 	movprfx	z31, z15
.*:	65099fdf 	bfscale	z31.h, p7/m, z31.h, z30.h
.*:	045021e0 	movprfx	z0.h, p0/z, z15.h
.*:	65098020 	bfscale	z0.h, p0/m, z0.h, z1.h
.*:	045121e0 	movprfx	z0.h, p0/m, z15.h
.*:	650983e0 	bfscale	z0.h, p0/m, z0.h, z31.h
.*:	04503de0 	movprfx	z0.h, p7/z, z15.h
.*:	65099c20 	bfscale	z0.h, p7/m, z0.h, z1.h
.*:	04513de0 	movprfx	z0.h, p7/m, z15.h
.*:	65099fe0 	bfscale	z0.h, p7/m, z0.h, z31.h
.*:	045021ff 	movprfx	z31.h, p0/z, z15.h
.*:	6509801f 	bfscale	z31.h, p0/m, z31.h, z0.h
.*:	045121ff 	movprfx	z31.h, p0/m, z15.h
.*:	650983df 	bfscale	z31.h, p0/m, z31.h, z30.h
.*:	04503dff 	movprfx	z31.h, p7/z, z15.h
.*:	65099c1f 	bfscale	z31.h, p7/m, z31.h, z0.h
.*:	04513dff 	movprfx	z31.h, p7/m, z15.h
.*:	65099fdf 	bfscale	z31.h, p7/m, z31.h, z30.h
