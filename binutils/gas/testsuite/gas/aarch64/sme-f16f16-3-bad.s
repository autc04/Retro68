/* FMLA (multiple and indexed vector).  */
fmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h[0]
fmla    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h[0]
fmla    za.d[w8, 0, vgx3], {z30.h - z31.h}, z0.h[0]
fmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h[0]
fmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z0.h[7]
fmla    za.h[w8, 0, vgx2], {z0.h}, z0.h[7]
fmla    za.h[w8, 0, vgx2], {z0.h}, z0.h
fmla    za.h[w8, 0, vgx2], {z0 - z1}, z0.h[7]
fmla    za.h[w8, 0, vgx2], {z0 - z1}

fmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w14, 0, vgx1], {z10.h - z1.h}, z0.h[0]
fmla    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w8, 0, vgx1], {z30.h - z31.h}, z0.h[0]
fmla    za.s[w8, 0, vgx1], {z0.h - z1.h}, z15.h[0]
fmla    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h[7]
fmla    za.h[w8, 0, vgx4], {z0.h}, z0.h[7]
fmla    za.h[w8, 0, vgx4], {z0.h}, z0.h
fmla    za.h[w8, 0, vgx4], {z0 - z1}, z0.h[7]
fmla    za.h[w8, 0, vgx4], {z0 - z1}

/* FMLA (multiple and single vector).  */
fmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h
fmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h
fmla    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h
fmla    za.d[w8, 0, vgx3], {z31.h - z0.h}, z0.h
fmla    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h
fmla    za.h[w8, 0, vgx2], {z0.h}, z15.h
fmla    za.h[w8, 0, vgx2], {z0.h -z1.h}, z15
fmla    za.h[w8, 0, vgx2], {z0.h -z1.h}, z20
fmla    za.h[w8, 0, vgx2], {z0.h -z1.h}

fmla    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h
fmla    za.s[w14, 0, vgx1], {z10.h - z1.h}, z0.h
fmla    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h
fmla    za.h[w8, 0, vgx1], {z31.h - z2.h}, z0.h
fmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, z15.h
fmla    za.h[w8, 0, vgx4], {z0.h}, z15.h
fmla    za.h[w8, 0, vgx4], {z0.h -z1.h}, z15
fmla    za.h[w8, 0, vgx4], {z0.h -z1.h}, z20
fmla    za.h[w8, 0, vgx4], {z0.h -z1.h}

/* FMLA (multiple vectors).  */
fmla    za.s[w8, 0, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
fmla    za.h[w14, 0, vgx3], {z10.h - z1.h}, {z0.h - z1.h}
fmla    za.d[w8, 15, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
fmla    za.h[w8, 0, vgx3], {z30.h - z31.h}, {z0.h - z1.h}
fmla    za.b[w8, 0, vgx3], {z0.h - z1.h}, {z30.h - z31.h}
fmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h - z31.h}
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h}
fmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
fmla    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
fmla    za.b[w8, 20, vgx2], {z0.h}, {z30.h}

fmla    za.s[w8, 0, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
fmla    za.h[w14, 0, vgx1], {z10.h - z1.h}, {z0.h - z3.h}
fmla    za.s[w8, 15, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
fmla    za.h[w8, 0, vgx1], {z30.h - z31.h}, {z0.h - z1.h}
fmla    za.b[w8, 0, vgx1], {z0.h - z1.h}, {z30.h - z31.h}
fmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h - z31.h}
fmla    za.h[w8, 0, vgx4], {z0.h - z1.h}, {z30.h}
fmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
fmla    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
fmla    za.b[w8, 20, vgx4], {z0.h}, {z30.h}

/* FMLS (multiple and indexed vector).  */
fmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h[0]
fmls    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h[0]
fmls    za.d[w8, 0, vgx3], {z30.h - z31.h}, z0.h[0]
fmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h[0]
fmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z0.h[7]
fmls    za.h[w8, 0, vgx2], {z0.h}, z0.h[7]
fmls    za.h[w8, 0, vgx2], {z0.h}, z0.h
fmls    za.h[w8, 0, vgx2], {z0 - z1}, z0.h[7]
fmls    za.h[w8, 0, vgx2], {z0 - z1}

fmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w14, 0, vgx1], {z10.h - z1.h}, z0.h[0]
fmls    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w8, 0, vgx1], {z30.h - z31.h}, z0.h[0]
fmls    za.s[w8, 0, vgx1], {z0.h - z1.h}, z15.h[0]
fmls    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h[7]
fmls    za.h[w8, 0, vgx4], {z0.h}, z0.h[7]
fmls    za.h[w8, 0, vgx4], {z0.h}, z0.h
fmls    za.h[w8, 0, vgx4], {z0 - z1}, z0.h[7]
fmls    za.h[w8, 0, vgx4], {z0 - z1}

/* FMLS (multiple and single vector).  */
fmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, z0.h
fmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, z0.h
fmls    za.h[w8, 15, vgx3], {z0.h - z1.h}, z0.h
fmls    za.d[w8, 0, vgx3], {z31.h - z0.h}, z0.h
fmls    za.h[w8, 0, vgx3], {z0.h - z1.h}, z15.h
fmls    za.h[w8, 0, vgx2], {z0.h}, z15.h
fmls    za.h[w8, 0, vgx2], {z0.h -z1.h}, z15
fmls    za.h[w8, 0, vgx2], {z0.h -z1.h}, z20
fmls    za.h[w8, 0, vgx2], {z0.h -z1.h}

fmls    za.h[w8, 0, vgx1], {z0.h - z1.h}, z0.h
fmls    za.s[w14, 0, vgx1], {z10.h - z1.h}, z0.h
fmls    za.h[w8, 15, vgx1], {z0.h - z1.h}, z0.h
fmls    za.h[w8, 0, vgx1], {z31.h - z2.h}, z0.h
fmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, z15.h
fmls    za.h[w8, 0, vgx4], {z0.h}, z15.h
fmls    za.h[w8, 0, vgx4], {z0.h -z1.h}, z15
fmls    za.h[w8, 0, vgx4], {z0.h -z1.h}, z20
fmls    za.h[w8, 0, vgx4], {z0.h -z1.h}

/* FMLS (multiple vectors).  */
fmls    za.s[w8, 0, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
fmls    za.h[w14, 0, vgx3], {z10.h - z1.h}, {z0.h - z1.h}
fmls    za.d[w8, 15, vgx3], {z0.h - z1.h}, {z0.h - z1.h}
fmls    za.h[w8, 0, vgx3], {z30.h - z31.h}, {z0.h - z1.h}
fmls    za.b[w8, 0, vgx3], {z0.h - z1.h}, {z30.h - z31.h}
fmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h - z31.h}
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h}
fmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
fmls    za.h[w8, 0, vgx2], {z0.h}, {z30.h}
fmls    za.b[w8, 20, vgx2], {z0.h}, {z30.h}

fmls    za.s[w8, 0, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
fmls    za.h[w14, 0, vgx1], {z10.h - z1.h}, {z0.h - z3.h}
fmls    za.s[w8, 15, vgx1], {z0.h - z1.h}, {z0.h - z3.h}
fmls    za.h[w8, 0, vgx1], {z30.h - z31.h}, {z0.h - z1.h}
fmls    za.b[w8, 0, vgx1], {z0.h - z1.h}, {z30.h - z31.h}
fmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h - z31.h}
fmls    za.h[w8, 0, vgx4], {z0.h - z1.h}, {z30.h}
fmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
fmls    za.h[w8, 0, vgx4], {z0.h}, {z30.h}
fmls    za.b[w8, 20, vgx4], {z0.h}, {z30.h}
