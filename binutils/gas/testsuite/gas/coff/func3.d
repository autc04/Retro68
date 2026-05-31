#xfail: aarch64-*-*
#objdump: -t
#name: functions mixed C_EFCN

.*:     file format .*

SYMBOL TABLE:
\[  0\]\(sec -2\)\(fl 0x00\)\(ty    0\)\(scl 103\) \(nx 1\) 0x0+0000 func3.c
File *
\[  2\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   3\) \(nx 1\) 0x0+0000 inner
AUX tagndx 0 ttlsiz 0x0 lnnos 0 next 4
\[  4\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   3\) \(nx 1\) 0x0+000. outer
AUX tagndx 0 ttlsiz 0x[248] lnnos 0 next 6
\[  6\]\(sec  1\)\(fl 0x00\)\(ty   20\)\(scl   2\) \(nx 1\) 0x0+000. test
AUX tagndx 0 ttlsiz 0x[36c] lnnos 0 next 0
#pass
