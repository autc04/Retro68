#as:
#source: sframe-foo.s
#ld: --no-ld-generated-unwind-info -T no-sframe.ld -e foo
#objdump: -hw
#name: No interaction between --no-ld-generated-unwind-info and SFrame

#failif
#...
  [0-9] .sframe .*
#...
