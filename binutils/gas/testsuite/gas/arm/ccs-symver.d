#name: .symver in CCS mode
#as: -mccs
#readelf: -sW
# This test is only valid on ELF based ports.
#notarget: *-*-pe *-*-wince

#...
 +[0-9]+: +0+ +1 +OBJECT +GLOBAL +DEFAULT +[0-9]+ +foo
 +[0-9]+: +0+ +1 +OBJECT +GLOBAL +DEFAULT +[0-9]+ +foo@version1
#pass
