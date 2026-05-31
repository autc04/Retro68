/* FADD.  */
fadd    za.h[w8, 0, vgx2], {z0.h - z1.h}
fadd    za.h[w11, 0, vgx2], {z0.h - z1.h}
fadd    za.h[w8, 7, vgx2], {z0.h - z1.h}
fadd    za.h[w8, 0, vgx2], {z30.h - z31.h}
fadd    za.h[w11, 7, vgx2], {z30.h - z31.h}
fadd    za.h[w9, 3, vgx2], {z16.h - z17.h}
fadd    za.h[w10, 1], {z8.h - z9.h}

fadd    za.h[w8, 0, vgx4], {z0.h - z3.h}
fadd    za.h[w11, 0, vgx4], {z0.h - z3.h}
fadd    za.h[w8, 7, vgx4], {z0.h - z3.h}
fadd    za.h[w8, 0, vgx4], {z28.h - z31.h}
fadd    za.h[w11, 7, vgx4], {z28.h - z31.h}
fadd    za.h[w9, 3, vgx4], {z12.h - z15.h}
fadd    za.h[w10, 1], {z8.h - z11.h}

/* FSUB.  */
fsub    za.h[w8, 0, vgx2], {z0.h - z1.h}
fsub    za.h[w11, 0, vgx2], {z0.h - z1.h}
fsub    za.h[w8, 7, vgx2], {z0.h - z1.h}
fsub    za.h[w8, 0, vgx2], {z30.h - z31.h}
fsub    za.h[w11, 7, vgx2], {z30.h - z31.h}
fsub    za.h[w9, 3, vgx2], {z16.h - z17.h}
fsub    za.h[w10, 1], {z8.h - z9.h}

fsub    za.h[w8, 0, vgx4], {z0.h - z3.h}
fsub    za.h[w11, 0, vgx4], {z0.h - z3.h}
fsub    za.h[w8, 7, vgx4], {z0.h - z3.h}
fsub    za.h[w8, 0, vgx4], {z28.h - z31.h}
fsub    za.h[w11, 7, vgx4], {z28.h - z31.h}
fsub    za.h[w9, 3, vgx4], {z12.h - z15.h}
fsub    za.h[w10, 1], {z8.h - z11.h}
