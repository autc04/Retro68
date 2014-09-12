# Linker script for i386 go32 (DJGPP)

test -z "$ENTRY" && ENTRY=start
EXE=${CONSTRUCTING+${RELOCATING+-exe}}

# These are substituted in as variables in order to get '}' in a shell
# conditional expansion.
CTOR='.ctor : {
    *(SORT(.ctors.*))
    *(.ctor)
  }'
DTOR='.dtor : {
    *(SORT(.dtors.*))
    *(.dtor)
  }'

cat <<EOF
OUTPUT_FORMAT("${OUTPUT_FORMAT}${EXE}")

${RELOCATING+ENTRY (${ENTRY})}

SECTIONS
{
  .text ${RELOCATING+ ${TARGET_PAGE_SIZE}+SIZEOF_HEADERS} : {
    *(.text)
    ${RELOCATING+*(.text.*)}
    ${RELOCATING+*(.gnu.linkonce.t*)}
    *(.const*)
    *(.ro*)
    ${RELOCATING+*(.gnu.linkonce.r*)}
    ${RELOCATING+etext  =  . ; PROVIDE(_etext = .) ;}
    ${RELOCATING+. = ALIGN(${SEGMENT_SIZE});}
  }
  .data ${RELOCATING+ ${DATA_ALIGNMENT}} : {
    ${RELOCATING+djgpp_first_ctor = . ;
    *(SORT(.ctors.*))
    *(.ctor)
    djgpp_last_ctor = . ;}
    ${RELOCATING+djgpp_first_dtor = . ;
    *(SORT(.dtors.*))
    *(.dtor)
    djgpp_last_dtor = . ;}
    *(.data)
    ${RELOCATING+*(.data.*)}

    ${RELOCATING+*(.gcc_exc*)}
    ${RELOCATING+___EH_FRAME_BEGIN__ = . ;}
    ${RELOCATING+*(.eh_fram*)}
    ${RELOCATING+___EH_FRAME_END__ = . ;}
    ${RELOCATING+LONG(0);}

    ${RELOCATING+*(.gnu.linkonce.d*)}
    ${RELOCATING+edata  =  . ; PROVIDE(_edata = .) ;}
    ${RELOCATING+. = ALIGN(${SEGMENT_SIZE});}
  }
  ${CONSTRUCTING+${RELOCATING-$CTOR}}
  ${CONSTRUCTING+${RELOCATING-$DTOR}}
  .bss ${RELOCATING+ SIZEOF(.data) + ADDR(.data)} :
  { 					
    *(.bss${RELOCATING+ .bss.* .gnu.linkonce.b.*})
    *(COMMON)
    ${RELOCATING+ end = . ; PROVIDE(_end = .) ;}
    ${RELOCATING+ . = ALIGN(${SEGMENT_SIZE});}
  }
  /* Stabs debugging sections.  */
  .stab 0 : { *(.stab) }
  .stabstr 0 : { *(.stabstr) }
EOF

. $srcdir/scripttempl/DWARF.sc

cat <<EOF
}
EOF
