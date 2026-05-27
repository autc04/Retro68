#source: tls-le-pic-2.s
#as: --x32
#ld: -shared -melf32_x86_64
#error: .*: relocation R_X86_64_TPOFF32 against undefined symbol `foo' can not be used when making a shared object; local-exec is incompatible with -shared
