	.irp	mlbi_op vmalle1,alle1
	mlbi	\mlbi_op
	.endr

	.irp	mlbi_op vpide1,vpmge1
	.irp    rt, x0, xzr
	mlbi	\mlbi_op, \rt
	.endr
	.endr
