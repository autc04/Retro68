#source: pr32191.s
#as: --64 -mx86-used-note=yes
#ld: -shared -m elf_x86_64 -z separate-code --build-id --rosegment
#readelf: -lW

#...
 +[0-9]+ +\.note\.gnu\.build-id \.text 
 +[0-9]+ +\..* \.note\.gnu\.property .*
#pass
