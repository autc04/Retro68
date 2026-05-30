#name: Test of FEAT_SME_F16F16 fmla and fmls instructions.
#as: -march=armv8-a+sme-f16f16
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	c1101000 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1107000 	fmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1101007 	fmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c11013c0 	fmla	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, z0.h\[0\]
.*:	c11f1000 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h\[0\]
.*:	c1101c08 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c11f7fcf 	fmla	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h\[7\]
.*:	c11f37cf 	fmla	za.h\[w9, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h\[3\]
.*:	c1101c0b 	fmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1109000 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c110f000 	fmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109007 	fmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109380 	fmla	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, z0.h\[0\]
.*:	c11f9000 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h\[0\]
.*:	c1109c08 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c11fff8f 	fmla	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h\[7\]
.*:	c11fb78f 	fmla	za.h\[w9, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h\[3\]
.*:	c1109c0b 	fmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1201c00 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1207c00 	fmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1201c07 	fmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1201fe0 	fmla	za.h\[w8, 0, vgx2\], { ?z31.h-z0.h ?}, z0.h
.*:	c12f1c00 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c12f7fc7 	fmla	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h
.*:	c12f1c03 	fmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c1301c00 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1307c00 	fmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1301c07 	fmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1301fe0 	fmla	za.h\[w8, 0, vgx4\], { ?z31.h-z2.h ?}, z0.h
.*:	c13f1c00 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c13f7f87 	fmla	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h
.*:	c13f1c03 	fmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c1a01008 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a07008 	fmla	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a0100f 	fmla	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a013c8 	fmla	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, { ?z0.h-z1.h ?}
.*:	c1be1008 	fmla	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1be73cf 	fmla	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, { ?z30.h-z31.h ?}
.*:	c1be100b 	fmla	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1a11008 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a17008 	fmla	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a1100f 	fmla	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a11388 	fmla	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, { ?z0.h-z3.h ?}
.*:	c1bd1008 	fmla	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1bd738f 	fmla	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, { ?z28.h-z31.h ?}
.*:	c1bd100b 	fmla	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1101010 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1107010 	fmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c1101017 	fmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h\[0\]
.*:	c11013d0 	fmls	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, z0.h\[0\]
.*:	c11f1010 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h\[0\]
.*:	c1101c18 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c11f7fdf 	fmls	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h\[7\]
.*:	c11f37df 	fmls	za.h\[w9, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h\[3\]
.*:	c1101c1b 	fmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z0.h\[7\]
.*:	c1109010 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c110f010 	fmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109017 	fmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h\[0\]
.*:	c1109390 	fmls	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, z0.h\[0\]
.*:	c11f9010 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h\[0\]
.*:	c1109c18 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c11fff9f 	fmls	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h\[7\]
.*:	c11fb79f 	fmls	za.h\[w9, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h\[3\]
.*:	c1109c1b 	fmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z0.h\[7\]
.*:	c1201c08 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1207c08 	fmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1201c0f 	fmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, z0.h
.*:	c1201fe8 	fmls	za.h\[w8, 0, vgx2\], { ?z31.h-z0.h ?}, z0.h
.*:	c12f1c08 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c12f7fcf 	fmls	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, z15.h
.*:	c12f1c0b 	fmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, z15.h
.*:	c1301c08 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1307c08 	fmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1301c0f 	fmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, z0.h
.*:	c1301fe8 	fmls	za.h\[w8, 0, vgx4\], { ?z31.h-z2.h ?}, z0.h
.*:	c13f1c08 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c13f7f8f 	fmls	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, z15.h
.*:	c13f1c0b 	fmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, z15.h
.*:	c1a01018 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a07018 	fmls	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a0101f 	fmls	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}, { ?z0.h-z1.h ?}
.*:	c1a013d8 	fmls	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}, { ?z0.h-z1.h ?}
.*:	c1be1018 	fmls	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1be73df 	fmls	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}, { ?z30.h-z31.h ?}
.*:	c1be101b 	fmls	za.h\[w8, 3, vgx2\], { ?z0.h-z1.h ?}, { ?z30.h-z31.h ?}
.*:	c1a11018 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a17018 	fmls	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a1101f 	fmls	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}, { ?z0.h-z3.h ?}
.*:	c1a11398 	fmls	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}, { ?z0.h-z3.h ?}
.*:	c1bd1018 	fmls	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
.*:	c1bd739f 	fmls	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}, { ?z28.h-z31.h ?}
.*:	c1bd101b 	fmls	za.h\[w8, 3, vgx4\], { ?z0.h-z3.h ?}, { ?z28.h-z31.h ?}
