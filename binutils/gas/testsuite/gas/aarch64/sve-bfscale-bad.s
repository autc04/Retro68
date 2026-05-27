bfscale:
	bfscale	z0.h, p0/m, z1.h, z0.h
	bfscale	z0.h, p0/z, z0.h, z0.h
	bfscale	{z0.h-z1.h}, {z0.h-z2.h}, z0.h
	bfscale	{z0.h-z2.h}, {z0.h-z2.h}, z0.h
	bfscale	{z0.h-z4.h}, {z0.h-z4.h}, z0.h
	bfscale	{z0.h-z1.h}, {z0.h-z2.h}, {z0.h-z1.h}
	bfscale	{z0.h-z2.h}, {z0.h-z2.h}, {z0.h-z1.h}
	bfscale	{z0.h-z4.h}, {z0.h-z4.h}, {z0.h-z1.h}
	bfscale	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z2.h}
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z1.h}
	bfscale	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z4.h}

bfmul:
	bfmul	{z0.h-z1.h}, {z0.h-z2.h}, z0.h
	bfmul	{z0.h-z2.h}, {z0.h-z1.h}, z0.h
	bfmul	{z0.h-z3.h}, {z0.h-z2.h}, z0.h
	bfmul	{z0.h-z3.h}, {z0.h-z1.h}, z0.h
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, z16.h
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, z16.h
	bfmul	{z0.h-z1.h}, {z0.h-z2.h}, {z0.h-z1.h}
	bfmul	{z0.h-z2.h}, {z0.h-z1.h}, {z0.h-z1.h}
	bfmul	{z0.h-z3.h}, {z0.h-z2.h}, {z0.h-z3.h}
	bfmul	{z0.h-z3.h}, {z0.h-z1.h}, {z0.h-z3.h}
	bfmul	{z0.h-z1.h}, {z0.h-z1.h}, {z0.h-z2.h}
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z2.h}
	bfmul	{z0.h-z3.h}, {z0.h-z3.h}, {z0.h-z3.h}
