	.include "sysreg-test-utils.inc"
.text
	.arch armv8-r
	rw_sys_reg mpuir_el1 w=0  // V8R

	.arch armv8.1-a
	rw_sys_reg afsr0_el12   // V8_1A

	.arch armv8.2-a
	rw_sys_reg uao   // V8_2A

	.arch armv8.3-a
	rw_sys_reg apdakeyhi_el1   // V8_3A

	.arch armv8.4-a
	rw_sys_reg amcfgr_el0 w=0  // V8_4A
	rw_sys_reg vsttbr_el2   // V8A && V8_4A

	.arch armv8.5-a
	rw_sys_reg scxtnum_el0   // SCXTNUM
	rw_sys_reg id_pfr2_el1 w=0  // ID_PFR2

	.arch armv8.6-a
        rw_sys_reg amcg1idr_el0 w=0  // V8_6A

	.arch armv8.7-a
	rw_sys_reg hcrx_el2   // V8_7A

	.arch armv8.8-a
	rw_sys_reg allint   // V8_8A

	.arch armv8.9-a+profile
	rw_sys_reg pfar_el1   // PFAR
	rw_sys_reg pir_el1   // S1PIE
	rw_sys_reg pmecr_el1   // SEBEP
	rw_sys_reg hdfgrtr2_el2   // FGT2
	rw_sys_reg mdselr_el1   // DEBUGv8p9
	rw_sys_reg pmicfiltr_el0   // PMUv3_ICNTR
	rw_sys_reg pmsdsfr_el1   // SPE_FDS
	rw_sys_reg pmuacr_el1   // PMUv3p9
	rw_sys_reg por_el0   // S1POE
	rw_sys_reg s2pir_el2   // S2PIE
	rw_sys_reg s2por_el1   // S2POE
	rw_sys_reg sctlr2_el1   // SCTLR2
	rw_sys_reg spmaccessr_el1   // SPMU
	rw_sys_reg tcr2_el1   // TCR2
	rw_sys_reg amair2_el1   // AIE
	rw_sys_reg pmccntsvr_el1 w=0  // PMUv3_SS

	.arch armv9.5-a
	rw_sys_reg vdisr_el3   // E3DES
	rw_sys_reg spmzr_el0 r=0   // SPMU2
	rw_sys_reg mdstepop_el1   // STEP2
	rw_sys_reg gpcbw_el3   // V9_5A

	.arch armv9.5-a+profile
	rw_sys_reg pmbmar_el1   // PROFILE && V9_5A

	.arch_extension rasv2
	rw_sys_reg erxgsr_el1 w=0  // RASv2
	.arch_extension fp8
	rw_sys_reg fpmr   // FP8
	.arch_extension sve
	rw_sys_reg id_aa64zfr0_el1 w=0  // SVE
	.arch_extension lor
	rw_sys_reg lorc_el1   // LOR
	.arch_extension profile
	rw_sys_reg pmbidr_el1 w=0  // PROFILE
	.arch_extension gcs
	rw_sys_reg gcspr_el0   // GCS
	.arch_extension sme
	rw_sys_reg id_aa64smfr0_el1 w=0  // SME
	.arch_extension ite
	rw_sys_reg trcitecr_el1   // ITE
	.arch_extension memtag
	rw_sys_reg gcr_el1   // MEMTAG
	.arch_extension rng
	rw_sys_reg rndr w=0  // RNG
	.arch_extension ras
	rw_sys_reg disr_el1   // RAS
	.arch_extension pan
	rw_sys_reg pan   // PAN
	.arch_extension ssbs
	rw_sys_reg ssbs   // SSBS
	.arch_extension gcie
	rw_sys_reg icc_apr_el1   // GCIE

	.arch_extension d128 // For the msrr and mrrs instructions.
	.arch_extension the
	rw_sys_reg_128 rcwmask_el1 xreg1=x2 xreg2=x3  // THE

	.arch armv8-a+d128
	rw_sys_reg_128 ttbr0_el2 xreg1=x2 xreg2=x3  // V8A
	.arch armv8.1-a+d128
	rw_sys_reg_128 ttbr1_el2 xreg1=x2 xreg2=x3  // V8A && V8_1A
