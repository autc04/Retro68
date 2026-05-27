#as:
#source: test.s
#ld: -T no-sframe.ld
#objdump: -hw
#name: No SFrame section in output with no --gsframe

#failif
#...
  [0-9] .sframe .*
#...
