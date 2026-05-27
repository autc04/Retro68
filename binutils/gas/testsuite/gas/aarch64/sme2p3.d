#as: -march=armv8-a+sme2p3
#objdump: -dr

.*:     file format .*

Disassembly of section \.text:

0+ <\.text>:
 *[0-9a-f]+:	c08a0000 	luti6	{z0.b-z3.b}, zt0, {z0-z2}
 *[0-9a-f]+:	c08a001c 	luti6	{z28.b-z31.b}, zt0, {z0-z2}
 *[0-9a-f]+:	c08a0380 	luti6	{z0.b-z3.b}, zt0, {z7-z9}
 *[0-9a-f]+:	c09a0000 	luti6	{z0.b, z4.b, z8.b, z12.b}, zt0, {z0-z2}
 *[0-9a-f]+:	c09a0013 	luti6	{z19.b, z23.b, z27.b, z31.b}, zt0, {z0-z2}
 *[0-9a-f]+:	c09a0380 	luti6	{z0.b, z4.b, z8.b, z12.b}, zt0, {z7-z9}
 *[0-9a-f]+:	c0c84000 	luti6	z0.b, zt0, z0
 *[0-9a-f]+:	c0c8401f 	luti6	z31.b, zt0, z0
 *[0-9a-f]+:	c0c843e0 	luti6	z0.b, zt0, z31

 *[0-9a-f]+:	c120f400 	luti6	{z0.h-z3.h}, {z0.h-z1.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120f41c 	luti6	{z28.h-z31.h}, {z0.h-z1.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120f7c0 	luti6	{z0.h-z3.h}, {z30.h-z31.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120f7e0 	luti6	{z0.h-z3.h}, {z31.h-z0.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c13ef400 	luti6	{z0.h-z3.h}, {z0.h-z1.h}, {z30-z31}\[0\]
 *[0-9a-f]+:	c13ff400 	luti6	{z0.h-z3.h}, {z0.h-z1.h}, {z31-z0}\[0\]
 *[0-9a-f]+:	c160f400 	luti6	{z0.h-z3.h}, {z0.h-z1.h}, {z0-z1}\[1\]

 *[0-9a-f]+:	c120fc00 	luti6	{z0.h, z4.h, z8.h, z12.h}, {z0.h-z1.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120fc13 	luti6	{z19\.h, z23\.h, z27\.h, z31\.h}, {z0\.h-z1\.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120ffc0 	luti6	{z0\.h, z4\.h, z8\.h, z12\.h}, {z30\.h-z31\.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c120ffe0 	luti6	{z0\.h, z4\.h, z8\.h, z12\.h}, {z31\.h-z0\.h}, {z0-z1}\[0\]
 *[0-9a-f]+:	c13efc00 	luti6	{z0\.h, z4\.h, z8\.h, z12\.h}, {z0\.h-z1\.h}, {z30-z31}\[0\]
 *[0-9a-f]+:	c13ffc00 	luti6	{z0\.h, z4\.h, z8\.h, z12\.h}, {z0\.h-z1\.h}, {z31-z0}\[0\]
 *[0-9a-f]+:	c160fc00 	luti6	{z0\.h, z4\.h, z8\.h, z12\.h}, {z0\.h-z1\.h}, {z0-z1}\[1\]
