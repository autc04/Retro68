#name: Test of FEAT_SME_F16F16 fsub and fsub instructions.
#as: -march=armv8-a+sme-f16f16
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	c1a41c00 	fadd	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a47c00 	fadd	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a41c07 	fadd	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a41fc0 	fadd	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}
.*:	c1a47fc7 	fadd	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}
.*:	c1a43e03 	fadd	za.h\[w9, 3, vgx2\], { ?z16.h-z17.h ?}
.*:	c1a45d01 	fadd	za.h\[w10, 1, vgx2\], { ?z8.h-z9.h ?}
.*:	c1a51c00 	fadd	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a57c00 	fadd	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a51c07 	fadd	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a51f80 	fadd	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}
.*:	c1a57f87 	fadd	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}
.*:	c1a53d83 	fadd	za.h\[w9, 3, vgx4\], { ?z12.h-z15.h ?}
.*:	c1a55d01 	fadd	za.h\[w10, 1, vgx4\], { ?z8.h-z11.h ?}
.*:	c1a41c08 	fsub	za.h\[w8, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a47c08 	fsub	za.h\[w11, 0, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a41c0f 	fsub	za.h\[w8, 7, vgx2\], { ?z0.h-z1.h ?}
.*:	c1a41fc8 	fsub	za.h\[w8, 0, vgx2\], { ?z30.h-z31.h ?}
.*:	c1a47fcf 	fsub	za.h\[w11, 7, vgx2\], { ?z30.h-z31.h ?}
.*:	c1a43e0b 	fsub	za.h\[w9, 3, vgx2\], { ?z16.h-z17.h ?}
.*:	c1a45d09 	fsub	za.h\[w10, 1, vgx2\], { ?z8.h-z9.h ?}
.*:	c1a51c08 	fsub	za.h\[w8, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a57c08 	fsub	za.h\[w11, 0, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a51c0f 	fsub	za.h\[w8, 7, vgx4\], { ?z0.h-z3.h ?}
.*:	c1a51f88 	fsub	za.h\[w8, 0, vgx4\], { ?z28.h-z31.h ?}
.*:	c1a57f8f 	fsub	za.h\[w11, 7, vgx4\], { ?z28.h-z31.h ?}
.*:	c1a53d8b 	fsub	za.h\[w9, 3, vgx4\], { ?z12.h-z15.h ?}
.*:	c1a55d09 	fsub	za.h\[w10, 1, vgx4\], { ?z8.h-z11.h ?}
