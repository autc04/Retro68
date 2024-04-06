#    Copyright 2015 Wolfgang Thaller.
#
#    This file is part of Retro68.
#
#    Retro68 is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Retro68 is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    Under Section 7 of GPL version 3, you are granted additional
#    permissions described in the GCC Runtime Library Exception, version
#    3.1, as published by the Free Software Foundation.
#
#    You should have received a copy of the GNU General Public License and
#    a copy of the GCC Runtime Library Exception along with this program;
#    see the files COPYING and COPYING.RUNTIME respectively.  If not, see
#    <http://www.gnu.org/licenses/>.

if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    enable_language(ASM)
    set(ARCH_FILES
        Retro68Runtime.h
        start.c
        relocate.c
        PoorMansDebugging.h
        MultiSegApp.c
        LoadSeg.s
        qdglobals.c
        Retro68.r
        Retro68APPL.r
    )

    install(FILES Retro68Runtime.h DESTINATION include)
    install(FILES Retro68.r Retro68APPL.r DESTINATION RIncludes)
    
elseif(CMAKE_SYSTEM_NAME MATCHES RetroPPC)
    enable_language(ASM)
    set(ARCH_FILES
        ppcstart.c
        ppcfpsave.s
        qdglobals.c
        RetroPPCAPPL.r)
    install(FILES RetroPPCAPPL.r DESTINATION RIncludes)
elseif(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
    enable_language(ASM)
    set(ARCH_FILES
        ppcstart.c
        ppcfpsave.s
        RetroCarbonAPPL.r)
    install(FILES RetroCarbonAPPL.r DESTINATION RIncludes)
endif()

add_library(retrocrt
    malloc.c
    syscalls.c
    consolehooks.c
    ${ARCH_FILES}
)
set_target_properties(retrocrt
    PROPERTIES
        COMPILE_OPTIONS -ffunction-sections)

install(TARGETS retrocrt  DESTINATION lib)

    # different library name for Carbon
    # (Carbon shares the powerpc-apple-macos/ directory with Classic PPC)
if(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
    set_target_properties(retrocrt PROPERTIES OUTPUT_NAME retrocrt-carbon)
endif()
