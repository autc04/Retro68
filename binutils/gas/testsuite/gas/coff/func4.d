#xfail: aarch64-*-*
#objdump: -t
#name: functions interleaved with data

.*:     file format .*

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty    0\)\(scl 103\) \(nx 1\) 0x0+0000 func4.c
File *
\[  2\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   3\) \(nx 1\) 0x0+0000 inner
AUX tagndx 0 ttlsiz 0x[124] lnnos 0 next 5
\[  4\]\(sec  2\)\(fl 0x00\)\(ty    0\)\(scl   3\) \(nx 0\) 0x0+0000 item1
\[  5\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   3\) \(nx 1\) 0x0+000. outer
AUX tagndx 0 ttlsiz 0x[248] lnnos 0 next 8
\[  7\]\(sec  2\)\(fl 0x00\)\(ty    0\)\(scl   3\) \(nx 0\) 0x0+000. item2
\[  8\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   2\) \(nx 1\) 0x0+000. test
AUX tagndx 0 ttlsiz 0x[36c] lnnos 0 next 0
#pass
