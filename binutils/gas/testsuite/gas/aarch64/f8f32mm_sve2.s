a:
	fmmla	z0.s, z0.b, z0.b
	fmmla	z0.s, z0.b, z31.b
	fmmla	z0.s, z31.b, z0.b
	fmmla	z0.s, z31.b, z31.b
	fmmla	z31.s, z0.b, z0.b
	fmmla	z31.s, z0.b, z31.b
	fmmla	z31.s, z31.b, z0.b
	fmmla	z31.s, z31.b, z31.b

b:
	movprfx	z0, z15
	fmmla	z0.s, z1.b, z1.b
	movprfx	z0, z15
	fmmla	z0.s, z1.b, z31.b
	movprfx	z0, z15
	fmmla	z0.s, z31.b, z1.b
	movprfx	z0, z15
	fmmla	z0.s, z31.b, z31.b
	movprfx	z31, z15
	fmmla	z31.s, z0.b, z0.b
	movprfx	z31, z15
	fmmla	z31.s, z0.b, z30.b
	movprfx	z31, z15
	fmmla	z31.s, z30.b, z0.b
	movprfx	z31, z15
	fmmla	z31.s, z30.b, z30.b
