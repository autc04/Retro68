# This is an ELF platform.
SCRIPT_NAME=elf
ARCH=riscv
NO_REL_RELOCS=yes

TEMPLATE_NAME=elf32
EXTRA_EM_FILE=riscvelf

ELFSIZE=32

if test `echo "$host" | sed -e s/64//` = `echo "$target" | sed -e s/64//`; then
  case " $EMULATION_LIBPATH " in
    *" ${EMULATION_NAME} "*)
      NATIVE=yes
      ;;
  esac
fi

GENERATE_SHLIB_SCRIPT=yes
GENERATE_PIE_SCRIPT=yes

TEXT_START_ADDR=0x10000
MAXPAGESIZE="CONSTANT (MAXPAGESIZE)"
COMMONPAGESIZE="CONSTANT (COMMONPAGESIZE)"

SDATA_START_SYMBOLS="__global_pointer$ = . + 0x800;
    *(.srodata.cst16) *(.srodata.cst8) *(.srodata.cst4) *(.srodata.cst2) *(.srodata .srodata.*)"

INITIAL_READONLY_SECTIONS=".interp         : { *(.interp) } ${CREATE_PIE-${INITIAL_READONLY_SECTIONS}}"
INITIAL_READONLY_SECTIONS="${RELOCATING+${CREATE_SHLIB-${INITIAL_READONLY_SECTIONS}}}"
