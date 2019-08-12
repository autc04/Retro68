#	Copyright 2015 Wolfgang Thaller.
#
#	This file is part of Retro68.
#
#	Retro68 is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	Retro68 is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with Retro68.  If not, see <http://www.gnu.org/licenses/>.

# To use this example as a standalone project using CMake:
# mkdir build
# cd build
# cmake .. -DCMAKE_TOOLCHAIN_FILE=path/to/Retro68-build/toolchain/cmake/retro68.toolchain.cmake
# make

# This sample program contains a custom window definition procedure (WDEF) defined in wdef.c.
# It is used in two different ways:
# 1. The 80s way: compiled as a separate 'WDEF' code resource.
# 2. The 90s way: compiled as part of the application.

# First, let's build a separate code resource:
add_executable(WDEF wdef.c)


if(TARGET retrocrt)
    # Hack: if we are building as part of the Retro68 source tree,
    #       make sure the run-time library is already compiled
    # (not needed for standalone projects)
    add_dependencies(WDEF retrocrt)
endif(TARGET retrocrt)


if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    set_target_properties(WDEF PROPERTIES
            # tell wdef.c that it is being compiled as a code resource
        COMPILE_DEFINITIONS "COMPILING_AS_CODE_RESOURCE"
        
        COMPILE_OPTIONS -ffunction-sections # make things smaller

            # set a linker flag that says we want a flat piece
            # of code in a data file, specify entry point,
            # and add -Wl,-gc-sections to make things smaller.
        LINK_FLAGS "-Wl,--mac-flat -Wl,-eMYWINDOWDEFPROC -Wl,-gc-sections")
    set(WDEF_R wdef.r)
    set(WDEF_RESOURCE WDEF)
elseif(CMAKE_SYSTEM_NAME MATCHES RetroPPC)
    set_target_properties(WDEF PROPERTIES
        COMPILE_OPTIONS -ffunction-sections # make things smaller
        # tell wdef.c that it is being compiled as a code resource
        COMPILE_DEFINITIONS "COMPILING_AS_CODE_RESOURCE"
        LINK_FLAGS " -Wl,-eMyWindowDefProc -Wl,-gc-sections"
        )
    set(WDEF_R wdefppc.r)

    add_custom_command(
        OUTPUT WDEF.pef
        COMMAND ${MAKE_PEF} WDEF -o "WDEF.pef"
        DEPENDS WDEF)
    set(WDEF_RESOURCE WDEF.pef)
endif()

    # wrap the compiled WDEF into a resource
add_custom_command(
    OUTPUT WDEF.rsrc.bin
    COMMAND ${REZ} -I ${REZ_INCLUDE_PATH}
                    ${CMAKE_CURRENT_SOURCE_DIR}/${WDEF_R}
                    -o WDEF.rsrc.bin
                    
    DEPENDS ${WDEF_RESOURCE} ${WDEF_R})
    
# Now build the application
add_application(WDEFShell
	wdefshell.c
    wdefshell.r

    wdef.c  # the WDEF as a plain source file in the application

        # the separately compiled WDEF resource
    ${CMAKE_CURRENT_BINARY_DIR}/WDEF.rsrc.bin   
	)

# Again, add some options to make things smaller.
set_target_properties(WDEFShell PROPERTIES COMPILE_OPTIONS -ffunction-sections)
set_target_properties(WDEFShell PROPERTIES LINK_FLAGS "-Wl,-gc-sections")
