#source: linkonce1a.s
#source: linkonce1b.s
#ld: -r
#objdump: -r
#notarget: [is_generic]

.*:     file format .*
#...
RELOCATION RECORDS FOR \[.debug_frame\]: \(none\)

#pass
