	.irp	plbi_op vmalle1os,vmalle1is,vmalle1,alle2os,alle1os,alle2is,alle1is,alle2,alle1,alle3os,alle3is,alle3
	plbi	\plbi_op
	plbi	\plbi_op\()nxs
	.endr

	.irp	plbi_op perme1os,aside1os,permae1os,perme1is,aside1is,permae1is,perme1,aside1,permae1,perme2os,perme2is,perme2,perme3os,perme3is,perme3
	.irp    rt, x0, xzr
	plbi	\plbi_op, \rt
	plbi	\plbi_op\()nxs, \rt
	.endr
	.endr
