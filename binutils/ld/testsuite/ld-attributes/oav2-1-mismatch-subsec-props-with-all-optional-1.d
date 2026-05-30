# name: Object Attributes v2: mismatch subsection properties with oav2-1-all-optional-1
# target: [supports_oa_v2]
# source: oav2-1-all-optional-1.s
# source: oav2-1-mismatch-subsec-props-with-all-optional-1.s
# ld: -shared
#error: \A[^\n]*oav2-1-mismatch-subsec-props-with-all-optional-1\.o: error: mismatching properties of subsection 'gnu_testing_ba_1_MERGE_AND'
#error: \n[^\n]*oav2-1-all-optional-1\.o: info: conflicting properties \(optional, .*\) live here
#error: \ninfo: \(required, .*\) VS \(optional, .*\)
#error: \n[^\n]*oav2-1-mismatch-subsec-props-with-all-optional-1\.o: error: mismatching properties of subsection 'gnu_testing_ba_2_MERGE_AND'
#error: \n[^\n]*oav2-1-all-optional-1\.o: info: conflicting properties \(.*, ULEB128\) live here
#error: \ninfo: \(.*, NTBS\) VS \(.*, ULEB128\)\Z
