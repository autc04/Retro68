/* This is read-only register */
msr mpambwidr_el1, x0

/* This register is not available without +sme flag */
mrs x0, mpambwsm_el1
msr mpambwsm_el1, x0
