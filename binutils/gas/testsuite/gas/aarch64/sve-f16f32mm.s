a:
	fmmla	z0.s, z0.h, z0.h
	fmmla	z0.s, z0.h, z31.h
	fmmla	z0.s, z31.h, z0.h
	fmmla	z0.s, z31.h, z31.h
	fmmla	z31.s, z0.h, z0.h
	fmmla	z31.s, z0.h, z31.h
	fmmla	z31.s, z31.h, z0.h
	fmmla	z31.s, z31.h, z31.h

b:
	movprfx	z0, z15
	fmmla	z0.s, z1.h, z1.h
	movprfx	z0, z15
	fmmla	z0.s, z1.h, z31.h
	movprfx	z0, z15
	fmmla	z0.s, z31.h, z1.h
	movprfx	z0, z15
	fmmla	z0.s, z31.h, z31.h
	movprfx	z31, z15
	fmmla	z31.s, z0.h, z0.h
	movprfx	z31, z15
	fmmla	z31.s, z0.h, z30.h
	movprfx	z31, z15
	fmmla	z31.s, z30.h, z0.h
	movprfx	z31, z15
	fmmla	z31.s, z30.h, z30.h
