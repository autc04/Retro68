#name: Undefined local label error
# COFF and aout based ports, except Windows CE, 
# use a different naming convention for local labels.
#not-skip: *-unknown-pe
#error-output: undefined_coff.l
