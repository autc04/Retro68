.include "sysreg-test-utils.inc"

.text

.altmacro

.macro rw_sys_reg_16 base, suffix
	 .irp counter,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
		rw_sys_reg \base\counter&&\suffix
	.endr
.endm

// AFGDTpn_ELx system registers
        rw_sys_reg_16 AFGDTP, _EL1
        rw_sys_reg_16 AFGDTP, _EL12
        rw_sys_reg_16 AFGDTP, _EL2
        rw_sys_reg_16 AFGDTP, _EL3
        rw_sys_reg_16 AFGDTU, _EL1
        rw_sys_reg_16 AFGDTU, _EL12
        rw_sys_reg_16 AFGDTU, _EL2

// FGDTpn_ELx system registers
        rw_sys_reg_16 FGDTP, _EL1
        rw_sys_reg_16 FGDTP, _EL12
        rw_sys_reg_16 FGDTP, _EL2
        rw_sys_reg_16 FGDTP, _EL3
        rw_sys_reg_16 FGDTU, _EL1
        rw_sys_reg_16 FGDTU, _EL12
        rw_sys_reg_16 FGDTU, _EL2

// DPOTBRn_ELx system registers
        rw_sys_reg DPOTBR0_EL1
        rw_sys_reg DPOTBR1_EL1
        rw_sys_reg DPOTBR0_EL12
        rw_sys_reg DPOTBR1_EL12
        rw_sys_reg DPOTBR0_EL2
        rw_sys_reg DPOTBR1_EL2
        rw_sys_reg DPOTBR0_EL3

// TPIDR3_ELx system registers
        rw_sys_reg TPIDR3_EL0
        rw_sys_reg TPIDR3_EL1
        rw_sys_reg TPIDR3_EL12
        rw_sys_reg TPIDR3_EL2
        rw_sys_reg TPIDR3_EL3

// IRTBRp_ELx system registers
	rw_sys_reg IRTBRU_EL1
	rw_sys_reg IRTBRU_EL12
	rw_sys_reg IRTBRU_EL2
	rw_sys_reg IRTBRP_EL1
	rw_sys_reg IRTBRP_EL12
	rw_sys_reg IRTBRP_EL2
	rw_sys_reg IRTBRP_EL3

// LDSTT_ELx system registers
	rw_sys_reg LDSTT_EL1
	rw_sys_reg LDSTT_EL12
	rw_sys_reg LDSTT_EL2

// STINDEX_ELx system registers
	rw_sys_reg STINDEX_EL1
	rw_sys_reg STINDEX_EL12
	rw_sys_reg STINDEX_EL2
	rw_sys_reg STINDEX_EL3

// TINDEX_ELx system registers
	rw_sys_reg TINDEX_EL0
	rw_sys_reg TINDEX_EL1
	rw_sys_reg TINDEX_EL12
	rw_sys_reg TINDEX_EL2
	rw_sys_reg TINDEX_EL3

// TTTBRp_ELx system registers
	rw_sys_reg TTTBRU_EL1
	rw_sys_reg TTTBRU_EL12
	rw_sys_reg TTTBRU_EL2
	rw_sys_reg TTTBRP_EL1
	rw_sys_reg TTTBRP_EL12
	rw_sys_reg TTTBRP_EL2
	rw_sys_reg TTTBRP_EL3

// DPOCR_EL0 system registers
	rw_sys_reg DPOCR_EL0

// VNCCR_EL2 system registers
	rw_sys_reg VNCCR_EL2
.noaltmacro
