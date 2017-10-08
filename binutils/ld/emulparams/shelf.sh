# If you change this file, please also look at files which source this one:
# shlelf.sh, shelf_nbsd.sh

SCRIPT_NAME=elf
OUTPUT_FORMAT="elf32-sh"
NO_REL_RELOCS=yes
TEXT_START_ADDR=0x1000
MAXPAGESIZE=128
ARCH=sh
MACHINE=
TEMPLATE_NAME=elf32
GENERATE_SHLIB_SCRIPT=yes
EMBEDDED=yes
# PR 17739.  Delay checking relocs until after all files have
# been opened and linker garbage collection has taken place.
CHECK_RELOCS_AFTER_OPEN_INPUT=yes

# These are for compatibility with the COFF toolchain.
ENTRY=start
CTOR_START='___ctors = .;'
CTOR_END='___ctors_end = .;'
DTOR_START='___dtors = .;'
DTOR_END='___dtors_end = .;'
STACK_ADDR="(DEFINED(_stack) ? _stack : 0x3FFFFF00)"
STACK_SENTINEL="LONG(0xdeaddead)"
# We do not need .stack for shared library.
test -n "$CREATE_SHLIB" && unset STACK_ADDR
