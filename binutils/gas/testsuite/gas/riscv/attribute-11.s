	# The csr is explicit used, so we need to generate the priv spec
	# attributes even if the attributes are not set.
	.option arch, +zicsr
	csrr a0, 0x0
