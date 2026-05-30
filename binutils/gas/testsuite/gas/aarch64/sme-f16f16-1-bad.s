/* FADD.  */
fadd    za.s[w8, 0, vgx2], {z0.h - z1.h}
fadd    za.h[w13, 0, vgx2], {z1.h - z0.h}
fadd    za.h[w8, 11, vgx3], {z0.h - z1.h}
fadd    za.h[w8, 0, vgx2], {z0.h - z4.h}

fadd    za.s[w8, 0, vgx4], {z0.h - z3.h}
fadd    za.h[w14, 0, vgx4], {z10.h - z3.h}
fadd    za.h[w8, 15, vgx1], {z3.h - z2.h}
fadd    za.h[w8, 0, vgx4], {z30.h - z31.h}

/* FSUB.  */
fsub    za.s[w8, 0, vgx2], {z0.h - z1.h}
fsub    za.h[w13, 0, vgx2], {z1.h - z0.h}
fsub    za.h[w8, 11, vgx3], {z0.h - z1.h}
fsub    za.h[w8, 0, vgx2], {z0.h - z4.h}

fsub    za.s[w8, 0, vgx4], {z0.h - z3.h}
fsub    za.h[w14, 0, vgx4], {z10.h - z3.h}
fsub    za.h[w8, 15, vgx1], {z3.h - z2.h}
fsub    za.h[w8, 0, vgx4], {z30.h - z31.h}
