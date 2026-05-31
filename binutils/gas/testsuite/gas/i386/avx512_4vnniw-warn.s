# Check warnings for invalid usage of register group

	.text
	vp4dpwssd (%eax), %zmm0, %zmm6
	vp4dpwssd (%eax), %zmm1, %zmm6
	vp4dpwssd (%eax), %zmm2, %zmm6
	vp4dpwssd (%eax), %zmm3, %zmm6
	vp4dpwssd (%eax), %zmm4, %zmm6
	vp4dpwssds (%eax), %zmm0, %zmm6
	vp4dpwssds (%eax), %zmm1, %zmm6
	vp4dpwssds (%eax), %zmm2, %zmm6
	vp4dpwssds (%eax), %zmm3, %zmm6
	vp4dpwssds (%eax), %zmm4, %zmm6
