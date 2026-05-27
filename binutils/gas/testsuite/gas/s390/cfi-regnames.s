	.text
# General register (GR) names r0..r15
	.type gr, @function
gr:
	.cfi_startproc
	.word 0
	.cfi_register r0, r1
	.cfi_register r2, r3
	.cfi_register r4, r5
	.cfi_register r6, r7
	.cfi_register r8, r9
	.cfi_register r10, r11
	.cfi_register r12, r13
	.cfi_register r14, r15
	.word 0
	.cfi_endproc
	.size gr, .-gr
# Floating-point register (FPR) names f0..f15
	.type fpr, @function
fpr:
	.cfi_startproc
	.word 0
	.cfi_register f0, f1
	.cfi_register f2, f3
	.cfi_register f4, f5
	.cfi_register f6, f7
	.cfi_register f8, f9
	.cfi_register f10, f11
	.cfi_register f12, f13
	.cfi_register f14, f15
	.word 0
	.cfi_endproc
	.size fpr, .-fpr
# Vector register (VR) names v0..v31
	.type vr, @function
vr:
	.cfi_startproc
	.word 0
	.cfi_register v0, v1
	.cfi_register v2, v3
	.cfi_register v4, v5
	.cfi_register v6, v7
	.cfi_register v8, v9
	.cfi_register v10, v11
	.cfi_register v12, v13
	.cfi_register v14, v15
	.cfi_register v16, v17
	.cfi_register v18, v19
	.cfi_register v20, v21
	.cfi_register v22, v23
	.cfi_register v24, v25
	.cfi_register v26, v27
	.cfi_register v28, v29
	.cfi_register v30, v31
	.word 0
	.cfi_endproc
	.size vr, .-vr
# Access register (AR) names a0..a15
	.type ar, @function
ar:
	.cfi_startproc
	.word 0
	.cfi_register a0, a1
	.cfi_register a2, a3
	.cfi_register a4, a5
	.cfi_register a6, a7
	.cfi_register a8, a9
	.cfi_register a10, a11
	.cfi_register a12, a13
	.cfi_register a14, a15
	.word 0
	.cfi_endproc
	.size ar, .-ar
