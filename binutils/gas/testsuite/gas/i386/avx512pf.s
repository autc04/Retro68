# Check 32bit AVX512PF instructions

	.allow_index_reg
	.text
_start:

	vgatherpf0dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vgatherpf0dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vgatherpf0dpd	256(%eax,%ymm7){%k1}	 # AVX512PF
	vgatherpf0dpd	1024(%ecx,%ymm7,4){%k1}	 # AVX512PF

	vgatherpf0dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0dps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf0dps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vgatherpf0qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0qpd	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf0qpd	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vgatherpf0qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf0qps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf0qps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vgatherpf1dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vgatherpf1dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vgatherpf1dpd	256(%eax,%ymm7){%k1}	 # AVX512PF
	vgatherpf1dpd	1024(%ecx,%ymm7,4){%k1}	 # AVX512PF

	vgatherpf1dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1dps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf1dps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vgatherpf1qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1qpd	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf1qpd	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vgatherpf1qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vgatherpf1qps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vgatherpf1qps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf0dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vscatterpf0dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vscatterpf0dpd	256(%eax,%ymm7){%k1}	 # AVX512PF
	vscatterpf0dpd	1024(%ecx,%ymm7,4){%k1}	 # AVX512PF

	vscatterpf0dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0dps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf0dps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf0qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0qpd	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf0qpd	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf0qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf0qps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf0qps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf1dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vscatterpf1dpd	123(%ebp,%ymm7,8){%k1}	 # AVX512PF
	vscatterpf1dpd	256(%eax,%ymm7){%k1}	 # AVX512PF
	vscatterpf1dpd	1024(%ecx,%ymm7,4){%k1}	 # AVX512PF

	vscatterpf1dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1dps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1dps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf1dps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf1qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1qpd	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1qpd	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf1qpd	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	vscatterpf1qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1qps	123(%ebp,%zmm7,8){%k1}	 # AVX512PF
	vscatterpf1qps	256(%eax,%zmm7){%k1}	 # AVX512PF
	vscatterpf1qps	1024(%ecx,%zmm7,4){%k1}	 # AVX512PF

	prefetchwt1	(%ecx)	 # AVX512PF
	prefetchwt1	-123456(%esp,%esi,8)	 # AVX512PF

	.intel_syntax noprefix
	vgatherpf0dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vgatherpf0dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vgatherpf0dpd	ZMMWORD PTR [eax+ymm7+256]{k1}	 # AVX512PF
	vgatherpf0dpd	ZMMWORD PTR [ecx+ymm7*4+1024]{k1}	 # AVX512PF

	vgatherpf0dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0dps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf0dps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vgatherpf0qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0qpd	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf0qpd	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vgatherpf0qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf0qps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf0qps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vgatherpf1dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vgatherpf1dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vgatherpf1dpd	ZMMWORD PTR [eax+ymm7+256]{k1}	 # AVX512PF
	vgatherpf1dpd	ZMMWORD PTR [ecx+ymm7*4+1024]{k1}	 # AVX512PF

	vgatherpf1dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1dps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf1dps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vgatherpf1qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1qpd	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf1qpd	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vgatherpf1qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vgatherpf1qps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vgatherpf1qps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf0dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vscatterpf0dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vscatterpf0dpd	ZMMWORD PTR [eax+ymm7+256]{k1}	 # AVX512PF
	vscatterpf0dpd	ZMMWORD PTR [ecx+ymm7*4+1024]{k1}	 # AVX512PF

	vscatterpf0dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0dps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf0dps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf0qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0qpd	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf0qpd	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf0qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf0qps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf0qps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf1dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vscatterpf1dpd	ZMMWORD PTR [ebp+ymm7*8-123]{k1}	 # AVX512PF
	vscatterpf1dpd	ZMMWORD PTR [eax+ymm7+256]{k1}	 # AVX512PF
	vscatterpf1dpd	ZMMWORD PTR [ecx+ymm7*4+1024]{k1}	 # AVX512PF

	vscatterpf1dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1dps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1dps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf1dps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf1qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1qpd	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1qpd	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf1qpd	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	vscatterpf1qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1qps	ZMMWORD PTR [ebp+zmm7*8-123]{k1}	 # AVX512PF
	vscatterpf1qps	ZMMWORD PTR [eax+zmm7+256]{k1}	 # AVX512PF
	vscatterpf1qps	ZMMWORD PTR [ecx+zmm7*4+1024]{k1}	 # AVX512PF

	prefetchwt1	BYTE PTR [ecx]	 # AVX512PF
	prefetchwt1	BYTE PTR [esp+esi*8-123456]	 # AVX512PF

