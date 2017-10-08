#source: pr20022b.s
#ld: --gc-sections -e _start tmpdir/pr20022.so
#readelf: -SsW
#target: *-*-linux* *-*-gnu*
#notarget: *-*-*aout *-*-*oldld frv-*-linux* metag-*-linux*
#notarget: mips*-*-*
# Skip on targets without dynamic relocations in .text section.

#...
  \[[ 0-9]+\] _foo[ \t]+PROGBITS[ \t]+[0-9a-f]+ +[0-9a-f]+ +[0-9a-f]+[ \t]+.*
#...
 +[0-9]+: +[0-9a-f]+ +[0-9a-f]+ +NOTYPE +LOCAL +DEFAULT +[0-9]+ +__start__foo
#pass
