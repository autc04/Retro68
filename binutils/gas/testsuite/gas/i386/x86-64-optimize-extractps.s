	.text
extractps:
	extractps	$0, %xmm1, %edx
	extractps	$0, %xmm1, (%rdx)

	extractps	$0, %xmm1, %r18d
	extractps	$0, %xmm1, (%r18)

	vextractps	$0, %xmm1, %edx
	vextractps	$0, %xmm1, (%rdx)

	vextractps	$0, %xmm17, %edx
	vextractps	$0, %xmm1, %r18d
	vextractps	$0, %xmm1, (%r18)
