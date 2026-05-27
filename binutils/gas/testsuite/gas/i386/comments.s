scrubber:
	.irp x,""

/*    */vaddps	%zmm0, %zmm1, %zmm2
	vaddps/**/%zmm0, %zmm1, %zmm2
	vadd/**/ps %zmm0, %zmm1, %zmm2
	vaddps	%zmm/**/0, %zmm1, %zmm2

	vaddps	%zmm0, %zmm1, %zmm2# ...
	vaddps	%zmm0, %zmm1, %zmm2	# ...
	vaddps	%zmm0, %zmm1, %zmm2/*    */# ...

	.endr
