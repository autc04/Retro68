# Check AVX10.2/256 evex promoted instructions

	.arch generic32
	.arch .avx10.2/256
	.arch .avx_vnni_int16
	.arch .avx_vnni_int8
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%ymm4, %ymm5, %ymm6
	vpdpb\m\()d\s	%xmm4, %xmm5, %xmm6
	vpdpb\m\()d\s	(%ecx), %ymm5, %ymm6
	vpdpb\m\()d\s	(%ecx), %xmm5, %xmm6
	{evex} vpdpb\m\()d\s	%ymm4, %ymm5, %ymm6
	{evex} vpdpb\m\()d\s	%xmm4, %xmm5, %xmm6
	{evex} vpdpb\m\()d\s	(%ecx), %ymm5, %ymm6
	{evex} vpdpb\m\()d\s	(%ecx), %xmm5, %xmm6
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%ymm4, %ymm5, %ymm6
	vpdpw\m\()d\s	%xmm4, %xmm5, %xmm6
	vpdpw\m\()d\s	(%ecx), %ymm5, %ymm6
	vpdpw\m\()d\s	(%ecx), %xmm5, %xmm6
	{evex} vpdpw\m\()d\s	%ymm4, %ymm5, %ymm6
	{evex} vpdpw\m\()d\s	%xmm4, %xmm5, %xmm6
	{evex} vpdpw\m\()d\s	(%ecx), %ymm5, %ymm6
	{evex} vpdpw\m\()d\s	(%ecx), %xmm5, %xmm6
	.endr
	.endr

	vmpsadbw	$123, %xmm4, %xmm5, %xmm6
	vmpsadbw	$123, %ymm4, %ymm5, %ymm6
	vmpsadbw	$123, (%ecx), %xmm5, %xmm6
	vmpsadbw	$123, (%ecx), %ymm5, %ymm6
	{evex} vmpsadbw	$123, %xmm4, %xmm5, %xmm6
	{evex} vmpsadbw	$123, %ymm4, %ymm5, %ymm6
	{evex} vmpsadbw	$123, (%ecx), %xmm5, %xmm6
	{evex} vmpsadbw	$123, (%ecx), %ymm5, %ymm6
