#ld: --oformat binary -T pr21529.ld -e main
#objdump: -s -b binary
#xfail: aarch64*-*-* arm*-*-* hppa-*-* ia64-*-* nds32*-*-* score-*-*

#pass
