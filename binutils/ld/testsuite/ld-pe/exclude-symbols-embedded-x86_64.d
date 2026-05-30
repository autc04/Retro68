#source: exclude-symbols-embedded-x86_64.s
#target: x86_64-*-cygwin* x86_64-*-pe x86_64-*-mingw*
#ld: -shared
#objdump: -p

#...
.*      Ordinal   Hint Name
.*\+base\[   1\]  0000 sym1
.*\+base\[   2\]  0001 sym3
.*\+base\[   3\]  0002 sym5

#pass
