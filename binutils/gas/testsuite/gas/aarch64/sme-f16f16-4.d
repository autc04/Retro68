#name: Test of FEAT_SME_F16F16 fcvt and fcvtl instructions.
#as: -march=armv8-a+sme-f16f16
#objdump: -dr

[^:]+:     file format .*


[^:]+:

[^:]+:
.*:	c1a0e000 	fcvt	{ ?z0.s-z1.s ?}, z0.h
.*:	c1a0e01e 	fcvt	{ ?z30.s-z31.s ?}, z0.h
.*:	c1a0e3e0 	fcvt	{ ?z0.s-z1.s ?}, z31.h
.*:	c1a0e3fe 	fcvt	{ ?z30.s-z31.s ?}, z31.h
.*:	c1a0e1ee 	fcvt	{ ?z14.s-z15.s ?}, z15.h
.*:	c1a0e0e6 	fcvt	{ ?z6.s-z7.s ?}, z7.h
.*:	c1a0e062 	fcvt	{ ?z2.s-z3.s ?}, z3.h
.*:	c1a0e001 	fcvtl	{ ?z0.s-z1.s ?}, z0.h
.*:	c1a0e01f 	fcvtl	{ ?z30.s-z31.s ?}, z0.h
.*:	c1a0e3e1 	fcvtl	{ ?z0.s-z1.s ?}, z31.h
.*:	c1a0e3ff 	fcvtl	{ ?z30.s-z31.s ?}, z31.h
.*:	c1a0e1ef 	fcvtl	{ ?z14.s-z15.s ?}, z15.h
.*:	c1a0e0e7 	fcvtl	{ ?z6.s-z7.s ?}, z7.h
.*:	c1a0e063 	fcvtl	{ ?z2.s-z3.s ?}, z3.h
