	fmmla	z0.s, z0.h, z0
	fmmla	z0.s, z0.b, z0
	fmmla	z0.h, z0.b, z0
	fmmla	z0, z0, z0
	bfscale	z0.h, p0/m, z0, z0.h
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z0
	smmla	z0.s, z0.b, z0
	ld1rob	{z0.b}, p0, [x0]
	fmmla	z0.d, z0.d, z0
	fmmla	z0.s, z0, z0.s
	luti2	z0, {z0.b}, z0[0]
	luti4	{z0-z3}, zt0, {z0-z1}
	luti4	{z0, z4, z8, z12}, zt0, {z0-z1}
