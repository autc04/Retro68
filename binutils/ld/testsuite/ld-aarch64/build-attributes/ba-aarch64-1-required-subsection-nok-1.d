# name: EABI build attributes: combine non-matching aeabi_pauthabi subsections
# source: ba-aarch64-1-required-subsection-1.s
# source: ba-aarch64-1-required-subsection-mismatch-1.s
# source: ba-aarch64-1-required-subsection-2.s
# as:
# ld: -shared
#error: \A[^\n]*ba-aarch64-1-required-subsection-mismatch-1\.o: error: mismatching value for required object attribute 'Tag_PAuth_Platform' in subsection 'aeabi_pauthabi': 0xdead
#error: \n[^\n]*ba-aarch64-1-required-subsection-1\.o: info: conflicting value '0' lives here
#error: \n[^\n]*ba-aarch64-1-required-subsection-mismatch-1\.o: error: mismatching value for required object attribute 'Tag_PAuth_Schema' in subsection 'aeabi_pauthabi': 0xbeef
#error: \n[^\n]*ba-aarch64-1-required-subsection-1\.o: info: conflicting value '0x1' lives here\Z
