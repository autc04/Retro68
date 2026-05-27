#source: ../ld-x86-64/pr32191.s
#as: --32 -mx86-used-note=yes
#ld: -shared -m elf_i386 -z separate-code --build-id --rosegment
#readelf: -lW

#...
 +[0-9]+ +\.note\.gnu\.build-id \.text 
 +[0-9]+ +\..* \.note\.gnu\.property .*
#pass
