	.attribute arch, "rv32iv"
	# xsfvcp
	.option push
	.option arch, +xsfvcp
	sf.vc.x 0x3, 0xf, 0x1f, a1
	sf.vc.i 0x3, 0xf, 0x1f, 15
	sf.vc.vv 0x3, 0x1f, v2, v1
	sf.vc.xv 0x3, 0x1f, v2, a1
	sf.vc.iv 0x3, 0x1f, v2, 15
	sf.vc.fv 0x1, 0x1f, v2, fa1
	sf.vc.vvv 0x3, v0, v2, v1
	sf.vc.xvv 0x3, v0, v2, a1
	sf.vc.ivv 0x3, v0, v2, 15
	sf.vc.fvv 0x1, v0, v2, fa1
	sf.vc.vvw 0x3, v0, v2, v1
	sf.vc.xvw 0x3, v0, v2, a1
	sf.vc.ivw 0x3, v0, v2, 15
	sf.vc.fvw 0x1, v0, v2, fa1
	sf.vc.v.x 0x3, 0xf, v0, a1
	sf.vc.v.i 0x3, 0xf, v0, 15
	sf.vc.v.vv 0x3, v0, v2, v1
	sf.vc.v.xv 0x3, v0, v2, a1
	sf.vc.v.iv 0x3, v0, v2, 15
	sf.vc.v.fv 0x1, v0, v2, fa1
	sf.vc.v.vvv 0x3, v0, v2, v1
	sf.vc.v.xvv 0x3, v0, v2, a1
	sf.vc.v.ivv 0x3, v0, v2, 15
	sf.vc.v.fvv 0x1, v0, v2, fa1
	sf.vc.v.vvw 0x3, v0, v2, v1
	sf.vc.v.xvw 0x3, v0, v2, a1
	sf.vc.v.ivw 0x3, v0, v2, 15
	sf.vc.v.fvw 0x1, v0, v2, fa1
	.option pop

	# xscease
	.option push
	.option arch, +xsfcease1p0
	sf.cease
	.option pop

	# xsfvqmaccqoq
	.option push
	.option arch, +xsfvqmaccqoq
	sf.vqmaccu.4x8x4 v4, v8, v12
	sf.vqmacc.4x8x4 v4, v8, v12
	sf.vqmaccus.4x8x4 v4, v8, v12
	sf.vqmaccsu.4x8x4 v4, v8, v12
	.option pop

	# xsfvqmaccdod
	.option push
	.option arch, +xsfvqmaccdod
	sf.vqmaccu.2x8x2 v4, v8, v12
	sf.vqmacc.2x8x2 v4, v8, v12
	sf.vqmaccus.2x8x2 v4, v8, v12
	sf.vqmaccsu.2x8x2 v4, v8, v12
	.option pop

	# xsfvfnrclipxfqf
	.option push
	.option arch, +xsfvfnrclipxfqf
	sf.vfnrclip.xu.f.qf v4, v8, f12
	sf.vfnrclip.x.f.qf  v4, v8, f12
	.option pop
