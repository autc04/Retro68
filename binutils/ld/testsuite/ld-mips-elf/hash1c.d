#source: hash1.s
#ld: -shared --hash-style=gnu
#target: [check_shared_lib_support]
#error: .gnu.hash is incompatible with the MIPS ABI
