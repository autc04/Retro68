#ld: -Tdata=0x1000 -Tdata=0x2000 -Tcross2.t
#source: align2a.s
#objdump: -h
#notarget: rx-*-* *-*-*aout *-*-netbsd x86_64-*-cygwin *-*-vms
# RX uses non standard section names.
# AOUT and NETBSD  have fixed address for the data section.
# x86_64 Cygwin biases all start addresses to be > 2Gb.
# VMS targets need extra libraries.

#...
  . \.data[ 	]+0+[0-9a-f]+[ 	]+0+02000[ 	]+0+02000.*
#pass
