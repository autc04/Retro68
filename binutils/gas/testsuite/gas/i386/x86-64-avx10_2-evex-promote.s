# Check AVX10.2/256 evex promoted instructions

	.arch generic64
	.arch .avx10.2/256
	.arch .avx_vnni_int8
	.arch .avx_vnni_int16
	.text
_start:
	.irp m, ss, su, uu
	.irp s, "", s
	vpdpb\m\()d\s	%ymm14, %ymm5, %ymm6
	vpdpb\m\()d\s	%xmm14, %xmm5, %xmm6
	vpdpb\m\()d\s	(%rcx), %ymm5, %ymm6
	vpdpb\m\()d\s	(%rcx), %xmm5, %xmm6
	{evex} vpdpb\m\()d\s	%ymm14, %ymm5, %ymm6
	{evex} vpdpb\m\()d\s	%xmm14, %xmm5, %xmm6
	{evex} vpdpb\m\()d\s	(%rcx), %ymm5, %ymm6
	{evex} vpdpb\m\()d\s	(%rcx), %xmm5, %xmm6
	.endr
	.endr

	.irp m, su, us, uu
	.irp s, "", s
	vpdpw\m\()d\s	%ymm14, %ymm5, %ymm6
	vpdpw\m\()d\s	%xmm14, %xmm5, %xmm6
	vpdpw\m\()d\s	(%rcx), %ymm5, %ymm6
	vpdpw\m\()d\s	(%rcx), %xmm5, %xmm6
	{evex} vpdpw\m\()d\s	%ymm14, %ymm5, %ymm6
	{evex} vpdpw\m\()d\s	%xmm14, %xmm5, %xmm6
	{evex} vpdpw\m\()d\s	(%rcx), %ymm5, %ymm6
	{evex} vpdpw\m\()d\s	(%rcx), %xmm5, %xmm6
	.endr
	.endr

	vmpsadbw	$123, %xmm14, %xmm5, %xmm6
	vmpsadbw	$123, %ymm14, %ymm5, %ymm6
	vmpsadbw	$123, (%rcx), %xmm5, %xmm6
	vmpsadbw	$123, (%rcx), %ymm5, %ymm6
	{evex} vmpsadbw	$123, %xmm14, %xmm5, %xmm6
	{evex} vmpsadbw	$123, %ymm14, %ymm5, %ymm6
	{evex} vmpsadbw	$123, (%rcx), %xmm5, %xmm6
	{evex} vmpsadbw	$123, (%rcx), %ymm5, %ymm6
