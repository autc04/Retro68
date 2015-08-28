#name: -shared --entry foo -u foo archive
#source: dummy.s
#ld: -shared --entry foo -u foo tmpdir/libentry.a
#nm: -n
#target: *-*-linux*

#...
[0-9a-f]+ T +foo
#...
