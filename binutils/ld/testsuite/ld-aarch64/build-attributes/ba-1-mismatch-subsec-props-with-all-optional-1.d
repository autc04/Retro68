# name: Build attributes: mismatch subsection properties with ba-1-all-optional-1
# source: ba-1-all-optional-1.s
# source: ba-1-mismatch-subsec-props-with-all-optional-1.s
# as:
# ld: -shared
#error: \A[^\n]*ba-1-mismatch-subsec-props-with-all-optional-1\.o: error: mismatching properties of subsection 'gnu_testing_ba_1_MERGE_AND'
#error: \n[^\n]*ba-1-all-optional-1\.o: info: conflicting properties \(optional, .*\) live here
#error: \ninfo: \(required, .*\) VS \(optional, .*\)
#error: \n[^\n]*ba-1-mismatch-subsec-props-with-all-optional-1\.o: error: mismatching properties of subsection 'gnu_testing_ba_2_MERGE_AND'
#error: \n[^\n]*ba-1-all-optional-1\.o: info: conflicting properties \(.*, ULEB128\) live here
#error: \ninfo: \(.*, NTBS\) VS \(.*, ULEB128\)\Z
