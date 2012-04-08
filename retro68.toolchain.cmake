set( CMAKE_SYSTEM_NAME Retro68 )
set( CMAKE_SYSTEM_VERSION 1)

set( RETRO68_ROOT "" CACHE PATH "path to root of Retro68 Toolchain" )
set( CMAKE_INSTALL_PREFIX "${RETRO68_ROOT}/m68k-unknown-elf/" CACHE PATH "installation prefix" )

set( MAKE_APPL "${RETRO68_ROOT}/bin/MakeAPPL" )

set( CMAKE_C_COMPILER "${RETRO68_ROOT}/bin/m68k-unknown-elf-gcc" )
set( CMAKE_CXX_COMPILER "${RETRO68_ROOT}/bin/m68k-unknown-elf-g++" )

set( CMAKE_EXE_LINKER_FLAGS_INIT "-Wl,-elf2flt -Wl,-q -Wl,-Map=linkmap.txt" )

