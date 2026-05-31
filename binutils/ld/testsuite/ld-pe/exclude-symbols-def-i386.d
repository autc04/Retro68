#source: exclude-symbols-def-i386.s
#target: i?86-*-cygwin* i?86-*-pe i?86-*-mingw*
#ld: -shared ${srcdir}/${subdir}/exclude-symbols-def.def
#objdump: -p

#...
.*      Ordinal   Hint Name
.*\+base\[   1\]  0000 sym1
.*\+base\[   2\]  0001 sym3
.*\+base\[   3\]  0002 sym5

#pass
