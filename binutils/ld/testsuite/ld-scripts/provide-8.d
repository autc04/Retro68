#source: provide-5.s
#ld: -T provide-8.t
#nm: -B
#xfail: mmix-*-* spu-*-*
# Placing a symbol outside of the image isn't well-defined in PE.
#notarget: *-*-pe *-*-mingw* *-*-cygwin

#...
0+4000 D __FOO
#...
