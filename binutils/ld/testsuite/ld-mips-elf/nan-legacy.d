#source: nan-legacy.s
#source: nan-legacy.s
#ld: -r
#objdump: -p

.*:.*file format.*mips.*
#failif
private flags = [0-9a-f]*[4-7c-f]..: .*[[]nan2008[]].*
