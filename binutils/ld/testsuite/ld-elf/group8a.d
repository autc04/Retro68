#source: group8.s
#ld: -r --gc-sections --entry foo
#readelf: -g --wide
#notarget: ia64-*-* mep-*-*
#xfail: dlx-*-* openrisc-*-* or32-*-* alpha-*-* arc-*-* hppa64-*-*

COMDAT group section \[[ 0-9]+\] `.group' \[foo\] contains 1 sections:
   \[Index\]    Name
   \[[ 0-9]+\]   .text.foo
