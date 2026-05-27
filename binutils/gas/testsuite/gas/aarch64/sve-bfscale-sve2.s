bfscale:
	bfscale	z0.h, p0/m, z0.h, z0.h
	bfscale	z0.h, p0/m, z0.h, z31.h
	bfscale	z0.h, p7/m, z0.h, z0.h
	bfscale	z0.h, p7/m, z0.h, z31.h
	bfscale	z31.h, p0/m, z31.h, z0.h
	bfscale	z31.h, p0/m, z31.h, z31.h
	bfscale	z31.h, p7/m, z31.h, z0.h
	bfscale	z31.h, p7/m, z31.h, z31.h

	movprfx	z0, z15
	bfscale	z0.h, p0/m, z0.h, z1.h
	movprfx	z0, z15
	bfscale	z0.h, p0/m, z0.h, z31.h
	movprfx	z0, z15
	bfscale	z0.h, p7/m, z0.h, z1.h
	movprfx	z0, z15
	bfscale	z0.h, p7/m, z0.h, z31.h
	movprfx	z31, z15
	bfscale	z31.h, p0/m, z31.h, z0.h
	movprfx	z31, z15
	bfscale	z31.h, p0/m, z31.h, z30.h
	movprfx	z31, z15
	bfscale	z31.h, p7/m, z31.h, z0.h
	movprfx	z31, z15
	bfscale	z31.h, p7/m, z31.h, z30.h

	movprfx	z0.h, p0/z, z15.h
	bfscale	z0.h, p0/m, z0.h, z1.h
	movprfx	z0.h, p0/m, z15.h
	bfscale	z0.h, p0/m, z0.h, z31.h
	movprfx	z0.h, p7/z, z15.h
	bfscale	z0.h, p7/m, z0.h, z1.h
	movprfx	z0.h, p7/m, z15.h
	bfscale	z0.h, p7/m, z0.h, z31.h
	movprfx	z31.h, p0/z, z15.h
	bfscale	z31.h, p0/m, z31.h, z0.h
	movprfx	z31.h, p0/m, z15.h
	bfscale	z31.h, p0/m, z31.h, z30.h
	movprfx	z31.h, p7/z, z15.h
	bfscale	z31.h, p7/m, z31.h, z0.h
	movprfx	z31.h, p7/m, z15.h
	bfscale	z31.h, p7/m, z31.h, z30.h
