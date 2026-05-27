#name: Test of SVE2.1 ld1q/st1q instructions.
#as: -march=armv9.4-a
#as: -march=armv8-a+sve2p1
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	c400a000 	ld1q	{z0.q}, p0/z, \[z0.d, x0\]
.*:	c400a01f 	ld1q	{z31.q}, p0/z, \[z0.d, x0\]
.*:	c400bc00 	ld1q	{z0.q}, p7/z, \[z0.d, x0\]
.*:	c400a3e0 	ld1q	{z0.q}, p0/z, \[z31.d, x0\]
.*:	c41ea000 	ld1q	{z0.q}, p0/z, \[z0.d, x30\]
.*:	c41fa000 	ld1q	{z0.q}, p0/z, \[z0.d\]
.*:	c41fa000 	ld1q	{z0.q}, p0/z, \[z0.d\]
.*:	c41ebfff 	ld1q	{z31.q}, p7/z, \[z31.d, x30\]
.*:	c404acef 	ld1q	{z15.q}, p3/z, \[z7.d, x4\]
.*:	e4202000 	st1q	{z0.q}, p0, \[z0.d, x0\]
.*:	e420201f 	st1q	{z31.q}, p0, \[z0.d, x0\]
.*:	e4203c00 	st1q	{z0.q}, p7, \[z0.d, x0\]
.*:	e42023e0 	st1q	{z0.q}, p0, \[z31.d, x0\]
.*:	e43e2000 	st1q	{z0.q}, p0, \[z0.d, x30\]
.*:	e43f2000 	st1q	{z0.q}, p0, \[z0.d\]
.*:	e43f2000 	st1q	{z0.q}, p0, \[z0.d\]
.*:	e43e3fff 	st1q	{z31.q}, p7, \[z31.d, x30\]
.*:	e4242cef 	st1q	{z15.q}, p3, \[z7.d, x4\]
