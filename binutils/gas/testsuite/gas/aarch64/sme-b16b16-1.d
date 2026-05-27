#name: Test of SME2 non-widening BFloat16 instructions.
#as: -march=armv8-a+sme-b16b16
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	c1e41c00 	bfadd	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e47c00 	bfadd	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e41c07 	bfadd	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e41fc0 	bfadd	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}
.*:	c1e41fc3 	bfadd	za.h\[w8, 3, vgx2\], { ?z30.h-z31.h ?}
.*:	c1e51c00 	bfadd	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e57c00 	bfadd	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e51c07 	bfadd	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e51f80 	bfadd	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}
.*:	c1e51f83 	bfadd	za.h\[w8, 3, vgx4\], { ?z28.h-z31.h ?}
.*:	c1e41c08 	bfsub	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e47c08 	bfsub	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e41c0f 	bfsub	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}
.*:	c1e41fc8 	bfsub	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}
.*:	c1e41fcb 	bfsub	za.h\[w8, 3, vgx2\], { ?z30.h-z31.h ?}
.*:	c1e51c08 	bfsub	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e57c08 	bfsub	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e51c0f 	bfsub	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}
.*:	c1e51f88 	bfsub	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}
.*:	c1e51f8b 	bfsub	za.h\[w8, 3, vgx4\], { ?z28.h-z31.h ?}
.*:	c1101020 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1107020 	bfmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1101027 	bfmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c11013e0 	bfmla	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, z0.h\[0\]
.*:	c11f1020 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h\[0\]
.*:	c1101c28 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1101428 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[3\]
.*:	c1101c2b 	bfmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1109020 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c110f020 	bfmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109027 	bfmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c11093a0 	bfmla	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, z0.h\[0\]
.*:	c11f9020 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h\[0\]
.*:	c1109c28 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1109428 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[3\]
.*:	c1109c2b 	bfmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1601c00 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1607c00 	bfmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1601c07 	bfmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1601fe0 	bfmla	za.h\[w8, 0, vgx2\], { ?z31.h-z0.h ?}, z0.h
.*:	c16f1c00 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c16f1c03 	bfmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c1701c00 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1707c00 	bfmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1701c07 	bfmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1701fe0 	bfmla	za.h\[w8, 0, vgx4\], { ?z31.h-z2.h ?}, z0.h
.*:	c17f1c00 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c17f1c03 	bfmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c1e01008 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e07008 	bfmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e0100f 	bfmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e013c8 	bfmla	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, { ?z0.h-z1.h ?}
.*:	c1fe1008 	bfmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1fe100b 	bfmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1e11008 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e17008 	bfmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e1100f 	bfmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e11388 	bfmla	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, { ?z0.h-z3.h ?}
.*:	c1fd1008 	bfmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1fd100b 	bfmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1101030 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1107030 	bfmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1101037 	bfmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c11013f0 	bfmls	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, z0.h\[0\]
.*:	c11f1030 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h\[0\]
.*:	c1101c38 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1101438 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[3\]
.*:	c1101c3b 	bfmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1109030 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c110f030 	bfmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109037 	bfmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c11093b0 	bfmls	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, z0.h\[0\]
.*:	c11f9030 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h\[0\]
.*:	c1109c38 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1109438 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[3\]
.*:	c1109c3b 	bfmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1601c08 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1607c08 	bfmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1601c0f 	bfmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1601fe8 	bfmls	za.h\[w8, 0, vgx2\], { ?z31.h-z0.h ?}, z0.h
.*:	c16f1c08 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c16f1c0b 	bfmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c1701c08 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1707c08 	bfmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1701c0f 	bfmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1701fe8 	bfmls	za.h\[w8, 0, vgx4\], { ?z31.h-z2.h ?}, z0.h
.*:	c17f1c08 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c17f1c0b 	bfmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c1e01018 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e07018 	bfmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e0101f 	bfmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1e013d8 	bfmls	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, { ?z0.h-z1.h ?}
.*:	c1fe1018 	bfmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1fe101b 	bfmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1e11018 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e17018 	bfmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e1101f 	bfmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1e11398 	bfmls	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, { ?z0.h-z3.h ?}
.*:	c1fd1018 	bfmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1fd101b 	bfmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	81a00008 	bfmopa	za0.h, p0/m, p0/m, z0.h, z0.h
.*:	81a00009 	bfmopa	za1.h, p0/m, p0/m, z0.h, z0.h
.*:	81a01c08 	bfmopa	za0.h, p7/m, p0/m, z0.h, z0.h
.*:	81a0e008 	bfmopa	za0.h, p0/m, p7/m, z0.h, z0.h
.*:	81a003e8 	bfmopa	za0.h, p0/m, p0/m, z31.h, z0.h
.*:	81bf0008 	bfmopa	za0.h, p0/m, p0/m, z0.h, z31.h
.*:	81afad48 	bfmopa	za0.h, p3/m, p5/m, z10.h, z15.h
.*:	81b965e9 	bfmopa	za1.h, p1/m, p3/m, z15.h, z25.h
.*:	81a00018 	bfmops	za0.h, p0/m, p0/m, z0.h, z0.h
.*:	81a00019 	bfmops	za1.h, p0/m, p0/m, z0.h, z0.h
.*:	81a01c18 	bfmops	za0.h, p7/m, p0/m, z0.h, z0.h
.*:	81a0e018 	bfmops	za0.h, p0/m, p7/m, z0.h, z0.h
.*:	81a003f8 	bfmops	za0.h, p0/m, p0/m, z31.h, z0.h
.*:	81bf0018 	bfmops	za0.h, p0/m, p0/m, z0.h, z31.h
.*:	81afad58 	bfmops	za0.h, p3/m, p5/m, z10.h, z15.h
.*:	81b965f9 	bfmops	za1.h, p1/m, p3/m, z15.h, z25.h
