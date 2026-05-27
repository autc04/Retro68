.include "sysreg-test-utils.inc"

.text

/* Delegated SError exceptions for EL3. */
rw_sys_reg vdisr_el3
rw_sys_reg vsesr_el3

/* System Performance Monitors Extension version 2. */
rw_sys_reg spmzr_el0 r=0

/* Enhanced Software Step Extension. */
rw_sys_reg mdstepop_el1
