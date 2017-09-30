
#define LIBGCC_SPEC "-lretrocrt -lgcc"
#define LINK_SPEC "-elf2mac -q -undefined=_consolewrite"


#undef STARTFILE_SPEC
#define STARTFILE_SPEC ""
#undef ENDFILE_SPEC
#define ENDFILE_SPEC ""

