OUTPUT_FORMAT("elf32-i386-nacl");
OUTPUT_ARCH(i386);

ENTRY(_start);
SECTIONS {
        . = 0x10000;
        _start = . ;
        .data : {
                *(.data)
        }
}
