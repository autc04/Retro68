#source: group9.s
#ld: -r --gc-sections --entry bar
#readelf: -g --wide
#notarget: ia64-*-* mep-*-*
#xfail: dlx-*-* openrisc-*-* or32-*-* alpha-*-* hppa64-*-* arc-*-*

COMDAT group section \[[ 0-9]+\] `.group' \[foo\] contains 2 sections:
   \[Index\]    Name
   \[[ 0-9]+\]   .text.foo
   \[[ 0-9]+\]   .data.foo

COMDAT group section \[[ 0-9]+\] `.group' \[bar\] contains 1 sections:
   \[Index\]    Name
   \[[ 0-9]+\]   .text.bar
