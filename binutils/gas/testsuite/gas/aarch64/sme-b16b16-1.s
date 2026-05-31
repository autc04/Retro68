/* BFADD.  */
bfadd    za.h[w8, 0, vgx2], {z0.h - z1.h}
bfadd    za.h[w11, 0, vgx2], {z0.h - z1.h}
bfadd    za.h[w8, 7, vgx2], {z0.h - z1.h}
bfadd    za.h[w8, 0, vgx2], {z30.h - z31.h}
bfadd    za.h[w8, 3], {z30.h - z31.h}

bfadd    za.h[w8, 0, vgx4], {z0.h - z3.h}
bfadd    za.h[w11, 0, vgx4], {z0.h - z3.h}
bfadd    za.h[w8, 7, vgx4], {z0.h - z3.h}
bfadd    za.h[w8, 0, vgx4], {z28.h - z31.h}
bfadd    za.h[w8, 3], {z28.h - z31.h}

/* BFSUB.  */
bfsub    za.h[w8, 0, vgx2], {z0.h - z1.h}
bfsub    za.h[w11, 0, vgx2], {z0.h - z1.h}
bfsub    za.h[w8, 7, vgx2], {z0.h - z1.h}
bfsub    za.h[w8, 0, vgx2], {z30.h - z31.h}
bfsub    za.h[w8, 3], {z30.h - z31.h}

bfsub    za.h[w8, 0, vgx4], {z0.h - z3.h}
bfsub    za.h[w11, 0, vgx4], {z0.h - z3.h}
bfsub    za.h[w8, 7, vgx4], {z0.h - z3.h}
bfsub    za.h[w8, 0, vgx4], {z28.h - z31.h}
bfsub    za.h[w8, 3], {z28.h - z31.h}

/* BFMLA (multiple and indexed vector).  */
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx2], {z30.h - z31.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h[0]
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[3]
bfmla    za.h[w8, 3], {z0.h - z1.h}, z0.h[7]

bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[0]
bfmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h[0]
bfmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx4], {z28.h - z31.h}, z0.h[0]
bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h[0]
bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[7]
bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[3]
bfmla    za.h[w8, 3], {z0.h - z3.h}, z0.h[7]

/* BFMLA (multiple and single vector).  */
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h
bfmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h
bfmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h
bfmla    za.h[w8, 0, vgx2], {z31.h - z0.h}, z0.h
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h
bfmla    za.h[w8, 3], {z0.h - z1.h}, z15.h

bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h
bfmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h
bfmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h
bfmla    za.h[w8, 0, vgx4], {z31.h - z2.h}, z0.h
bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h
bfmla    za.h[w8, 3], {z0.h - z3.h}, z15.h

/* BFMLA (multiple vectors).  */
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmla    za.h[w8, 0, vgx2], {z30.h - z31.h}, {z0.h - z1.h}
bfmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h - z31.h}
bfmla    za.h[w8, 3], {z0.h - z1.h}, {z30.h - z31.h}

bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmla    za.h[w8, 0, vgx4], {z28.h - z31.h}, {z0.h - z3.h}
bfmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z28.h - z31.h}
bfmla    za.h[w8, 3], {z0.h - z3.h}, {z28.h - z31.h}

/* BFMLS (multiple and indexed vector).  */
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx2], {z30.h - z31.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h[0]
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[3]
bfmls    za.h[w8, 3], {z0.h - z1.h}, z0.h[7]

bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[0]
bfmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h[0]
bfmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx4], {z28.h - z31.h}, z0.h[0]
bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h[0]
bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[7]
bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[3]
bfmls    za.h[w8, 3], {z0.h - z3.h}, z0.h[7]

/* BFMLS (multiple and single vector).  */
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h
bfmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h
bfmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h
bfmls    za.h[w8, 0, vgx2], {z31.h - z0.h}, z0.h
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h
bfmls    za.h[w8, 3], {z0.h - z1.h}, z15.h

bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h
bfmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h
bfmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h
bfmls    za.h[w8, 0, vgx4], {z31.h - z2.h}, z0.h
bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h
bfmls    za.h[w8, 3], {z0.h - z3.h}, z15.h

/* BFMLS (multiple vectors).  */
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
bfmls    za.h[w8, 0, vgx2], {z30.h - z31.h}, {z0.h - z1.h}
bfmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h - z31.h}
bfmls    za.h[w8, 3], {z0.h - z1.h}, {z30.h - z31.h}

bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
bfmls    za.h[w8, 0, vgx4], {z28.h - z31.h}, {z0.h - z3.h}
bfmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z28.h - z31.h}
bfmls    za.h[w8, 3], {z0.h - z3.h}, {z28.h - z31.h}

/* BFMOPA.  */
bfmopa ZA0.h, p0/m, p0/m, z0.h, z0.h
bfmopa ZA1.h, p0/m, p0/m, z0.h, z0.h
bfmopa ZA0.h, p7/m, p0/m, z0.h, z0.h
bfmopa ZA0.h, p0/m, p7/m, z0.h, z0.h
bfmopa ZA0.h, p0/m, p0/m, z31.h, z0.h
bfmopa ZA0.h, p0/m, p0/m, z0.h, z31.h
bfmopa ZA0.h, p3/m, p5/m, z10.h, z15.h
bfmopa ZA1.h, p1/m, p3/m, z15.h, z25.h

/* BFMOPS.  */
bfmops ZA0.h, p0/m, p0/m, z0.h, z0.h
bfmops ZA1.h, p0/m, p0/m, z0.h, z0.h
bfmops ZA0.h, p7/m, p0/m, z0.h, z0.h
bfmops ZA0.h, p0/m, p7/m, z0.h, z0.h
bfmops ZA0.h, p0/m, p0/m, z31.h, z0.h
bfmops ZA0.h, p0/m, p0/m, z0.h, z31.h
bfmops ZA0.h, p3/m, p5/m, z10.h, z15.h
bfmops ZA1.h, p1/m, p3/m, z15.h, z25.h
