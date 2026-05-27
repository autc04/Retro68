#name: SVE_BFSCALE + SME2 instructions test
#as: -march=armv8-a+sve-bfscale+sme2
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

.* <bfscale_2x1>:
.*:	c120a180 	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, z0.h
.*:	c12fa180 	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, z15.h
.*:	c120a19e 	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, z0.h
.*:	c12fa19e 	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, z15.h

.* <bfscale_4x1>:
.*:	c120a980 	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, z0.h
.*:	c12fa980 	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, z15.h
.*:	c120a99c 	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, z0.h
.*:	c12fa99c 	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, z15.h

.* <bfscale_2x2>:
.*:	c120b180 	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z1.h}
.*:	c13eb180 	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, {z30.h-z31.h}
.*:	c120b19e 	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, {z0.h-z1.h}
.*:	c13eb19e 	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, {z30.h-z31.h}

.* <bfscale_4x4>:
.*:	c120b980 	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z3.h}
.*:	c13cb980 	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z28.h-z31.h}
.*:	c120b99c 	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, {z0.h-z3.h}
.*:	c13cb99c 	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, {z28.h-z31.h}

.* <bfmul_2x1>:
.*:	c120e800 	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, z0.h
.*:	c13ee800 	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, z15.h
.*:	c120ebde 	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, z0.h
.*:	c13eebde 	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, z15.h

.* <bfmul_4x1>:
.*:	c121e800 	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z0.h
.*:	c13fe800 	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z15.h
.*:	c121eb9c 	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, z0.h
.*:	c13feb9c 	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, z15.h

.* <bfmul_2x2>:
.*:	c120e400 	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z1.h}
.*:	c13ee400 	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, {z30.h-z31.h}
.*:	c120e7de 	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, {z0.h-z1.h}
.*:	c13ee7de 	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, {z30.h-z31.h}

.* <bfmul_4x4>:
.*:	c121e400 	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z3.h}
.*:	c13de400 	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z28.h-z31.h}
.*:	c121e79c 	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, {z0.h-z3.h}
.*:	c13de79c 	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, {z28.h-z31.h}
