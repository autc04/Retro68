/* BFADD.  */
bfadd    za.s[w8, 0, vgx2], {z0.h - z1.h}
bfadd    za.h[w13, 0, vgx2], {z1.h - z0.h}
bfadd    za.h[w8, 11, vgx3], {z0.h - z1.h}
bfadd    za.h[w8, 0, vgx2], {z0.h - z4.h}

bfadd    za.s[w8, 0, vgx4], {z0.h - z3.h}
bfadd    za.h[w14, 0, vgx4], {z10.h - z3.h}
bfadd    za.h[w8, 15, vgx1], {z3.h - z2.h}
bfadd    za.h[w8, 0, vgx4], {z30.h - z31.h}

/* BFSUB.  */
bfsub    za.s[w8, 0, vgx2], {z0.h - z1.h}
bfsub    za.h[w13, 0, vgx2], {z1.h - z0.h}
bfsub    za.h[w8, 11, vgx3], {z0.h - z1.h}
bfsub    za.h[w8, 0, vgx2], {z0.h - z4.h}

bfsub    za.s[w8, 0, vgx4], {z0.h - z3.h}
bfsub    za.h[w14, 0, vgx4], {z10.h - z3.h}
bfsub    za.h[w8, 15, vgx1], {z3.h - z2.h}
bfsub    za.h[w8, 0, vgx4], {z30.h - z31.h}

/* BFMLA (multiple and indexed vector).  */
bfmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h[0]
bfmla    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h[0]
bfmla    za.d[w8, 0, vgx3], {z30.h - z31.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h[0]
bfmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx2], {z0.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx2], {z0.h}, z0.h
bfmla    za.h[w8, 0, vgx2], {z0 - z1}, z0.h[7]
bfmla    za.h[w8, 0, vgx2], {z0 - z1}

bfmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w14, 0, vgx1], {z10.h - z1.h}, z0.h[0]
bfmla    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx1], {z30.h - z31.h}, z0.h[0]
bfmla    za.s[w8, 0, vgx1], {z0.h - z1.h}, z15.h[0]
bfmla    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx4], {z0.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx4], {z0.h}, z0.h
bfmla    za.h[w8, 0, vgx4], {z0 - z1}, z0.h[7]
bfmla    za.h[w8, 0, vgx4], {z0 - z1}

/* BFMLA (multiple and single vector).  */
bfmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h
bfmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h
bfmla    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h
bfmla    za.d[w8, 0, vgx3], {z31.h - z0.h}, z0.h
bfmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h
bfmla    za.h[w8, 0, vgx2], {z0.h}, z15.h
bfmla    za.h[w8, 0, vgx2], {z0.h -z1.h}, z15
bfmla    za.h[w8, 0, vgx2], {z0.h -z1.h}, z20
bfmla    za.h[w8, 0, vgx2], {z0.h -z1.h}

bfmla    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h
bfmla    za.s[w14, 0, vgx1], {z10.h - z1.h}, z0.h
bfmla    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h
bfmla    za.h[w8, 0, vgx1], {z31.h - z2.h}, z0.h
bfmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, z15.h
bfmla    za.h[w8, 0, vgx4], {z0.h}, z15.h
bfmla    za.h[w8, 0, vgx4], {z0.h -z1.h}, z15
bfmla    za.h[w8, 0, vgx4], {z0.h -z1.h}, z20
bfmla    za.h[w8, 0, vgx4], {z0.h -z1.h}

/* BFMLA (multiple vectors).  */
bfmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
bfmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, {z0.h - z1.h}
bfmla    za.d[w8, 15, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
bfmla    za.h[w8, 0, vgx3], {z30.h - z31.h}, {z0.h - z1.h}
bfmla    za.b[w8, 0, vgx3], {z0.h - z1.h}, {z30.h - z31.h}
bfmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h - z31.h}
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h}
bfmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
bfmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
bfmla    za.b[w8, 20, vgx2], {z0.h}, {z30.h}

