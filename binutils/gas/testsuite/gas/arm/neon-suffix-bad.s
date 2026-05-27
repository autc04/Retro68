.syntax unified
.arm
add.f32 r0, r0, r0
faddd.f32 d0, d0, d0
faddd.f64 d0, d0, d0
vcvt.f64.s32 d0, s0, #11

.thumb
add.f32 r0, r0, r0
faddd.f32 d0, d0, d0
faddd.f64 d0, d0, d0
vcvt.f64.s32 d0, s0, #11

	.arm
	.arch armv8.6-a
	.arch_extension simd
	vcvt.bf16.f32	d0, q0		@ good, for reference

	vcvt.bf016.f32	d0, q0
	vcvt.bf16.f032	d0, q0

	vcvt.bf-4294967280.f32	d0, q0
	vcvt.bf16.f-4294967264	d0, q0

	vcvt.bf4294967312.f32	d0, q0
	vcvt.bf16.f4294967328	d0, q0

	vcvt.b f16.f32	d0, q0
	vcvt.bf 16.f32	d0, q0
	vcvt.bf16 .f32	d0, q0
	vcvt.bf16. f32	d0, q0
	vcvt.bf16.f 32	d0, q0

	vcvt.bf16.f32d0, q0
	vcvt.bf16.fd0, q0
