#as: -march=armv8-a+sme2p2
#objdump: -dr

.*:     file format .*


Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	c160e800 	fmul	{z0\.h-z1\.h}, {z0\.h-z1\.h}, z0\.h
 *[0-9a-f]+:	c160e81e 	fmul	{z30\.h-z31\.h}, {z0\.h-z1\.h}, z0\.h
 *[0-9a-f]+:	c160ebc0 	fmul	{z0\.h-z1\.h}, {z30\.h-z31\.h}, z0\.h
 *[0-9a-f]+:	c17ee800 	fmul	{z0\.h-z1\.h}, {z0\.h-z1\.h}, z15\.h
 *[0-9a-f]+:	c1a0e800 	fmul	{z0\.s-z1\.s}, {z0\.s-z1\.s}, z0\.s
 *[0-9a-f]+:	c1a0e81e 	fmul	{z30\.s-z31\.s}, {z0\.s-z1\.s}, z0\.s
 *[0-9a-f]+:	c1a0ebc0 	fmul	{z0\.s-z1\.s}, {z30\.s-z31\.s}, z0\.s
 *[0-9a-f]+:	c1bee800 	fmul	{z0\.s-z1\.s}, {z0\.s-z1\.s}, z15\.s
 *[0-9a-f]+:	c1e0e800 	fmul	{z0\.d-z1\.d}, {z0\.d-z1\.d}, z0\.d
 *[0-9a-f]+:	c1e0e81e 	fmul	{z30\.d-z31\.d}, {z0\.d-z1\.d}, z0\.d
 *[0-9a-f]+:	c1e0ebc0 	fmul	{z0\.d-z1\.d}, {z30\.d-z31\.d}, z0\.d
 *[0-9a-f]+:	c1fee800 	fmul	{z0\.d-z1\.d}, {z0\.d-z1\.d}, z15\.d
 *[0-9a-f]+:	c161e800 	fmul	{z0\.h-z3\.h}, {z0\.h-z3\.h}, z0\.h
 *[0-9a-f]+:	c161e81c 	fmul	{z28\.h-z31\.h}, {z0\.h-z3\.h}, z0\.h
 *[0-9a-f]+:	c161eb80 	fmul	{z0\.h-z3\.h}, {z28\.h-z31\.h}, z0\.h
 *[0-9a-f]+:	c17fe800 	fmul	{z0\.h-z3\.h}, {z0\.h-z3\.h}, z15\.h
 *[0-9a-f]+:	c1a1e800 	fmul	{z0\.s-z3\.s}, {z0\.s-z3\.s}, z0\.s
 *[0-9a-f]+:	c1a1e81c 	fmul	{z28\.s-z31\.s}, {z0\.s-z3\.s}, z0\.s
 *[0-9a-f]+:	c1a1eb80 	fmul	{z0\.s-z3\.s}, {z28\.s-z31\.s}, z0\.s
 *[0-9a-f]+:	c1bfe800 	fmul	{z0\.s-z3\.s}, {z0\.s-z3\.s}, z15\.s
 *[0-9a-f]+:	c1e1e800 	fmul	{z0\.d-z3\.d}, {z0\.d-z3\.d}, z0\.d
 *[0-9a-f]+:	c1e1e81c 	fmul	{z28\.d-z31\.d}, {z0\.d-z3\.d}, z0\.d
 *[0-9a-f]+:	c1e1eb80 	fmul	{z0\.d-z3\.d}, {z28\.d-z31\.d}, z0\.d
 *[0-9a-f]+:	c1ffe800 	fmul	{z0\.d-z3\.d}, {z0\.d-z3\.d}, z15\.d
 *[0-9a-f]+:	c160e400 	fmul	{z0\.h-z1\.h}, {z0\.h-z1\.h}, {z0\.h-z1\.h}
 *[0-9a-f]+:	c160e41e 	fmul	{z30\.h-z31\.h}, {z0\.h-z1\.h}, {z0\.h-z1\.h}
 *[0-9a-f]+:	c160e7c0 	fmul	{z0\.h-z1\.h}, {z30\.h-z31\.h}, {z0\.h-z1\.h}
 *[0-9a-f]+:	c17ee400 	fmul	{z0\.h-z1\.h}, {z0\.h-z1\.h}, {z30\.h-z31\.h}
 *[0-9a-f]+:	c1a0e400 	fmul	{z0\.s-z1\.s}, {z0\.s-z1\.s}, {z0\.s-z1\.s}
 *[0-9a-f]+:	c1a0e41e 	fmul	{z30\.s-z31\.s}, {z0\.s-z1\.s}, {z0\.s-z1\.s}
 *[0-9a-f]+:	c1a0e7c0 	fmul	{z0\.s-z1\.s}, {z30\.s-z31\.s}, {z0\.s-z1\.s}
 *[0-9a-f]+:	c1bee400 	fmul	{z0\.s-z1\.s}, {z0\.s-z1\.s}, {z30\.s-z31\.s}
 *[0-9a-f]+:	c1e0e400 	fmul	{z0\.d-z1\.d}, {z0\.d-z1\.d}, {z0\.d-z1\.d}
 *[0-9a-f]+:	c1e0e41e 	fmul	{z30\.d-z31\.d}, {z0\.d-z1\.d}, {z0\.d-z1\.d}
 *[0-9a-f]+:	c1e0e7c0 	fmul	{z0\.d-z1\.d}, {z30\.d-z31\.d}, {z0\.d-z1\.d}
 *[0-9a-f]+:	c1fee400 	fmul	{z0\.d-z1\.d}, {z0\.d-z1\.d}, {z30\.d-z31\.d}
 *[0-9a-f]+:	c161e400 	fmul	{z0\.h-z3\.h}, {z0\.h-z3\.h}, {z0\.h-z3\.h}
 *[0-9a-f]+:	c161e41c 	fmul	{z28\.h-z31\.h}, {z0\.h-z3\.h}, {z0\.h-z3\.h}
 *[0-9a-f]+:	c161e780 	fmul	{z0\.h-z3\.h}, {z28\.h-z31\.h}, {z0\.h-z3\.h}
 *[0-9a-f]+:	c17de400 	fmul	{z0\.h-z3\.h}, {z0\.h-z3\.h}, {z28\.h-z31\.h}
 *[0-9a-f]+:	c1a1e400 	fmul	{z0\.s-z3\.s}, {z0\.s-z3\.s}, {z0\.s-z3\.s}
 *[0-9a-f]+:	c1a1e41c 	fmul	{z28\.s-z31\.s}, {z0\.s-z3\.s}, {z0\.s-z3\.s}
 *[0-9a-f]+:	c1a1e780 	fmul	{z0\.s-z3\.s}, {z28\.s-z31\.s}, {z0\.s-z3\.s}
 *[0-9a-f]+:	c1bde400 	fmul	{z0\.s-z3\.s}, {z0\.s-z3\.s}, {z28\.s-z31\.s}
 *[0-9a-f]+:	c1e1e400 	fmul	{z0\.d-z3\.d}, {z0\.d-z3\.d}, {z0\.d-z3\.d}
 *[0-9a-f]+:	c1e1e41c 	fmul	{z28\.d-z31\.d}, {z0\.d-z3\.d}, {z0\.d-z3\.d}
 *[0-9a-f]+:	c1e1e780 	fmul	{z0\.d-z3\.d}, {z28\.d-z31\.d}, {z0\.d-z3\.d}
 *[0-9a-f]+:	c1fde400 	fmul	{z0\.d-z3\.d}, {z0\.d-z3\.d}, {z28\.d-z31\.d}
