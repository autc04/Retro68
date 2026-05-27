a:
	fmmla	z0.h, z0.b, z0.b
	fmmla	z0.h, z0.b, z31.b
	fmmla	z0.h, z31.b, z0.b
	fmmla	z0.h, z31.b, z31.b
	fmmla	z31.h, z0.b, z0.b
	fmmla	z31.h, z0.b, z31.b
	fmmla	z31.h, z31.b, z0.b
	fmmla	z31.h, z31.b, z31.b

b:
	movprfx	z0, z15
	fmmla	z0.h, z1.b, z1.b
	movprfx	z0, z15
	fmmla	z0.h, z1.b, z31.b
	movprfx	z0, z15
	fmmla	z0.h, z31.b, z1.b
	movprfx	z0, z15
	fmmla	z0.h, z31.b, z31.b
	movprfx	z31, z15
	fmmla	z31.h, z0.b, z0.b
	movprfx	z31, z15
	fmmla	z31.h, z0.b, z30.b
	movprfx	z31, z15
	fmmla	z31.h, z30.b, z0.b
	movprfx	z31, z15
	fmmla	z31.h, z30.b, z30.b
