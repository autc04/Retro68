	.if end - start > 16
	.warning
	.endif
	.warnif end - start < 16
	.errif end - start >= 16
	.warnif 1b
	.warning

	.data
start:
	.uleb128 end - start
end:
