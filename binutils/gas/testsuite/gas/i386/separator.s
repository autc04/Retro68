	.text
separators:
	jc,pt		.
	jc ,pt		.
	jc, pt		.
	jc , pt		.
	jc/**/,/**/pt	.

	{disp32} jc,pt	.
	{disp32} jc ,pt .
	{disp32} jc, pt .
	{disp32} jc , pt .

	# Which block to use depends on whether / starts a comment.
	.ifeq 1/2

	gs/neg	%eax
	gs /neg	%eax
	gs/ neg	%eax
	gs / neg %eax
	gs/**///**/neg %eax

	{disp32} gs/neg %eax
	{disp32} gs /neg %eax
	{disp32} gs/ neg %eax
	{disp32} gs / neg %eax

	.else

	gs\neg	%eax
	gs \neg	%eax
	gs\ neg	%eax
	gs \ neg %eax
	gs/**/\/**/neg %eax

	{disp32} gs\neg %eax
	{disp32} gs \neg %eax
	{disp32} gs\ neg %eax
	{disp32} gs \ neg %eax

	.endif
