#as: -march=armv8-a+sme2
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
[^:]+:	25208200 	cntp	x0, pn0\.b, vlx2
[^:]+:	25208200 	cntp	x0, pn0\.b, vlx2
[^:]+:	2520821e 	cntp	x30, pn0\.b, vlx2
[^:]+:	2520821f 	cntp	xzr, pn0\.b, vlx2
[^:]+:	252083e0 	cntp	x0, pn15\.b, vlx2
[^:]+:	25208600 	cntp	x0, pn0\.b, vlx4
[^:]+:	252087ab 	cntp	x11, pn13\.b, vlx4
[^:]+:	25608200 	cntp	x0, pn0\.h, vlx2
[^:]+:	25608200 	cntp	x0, pn0\.h, vlx2
[^:]+:	2560821e 	cntp	x30, pn0\.h, vlx2
[^:]+:	2560821f 	cntp	xzr, pn0\.h, vlx2
[^:]+:	256083e0 	cntp	x0, pn15\.h, vlx2
[^:]+:	25608600 	cntp	x0, pn0\.h, vlx4
[^:]+:	25608334 	cntp	x20, pn9\.h, vlx2
[^:]+:	25a08200 	cntp	x0, pn0\.s, vlx2
[^:]+:	25a08200 	cntp	x0, pn0\.s, vlx2
[^:]+:	25a0821e 	cntp	x30, pn0\.s, vlx2
[^:]+:	25a0821f 	cntp	xzr, pn0\.s, vlx2
[^:]+:	25a083e0 	cntp	x0, pn15\.s, vlx2
[^:]+:	25a08600 	cntp	x0, pn0\.s, vlx4
[^:]+:	25a0870f 	cntp	x15, pn8\.s, vlx4
[^:]+:	25e08200 	cntp	x0, pn0\.d, vlx2
[^:]+:	25e08200 	cntp	x0, pn0\.d, vlx2
[^:]+:	25e0821e 	cntp	x30, pn0\.d, vlx2
[^:]+:	25e0821f 	cntp	xzr, pn0\.d, vlx2
[^:]+:	25e083e0 	cntp	x0, pn15\.d, vlx2
[^:]+:	25e08600 	cntp	x0, pn0\.d, vlx4
[^:]+:	25e082a4 	cntp	x4, pn5\.d, vlx2
[^:]+:	25207010 	pext	p0\.b, pn8\[0\]
[^:]+:	25207010 	pext	p0\.b, pn8\[0\]
[^:]+:	2520701f 	pext	p15\.b, pn8\[0\]
[^:]+:	252070f0 	pext	p0\.b, pn15\[0\]
[^:]+:	25207310 	pext	p0\.b, pn8\[3\]
[^:]+:	25207274 	pext	p4\.b, pn11\[2\]
[^:]+:	25607010 	pext	p0\.h, pn8\[0\]
[^:]+:	25607010 	pext	p0\.h, pn8\[0\]
[^:]+:	2560701f 	pext	p15\.h, pn8\[0\]
[^:]+:	256070f0 	pext	p0\.h, pn15\[0\]
[^:]+:	25607310 	pext	p0\.h, pn8\[3\]
[^:]+:	256071d5 	pext	p5\.h, pn14\[1\]
[^:]+:	25a07010 	pext	p0\.s, pn8\[0\]
[^:]+:	25a07010 	pext	p0\.s, pn8\[0\]
[^:]+:	25a0701f 	pext	p15\.s, pn8\[0\]
[^:]+:	25a070f0 	pext	p0\.s, pn15\[0\]
[^:]+:	25a07310 	pext	p0\.s, pn8\[3\]
[^:]+:	25a07256 	pext	p6\.s, pn10\[2\]
[^:]+:	25e07010 	pext	p0\.d, pn8\[0\]
[^:]+:	25e07010 	pext	p0\.d, pn8\[0\]
[^:]+:	25e0701f 	pext	p15\.d, pn8\[0\]
[^:]+:	25e070f0 	pext	p0\.d, pn15\[0\]
[^:]+:	25e07310 	pext	p0\.d, pn8\[3\]
[^:]+:	25e07137 	pext	p7\.d, pn9\[1\]
[^:]+:	25207410 	pext	{p0\.b-p1\.b}, pn8\[0\]
[^:]+:	25207410 	pext	{p0\.b-p1\.b}, pn8\[0\]
[^:]+:	25207410 	pext	{p0\.b-p1\.b}, pn8\[0\]
[^:]+:	2520741e 	pext	{p14\.b-p15\.b}, pn8\[0\]
[^:]+:	2520741f 	pext	{p15\.b-p0\.b}, pn8\[0\]
[^:]+:	2520741f 	pext	{p15\.b-p0\.b}, pn8\[0\]
[^:]+:	252074f0 	pext	{p0\.b-p1\.b}, pn15\[0\]
[^:]+:	25207510 	pext	{p0\.b-p1\.b}, pn8\[1\]
[^:]+:	25207497 	pext	{p7\.b-p8\.b}, pn12\[0\]
[^:]+:	25607410 	pext	{p0\.h-p1\.h}, pn8\[0\]
[^:]+:	25607410 	pext	{p0\.h-p1\.h}, pn8\[0\]
[^:]+:	25607410 	pext	{p0\.h-p1\.h}, pn8\[0\]
[^:]+:	2560741e 	pext	{p14\.h-p15\.h}, pn8\[0\]
[^:]+:	2560741f 	pext	{p15\.h-p0\.h}, pn8\[0\]
[^:]+:	2560741f 	pext	{p15\.h-p0\.h}, pn8\[0\]
[^:]+:	256074f0 	pext	{p0\.h-p1\.h}, pn15\[0\]
[^:]+:	25607510 	pext	{p0\.h-p1\.h}, pn8\[1\]
[^:]+:	256074d2 	pext	{p2\.h-p3\.h}, pn14\[0\]
[^:]+:	25a07410 	pext	{p0\.s-p1\.s}, pn8\[0\]
[^:]+:	25a07410 	pext	{p0\.s-p1\.s}, pn8\[0\]
[^:]+:	25a07410 	pext	{p0\.s-p1\.s}, pn8\[0\]
[^:]+:	25a0741e 	pext	{p14\.s-p15\.s}, pn8\[0\]
[^:]+:	25a0741f 	pext	{p15\.s-p0\.s}, pn8\[0\]
[^:]+:	25a0741f 	pext	{p15\.s-p0\.s}, pn8\[0\]
[^:]+:	25a074f0 	pext	{p0\.s-p1\.s}, pn15\[0\]
[^:]+:	25a07510 	pext	{p0\.s-p1\.s}, pn8\[1\]
[^:]+:	25a074b5 	pext	{p5\.s-p6\.s}, pn13\[0\]
[^:]+:	25e07410 	pext	{p0\.d-p1\.d}, pn8\[0\]
[^:]+:	25e07410 	pext	{p0\.d-p1\.d}, pn8\[0\]
[^:]+:	25e07410 	pext	{p0\.d-p1\.d}, pn8\[0\]
[^:]+:	25e0741e 	pext	{p14\.d-p15\.d}, pn8\[0\]
[^:]+:	25e0741f 	pext	{p15\.d-p0\.d}, pn8\[0\]
[^:]+:	25e0741f 	pext	{p15\.d-p0\.d}, pn8\[0\]
[^:]+:	25e074f0 	pext	{p0\.d-p1\.d}, pn15\[0\]
[^:]+:	25e07510 	pext	{p0\.d-p1\.d}, pn8\[1\]
[^:]+:	25e0743c 	pext	{p12\.d-p13\.d}, pn9\[0\]
[^:]+:	25207810 	ptrue	pn8\.b
[^:]+:	25207813 	ptrue	pn11\.b
[^:]+:	25207817 	ptrue	pn15\.b
[^:]+:	25607810 	ptrue	pn8\.h
[^:]+:	25607811 	ptrue	pn9\.h
[^:]+:	25607817 	ptrue	pn15\.h
[^:]+:	25a07810 	ptrue	pn8\.s
[^:]+:	25a07816 	ptrue	pn14\.s
[^:]+:	25a07817 	ptrue	pn15\.s
[^:]+:	25e07810 	ptrue	pn8\.d
[^:]+:	25e07814 	ptrue	pn12\.d
[^:]+:	25e07817 	ptrue	pn15\.d
