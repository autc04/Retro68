#ld: -shared -m elf_i386 -e bar --gc-sections
#as: --32
#readelf: -r --wide
#target: x86_64-*-* i?86-*-*
#notarget: x86_64-*-nacl* i?86-*-nacl*

There are no relocations in this file.
