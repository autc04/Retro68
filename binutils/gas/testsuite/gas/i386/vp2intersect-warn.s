# Check warning for odd destination register numbers.

	.text
_start:
	vp2intersectd (%eax), %xmm2, %k1
	vp2intersectd (%eax), %ymm2, %k3
	vp2intersectd (%eax), %zmm2, %k5
	vp2intersectq (%eax), %xmm2, %k3
	vp2intersectq (%eax), %ymm2, %k5
	vp2intersectq (%eax), %zmm2, %k7
	.end
