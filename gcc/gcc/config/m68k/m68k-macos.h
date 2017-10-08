
#define LIBGCC_SPEC "--start-group -lretrocrt -lgcc --end-group"
#define LINK_SPEC "-elf2mac -q -undefined=_consolewrite"

#undef  LIB_SPEC
#define LIB_SPEC "--start-group -lc -lretrocrt --end-group"

#define LINK_GCC_C_SEQUENCE_SPEC "--start-group -lgcc -lc -lretrocrt --end-group"


#undef STARTFILE_SPEC
#define STARTFILE_SPEC ""
#undef ENDFILE_SPEC
#define ENDFILE_SPEC ""