bfmla    za.s[w8, 0, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
bfmla    za.h[w14, 0, vgx1], {z10.h - z1.h}, {z0.h - z3.h}
bfmla    za.s[w8, 15, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
bfmla    za.h[w8, 0, vgx1], {z30.h - z31.h}, {z0.h - z1.h}
bfmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, {z30.h - z31.h}
bfmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h - z31.h}
bfmla    za.h[w8, 0, vgx4], {z0.h - z1.h}, {z30.h}
bfmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
bfmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
bfmla    za.b[w8, 20, vgx4], {z0.h}, {z30.h}

/* BFMLS (multiple and indexed vector).  */
bfmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h[0]
bfmls    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h[0]
bfmls    za.d[w8, 0, vgx3], {z30.h - z31.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h[0]
bfmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx2], {z0.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx2], {z0.h}, z0.h
bfmls    za.h[w8, 0, vgx2], {z0 - z1}, z0.h[7]
bfmls    za.h[w8, 0, vgx2], {z0 - z1}

bfmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w14, 0, vgx1], {z10.h - z1.h}, z0.h[0]
bfmls    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx1], {z30.h - z31.h}, z0.h[0]
bfmls    za.s[w8, 0, vgx1], {z0.h - z1.h}, z15.h[0]
bfmls    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx4], {z0.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx4], {z0.h}, z0.h
bfmls    za.h[w8, 0, vgx4], {z0 - z1}, z0.h[7]
bfmls    za.h[w8, 0, vgx4], {z0 - z1}

/* BFMLS (multiple and single vector).  */
bfmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h
bfmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h
bfmls    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h
bfmls    za.d[w8, 0, vgx3], {z31.h - z0.h}, z0.h
bfmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h
bfmls    za.h[w8, 0, vgx2], {z0.h}, z15.h
bfmls    za.h[w8, 0, vgx2], {z0.h -z1.h}, z15
bfmls    za.h[w8, 0, vgx2], {z0.h -z1.h}, z20
bfmls    za.h[w8, 0, vgx2], {z0.h -z1.h}

bfmls    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h
bfmls    za.s[w14, 0, vgx1], {z10.h - z1.h}, z0.h
bfmls    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h
bfmls    za.h[w8, 0, vgx1], {z31.h - z2.h}, z0.h
bfmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, z15.h
bfmls    za.h[w8, 0, vgx4], {z0.h}, z15.h
bfmls    za.h[w8, 0, vgx4], {z0.h -z1.h}, z15
bfmls    za.h[w8, 0, vgx4], {z0.h -z1.h}, z20
bfmls    za.h[w8, 0, vgx4], {z0.h -z1.h}

/* BFMLS (multiple vectors).  */
bfmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
bfmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, {z0.h - z1.h}
bfmls    za.d[w8, 15, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
bfmls    za.h[w8, 0, vgx3], {z30.h - z31.h}, {z0.h - z1.h}
bfmls    za.b[w8, 0, vgx3], {z0.h - z1.h}, {z30.h - z31.h}
bfmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h - z31.h}
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h}
bfmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
bfmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
bfmls    za.b[w8, 20, vgx2], {z0.h}, {z30.h}

bfmls    za.s[w8, 0, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
bfmls    za.h[w14, 0, vgx1], {z10.h - z1.h}, {z0.h - z3.h}
bfmls    za.s[w8, 15, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
bfmls    za.h[w8, 0, vgx1], {z30.h - z31.h}, {z0.h - z1.h}
bfmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, {z30.h - z31.h}
bfmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h - z31.h}
bfmls    za.h[w8, 0, vgx4], {z0.h - z1.h}, {z30.h}
bfmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
bfmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
bfmls    za.b[w8, 20, vgx4], {z0.h}, {z30.h}

/* BFMOPA.  */
bfmopa ZA0.s, p0/m, p0/m, z0.h, z0.h
bfmopa ZA1.h, p0, p0/m, z0.h, z0.h
bfmopa ZA0.h, p7/m, p0, z0.h, z0.h
bfmopa ZA0.h, p0/m, p7/m, z0.s, z0.s
bfmopa ZA0.h, p0/m, p0/m, z31.d, z0.d
bfmopa ZA2.h, p0/m, p8/m, z0.s, z31.b
bfmopa ZA4.h, p15/m, p11/m, z0.s, z31.b

/* BFMOPS.  */
bfmops ZA0.s, p0/m, p0/m, z0.h, z0.h
bfmops ZA1.h, p0, p0/m, z0.h, z0.h
bfmops ZA0.h, p7/m, p0, z0.h, z0.h
bfmops ZA0.h, p0/m, p7/m, z0.s, z0.s
bfmops ZA0.h, p0/m, p0/m, z31.d, z0.d
bfmops ZA2.h, p0/m, p8/m, z0.s, z31.b
bfmops ZA4.h, p15/m, p11/m, z0.s, z31.b
