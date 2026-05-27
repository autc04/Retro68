#source: pr32191.s
#as: --x32 -mx86-used-note=yes
#ld: -shared -m elf32_x86_64 -z separate-code --build-id --rosegment
#readelf: -lW

#...
 +[0-9]+ +\.note\.gnu\.build-id \.text 
 +[0-9]+ +\..* \.note\.gnu\.property .*
#pass
