#ld: -r --whole-archive tmpdir/liblto-4.a
#source: dummy.s
#objdump: -h

#...
.* .gnu_object_only.*
#pass
