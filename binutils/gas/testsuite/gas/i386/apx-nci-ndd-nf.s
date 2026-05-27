# .arch .apx_n* directives

	.text
	.irp feat, f, nci, ndd, nf, nci_ndd_nf

apx_\feat:
	.arch generic64
	.arch .adx
	.arch .bmi
	.arch .lzcnt
	.arch .popcnt
	.arch .apx_\feat

	{evex} add	%r16, %r17
	add		%r16, %r17, %r18
	{nf} add	%r16, %r17
	adox		%r16, %r17
	adox		%r16, %r17, %r18
	andn		%r16, %r17, %r18
	{nf} andn	%r16, %r17, %r18
	ccmpz		%r16, %r17
	{load} cfcmovz	%r16, %r17
	{store} cfcmovz	%r16, %r17
	cfcmovz		%r16, %r17, %r18
	cmovz		%r16, %r17, %r18
	{evex} cmp	%r16, %r17
	{evex} lzcnt	%r16, %r17
	{nf} popcnt	%r16, %r17
	{evex} tzcnt	%r16, %r17

	.endr

	.arch default
	.arch .noapx_nci_ndd_nf
	add		%r16, %r17
	adox		%r16, %r17
	andn		%r16, %r17, %r18
