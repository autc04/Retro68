/* FMLA (multiple and indexed vector).  */
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h[0]
fmla    za.h[w8, 0, vgx2], {z30.h - z31.h}, z0.h[0]
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h[0]
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[7]
fmla    za.h[w11, 7, vgx2], {z30.h - z31.h}, z15.h[7]
fmla    za.h[w9, 7, vgx2], {z30.h - z31.h}, z15.h[3]
fmla    za.h[w8, 3], {z0.h - z1.h}, z0.h[7]

fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[0]
fmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h[0]
fmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h[0]
fmla    za.h[w8, 0, vgx4], {z28.h - z31.h}, z0.h[0]
fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h[0]
fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[7]
fmla    za.h[w11, 7, vgx4], {z28.h - z31.h}, z15.h[7]
fmla    za.h[w9, 7, vgx4], {z28.h - z31.h}, z15.h[3]
fmla    za.h[w8, 3], {z0.h - z3.h}, z0.h[7]

/* FMLA (multiple and single vector).  */
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h
fmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h
fmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h
fmla    za.h[w8, 0, vgx2], {z31.h - z0.h}, z0.h
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h
fmla    za.h[w11, 7, vgx2], {z30.h - z31.h}, z15.h
fmla    za.h[w8, 3], {z0.h - z1.h}, z15.h

fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h
fmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h
fmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h
fmla    za.h[w8, 0, vgx4], {z31.h - z2.h}, z0.h
fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h
fmla    za.h[w11, 7, vgx4], {z28.h - z31.h}, z15.h
fmla    za.h[w8, 3], {z0.h - z3.h}, z15.h

/* FMLA (multiple vectors).  */
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmla    za.h[w11, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmla    za.h[w8, 7, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmla    za.h[w8, 0, vgx2], {z30.h - z31.h}, {z0.h - z1.h}
fmla    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h - z31.h}
fmla    za.h[w11, 7, vgx2], {z30.h - z31.h}, {z30.h - z31.h}
fmla    za.h[w8, 3], {z0.h - z1.h}, {z30.h - z31.h}

fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmla    za.h[w11, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmla    za.h[w8, 7, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmla    za.h[w8, 0, vgx4], {z28.h - z31.h}, {z0.h - z3.h}
fmla    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z28.h - z31.h}
fmla    za.h[w11, 7, vgx4], {z28.h - z31.h}, {z28.h - z31.h}
fmla    za.h[w8, 3], {z0.h - z3.h}, {z28.h - z31.h}

/* FMLS (multiple and indexed vector).  */
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h[0]
fmls    za.h[w8, 0, vgx2], {z30.h - z31.h}, z0.h[0]
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h[0]
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h[7]
fmls    za.h[w11, 7, vgx2], {z30.h - z31.h}, z15.h[7]
fmls    za.h[w9, 7, vgx2], {z30.h - z31.h}, z15.h[3]
fmls    za.h[w8, 3], {z0.h - z1.h}, z0.h[7]

fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[0]
fmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h[0]
fmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h[0]
fmls    za.h[w8, 0, vgx4], {z28.h - z31.h}, z0.h[0]
fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h[0]
fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h[7]
fmls    za.h[w11, 7, vgx4], {z28.h - z31.h}, z15.h[7]
fmls    za.h[w9, 7, vgx4], {z28.h - z31.h}, z15.h[3]
fmls    za.h[w8, 3], {z0.h - z3.h}, z0.h[7]

/* FMLS (multiple and single vector).  */
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z0.h
fmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, z0.h
fmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, z0.h
fmls    za.h[w8, 0, vgx2], {z31.h - z0.h}, z0.h
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, z15.h
fmls    za.h[w11, 7, vgx2], {z30.h - z31.h}, z15.h
fmls    za.h[w8, 3], {z0.h - z1.h}, z15.h

fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z0.h
fmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, z0.h
fmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, z0.h
fmls    za.h[w8, 0, vgx4], {z31.h - z2.h}, z0.h
fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, z15.h
fmls    za.h[w11, 7, vgx4], {z28.h - z31.h}, z15.h
fmls    za.h[w8, 3], {z0.h - z3.h}, z15.h

/* FMLS (multiple vectors).  */
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmls    za.h[w11, 0, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmls    za.h[w8, 7, vgx2], {z0.h - z1.h}, {z0.h - z1.h}
fmls    za.h[w8, 0, vgx2], {z30.h - z31.h}, {z0.h - z1.h}
fmls    za.h[w8, 0, vgx2], {z0.h - z1.h}, {z30.h - z31.h}
fmls    za.h[w11, 7, vgx2], {z30.h - z31.h}, {z30.h - z31.h}
fmls    za.h[w8, 3], {z0.h - z1.h}, {z30.h - z31.h}

fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmls    za.h[w11, 0, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmls    za.h[w8, 7, vgx4], {z0.h - z3.h}, {z0.h - z3.h}
fmls    za.h[w8, 0, vgx4], {z28.h - z31.h}, {z0.h - z3.h}
fmls    za.h[w8, 0, vgx4], {z0.h - z3.h}, {z28.h - z31.h}
fmls    za.h[w11, 7, vgx4], {z28.h - z31.h}, {z28.h - z31.h}
fmls    za.h[w8, 3], {z0.h - z3.h}, {z28.h - z31.h}
