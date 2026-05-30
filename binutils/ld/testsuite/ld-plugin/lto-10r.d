#ld: -r tmpdir/lto-10a.o tmpdir/lto-10b.o
#source: dummy.s
#objdump: -h

#...
 *[0-9]+ +\.gnu\.lto_\.[0-9a-zA-Z_\.]+ +[0-9a-f]+ +[0-9a-f]+  +[0-9a-f]+ +[0-9a-f]+ .*
#...
 *[0-9]+ +\.gnu_object_only +[0-9a-f]+ +0+ +0+ +0+[1-9a-f][0-9a-f]+ +.*
#pass
