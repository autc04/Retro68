#name: Test of FEAT_SME_F16F16 fmopa and fmops instructions.
#as: -march=armv8-a+sme-f16f16
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	81800008 	fmopa	za0.h, p0/m, p0/m, z0.h, z0.h
.*:	81800009 	fmopa	za1.h, p0/m, p0/m, z0.h, z0.h
.*:	81801c08 	fmopa	za0.h, p7/m, p0/m, z0.h, z0.h
.*:	8180e008 	fmopa	za0.h, p0/m, p7/m, z0.h, z0.h
.*:	818003e8 	fmopa	za0.h, p0/m, p0/m, z31.h, z0.h
.*:	819f0008 	fmopa	za0.h, p0/m, p0/m, z0.h, z31.h
.*:	819fffe9 	fmopa	za1.h, p7/m, p7/m, z31.h, z31.h
.*:	818fad48 	fmopa	za0.h, p3/m, p5/m, z10.h, z15.h
.*:	819965e9 	fmopa	za1.h, p1/m, p3/m, z15.h, z25.h
.*:	81800018 	fmops	za0.h, p0/m, p0/m, z0.h, z0.h
.*:	81800019 	fmops	za1.h, p0/m, p0/m, z0.h, z0.h
.*:	81801c18 	fmops	za0.h, p7/m, p0/m, z0.h, z0.h
.*:	8180e018 	fmops	za0.h, p0/m, p7/m, z0.h, z0.h
.*:	818003f8 	fmops	za0.h, p0/m, p0/m, z31.h, z0.h
.*:	819f0018 	fmops	za0.h, p0/m, p0/m, z0.h, z31.h
.*:	819ffff9 	fmops	za1.h, p7/m, p7/m, z31.h, z31.h
.*:	818fad58 	fmops	za0.h, p3/m, p5/m, z10.h, z15.h
.*:	819965f9 	fmops	za1.h, p1/m, p3/m, z15.h, z25.h
