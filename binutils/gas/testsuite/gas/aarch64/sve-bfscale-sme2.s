bfscale:
	bfscale	z0.h, p0/m, z0.h, z0.h
	bfscale	z0.h, p0/m, z0.h, z31.h
	bfscale	z0.h, p7/m, z0.h, z0.h
	bfscale	z0.h, p7/m, z0.h, z31.h
	bfscale	z31.h, p0/m, z31.h, z0.h
	bfscale	z31.h, p0/m, z31.h, z31.h
	bfscale	z31.h, p7/m, z31.h, z0.h
	bfscale	z31.h, p7/m, z31.h, z31.h

bfscale_2x1:
	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, z0.h
	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, z15.h
	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, z0.h
	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, z15.h

bfscale_4x1:
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, z0.h
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, z15.h
	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, z0.h
	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, z15.h

bfscale_2x2:
	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z1.h}
	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, {z30.h-z31.h}
	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, {z0.h-z1.h}
	bfscale	{z30.h-z31.h}, {z30.h-z31.h}, {z30.h-z31.h}

bfscale_4x4:
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z3.h}
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z28.h-z31.h}
	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, {z0.h-z3.h}
	bfscale	{z28.h-z31.h}, {z28.h-z31.h}, {z28.h-z31.h}

bfmul_2x1:
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, z0.h
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, z15.h
	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, z0.h
	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, z15.h

bfmul_4x1:
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z0.h
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z15.h
	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, z0.h
	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, z15.h

bfmul_2x2:
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z1.h}
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, {z30.h-z31.h}
	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, {z0.h-z1.h}
	bfmul	{z30.h-z31.h}, {z30.h-z31.h}, {z30.h-z31.h}

bfmul_4x4:
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z3.h}
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z28.h-z31.h}
	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, {z0.h-z3.h}
	bfmul	{z28.h-z31.h}, {z28.h-z31.h}, {z28.h-z31.h}
