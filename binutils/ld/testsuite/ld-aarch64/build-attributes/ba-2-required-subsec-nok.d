# name: Build attributes: combine non-matching required subsections
# source: ba-2-required-subsec-A-1.s
# source: ba-2-required-subsec-B.s
# source: ba-2-required-subsec-A-2.s
# as:
# ld: -shared
#error: \A[^\n]*ba-2-required-subsec-B\.o: error: mismatching value for required object attribute 'GNUTestTag_1' in subsection 'gnu_testing_ba_1_MERGE_AND': 0x1
#error: \n[^\n]*ba-2-required-subsec-A-1\.o: info: conflicting value '0' lives here\Z
