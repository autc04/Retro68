.syntax unified
.thumb
.irp data, u8, s8, u16, s16, u32, s32, i8, i16, i32
.irp op1, q0, q1, q2, q4, q7
.irp op2, q0, q1, q2, q4, q7
.irp op3, r0, r1, r2, r4, r7, r8, r10, r12, r14
vmlas.\data \op1, \op2, \op3
.endr
.endr
.endr
.endr
vpste
vmlast.s8 q0, q1, r2
vmlase.u16 q2, q5, r6
vpste
vmlast.i8 q0, q1, r2
vmlase.i8 q2, q5, r6

@ bit 12 is ignored, should decode as vmlas.i8 q0, q0, r0
.inst 0xfe011e40
