# name: Object Attributes v2: combine non-matching required subsections
# target: [supports_oa_v2]
# source: oav2-2-required-subsec-A-1.s
# source: oav2-2-required-subsec-B.s
# source: oav2-2-required-subsec-A-2.s
# ld: -shared
#error: \A[^\n]*oav2-2-required-subsec-B\.o: error: mismatching value for required object attribute 'GNUTestTag_1' in subsection 'gnu_testing_ba_1_MERGE_AND': 0x1
#error: \n[^\n]*oav2-2-required-subsec-A-1\.o: info: conflicting value '0' lives here\Z
