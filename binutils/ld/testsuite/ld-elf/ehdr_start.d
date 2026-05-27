#source: ehdr_start.s
#ld: -e _start --build-id
#nm: -n
#target: *-*-linux* *-*-gnu* arm*-*-uclinuxfdpiceabi
#xfail: bfin-*-* frv-*-* lm32-*-*

#...
[0-9a-f]*000 [Adrt] __ehdr_start
#pass
