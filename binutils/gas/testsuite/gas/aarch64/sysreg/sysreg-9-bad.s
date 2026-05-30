.include "sysreg-test-utils.inc"

.text

.arch	armv9.4-a+profile
rw_sys_reg pmbmar_el1
rw_sys_reg pmbsr_el12
rw_sys_reg pmbsr_el2
rw_sys_reg pmbsr_el3

.arch	armv9.5-a
rw_sys_reg pmbmar_el1
rw_sys_reg pmbsr_el12
rw_sys_reg pmbsr_el2
rw_sys_reg pmbsr_el3

.arch	armv9.4-a
rw_sys_reg pmbmar_el1
rw_sys_reg pmbsr_el12
rw_sys_reg pmbsr_el2
rw_sys_reg pmbsr_el3

.arch	armv9.4-a
rw_sys_reg trbsr_el12
rw_sys_reg trbsr_el2
rw_sys_reg trbsr_el3
