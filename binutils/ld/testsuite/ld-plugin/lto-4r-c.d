#ld: -r tmpdir/lto-4r-b.o tmpdir/lto-4c.o --no-warn-execstack --no-error-execstack
#source: dummy.s
#objdump: -h

#...
.* .gnu_object_only.*
#pass
