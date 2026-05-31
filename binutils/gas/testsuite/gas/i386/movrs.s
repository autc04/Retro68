# Check 32bit MOVRS instructions

	.text
_start:
	prefetchrst2	0x10000000(%esp, %esi, 8)
	prefetchrst2	(%ecx)
	prefetchrst2	127(%ecx)
	prefetchrst2	-128(%edx)

_intel:
	.intel_syntax noprefix
	prefetchrst2	BYTE PTR [esp+esi*8+0x10000000]
	prefetchrst2	BYTE PTR [ecx]
	prefetchrst2	BYTE PTR [ecx+127]
	prefetchrst2	BYTE PTR [edx-128]
