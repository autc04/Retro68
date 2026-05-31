# name: EABI build attributes: subsections have different properties from the expected ones
# source: ba-aarch64-1-required-subsection-1.s
# source: ba-aarch64-1-required-subsection-mismatch-2.s
# source: ba-aarch64-1-required-subsection-2.s
# as:
# ld: -shared
#error: \A[^\n]*ba-aarch64-1-required-subsection-mismatch-2\.o: error: <comprehension> property of subsection 'aeabi_feature_and_bits' was incorrectly set.  Got 'required', expected 'optional'
#error: \n[^\n]*ba-aarch64-1-required-subsection-mismatch-2\.o: error: <encoding> property of subsection 'aeabi_pauthabi' was incorrectly set\.  Got 'NTBS', expected 'ULEB128'
#error: \n[^\n]*ba-aarch64-1-required-subsection-mismatch-2\.o: error: <comprehension> property of subsection 'aeabi_pauthabi' was incorrectly set\.  Got 'optional', expected 'required'\Z
