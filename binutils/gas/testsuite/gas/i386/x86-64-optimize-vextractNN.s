	.text
vextract_128:
	vextractf128 $0, %ymm1, %xmm2
	vextractf128 $0, %ymm1, (%rdx)

	vextracti128 $0, %ymm1, %xmm2
	vextracti128 $0, %ymm1, (%rdx)

vextract_NNxM_XMM:
	vextractf32x4 $0, %ymm1, %xmm2
	vextractf32x4 $0, %ymm1, (%rdx)
	vextractf32x4 $0, %ymm17, %xmm2
	vextractf32x4 $0, %ymm17, (%rdx)
	vextractf32x4 $0, %ymm1, (%r18)

	vextractf64x2 $0, %ymm1, %xmm2
	vextractf64x2 $0, %ymm1, (%rdx)
	vextractf64x2 $0, %ymm17, %xmm2
	vextractf64x2 $0, %ymm17, (%rdx)
	vextractf64x2 $0, %ymm1, (%r18)

	vextracti32x4 $0, %ymm1, %xmm2
	vextracti32x4 $0, %ymm1, (%rdx)
	vextracti32x4 $0, %ymm17, %xmm2
	vextracti32x4 $0, %ymm17, (%rdx)
	vextracti32x4 $0, %ymm1, (%r18)

	vextracti64x2 $0, %ymm1, %xmm2
	vextracti64x2 $0, %ymm1, (%rdx)
	vextracti64x2 $0, %ymm17, %xmm2
	vextracti64x2 $0, %ymm17, (%rdx)
	vextracti64x2 $0, %ymm1, (%r18)

vextract_NNxM_YMM:
	vextractf32x8 $0, %zmm1, %ymm2
	vextractf32x8 $0, %zmm1, (%rdx)
	vextractf32x8 $0, %zmm17, %ymm2
	vextractf32x8 $0, %zmm17, (%rdx)
	vextractf32x8 $0, %zmm1, (%r18)

	vextractf64x4 $0, %zmm1, %ymm2
	vextractf64x4 $0, %zmm1, (%rdx)
	vextractf64x4 $0, %zmm17, %ymm2
	vextractf64x4 $0, %zmm17, (%rdx)
	vextractf64x4 $0, %zmm1, (%r18)

	vextracti32x8 $0, %zmm1, %ymm2
	vextracti32x8 $0, %zmm1, (%rdx)
	vextracti32x8 $0, %zmm17, %ymm2
	vextracti32x8 $0, %zmm17, (%rdx)
	vextracti32x8 $0, %zmm1, (%r18)

	vextracti64x4 $0, %zmm1, %ymm2
	vextracti64x4 $0, %zmm1, (%rdx)
	vextracti64x4 $0, %zmm17, %ymm2
	vextracti64x4 $0, %zmm17, (%rdx)
	vextracti64x4 $0, %zmm1, (%r18)
