. ${srcdir}/emulparams/elf32ppccommon.sh
. ${srcdir}/emulparams/plt_unwind.sh
EXTRA_EM_FILE=ppc64elf
ELFSIZE=64
OUTPUT_FORMAT="elf64-powerpc"
TEXT_START_ADDR=0x10000000
#SEGMENT_SIZE=0x10000000
ARCH=powerpc:common64
NOP=0x60000000
unset EXECUTABLE_SYMBOLS
unset SDATA_START_SYMBOLS
unset SDATA2_START_SYMBOLS
unset SBSS_START_SYMBOLS
unset SBSS_END_SYMBOLS
unset OTHER_END_SYMBOLS
unset OTHER_RELRO_SECTIONS
OTHER_TEXT_SECTIONS="*(.sfpr .glink)"
BSS_PLT=
OTHER_BSS_SYMBOLS="
  .tocbss	${RELOCATING-0} :${RELOCATING+ ALIGN(8)} { *(.tocbss)}"
OTHER_PLT_RELOC_SECTIONS="
  .rela.tocbss	${RELOCATING-0} : { *(.rela.tocbss) }"

if test x${RELOCATING+set} = xset; then
  GOT="
  .got		: ALIGN(8) { *(.got .toc) }"
else
  GOT="
  .got		0 : { *(.got) }
  .toc		0 : { *(.toc) }"
fi
# Put .opd relocs first so ld.so will process them before any ifunc relocs.
INITIAL_RELOC_SECTIONS="
  .rela.opd	${RELOCATING-0} : { *(.rela.opd) }"
OTHER_GOT_RELOC_SECTIONS="
  .rela.toc	${RELOCATING-0} : { *(.rela.toc) }
  .rela.branch_lt	${RELOCATING-0} : { *(.rela.branch_lt) }"
OTHER_READWRITE_SECTIONS="
  .toc1		${RELOCATING-0} :${RELOCATING+ ALIGN(8)} { *(.toc1) }
  .opd		${RELOCATING-0} :${RELOCATING+ ALIGN(8)} { KEEP (*(.opd)) }
  .branch_lt	${RELOCATING-0} :${RELOCATING+ ALIGN(8)} { *(.branch_lt) }"
