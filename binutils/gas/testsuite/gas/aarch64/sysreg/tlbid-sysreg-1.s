.include "sysreg-test-utils.inc"

.text

.arch	armv8-a+tlbid
rw_sys_reg tlbididr_el1 w=0
rw_sys_reg vtlbid0_el2
rw_sys_reg vtlbid1_el2
rw_sys_reg vtlbid2_el2
rw_sys_reg vtlbid3_el2
rw_sys_reg vtlbidos0_el2
rw_sys_reg vtlbidos1_el2
rw_sys_reg vtlbidos2_el2
rw_sys_reg vtlbidos3_el2
