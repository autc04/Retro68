#    Copyright 2019 Wolfgang Thaller.
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
#    You should have received a copy of the GNU General Public License
#    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.


# This example does nothing useful, but it does it using a shared library.
# Doesn't run on 68K.

# Step 1: Tell CMake to compile the library.
# (CMake writes the output to an XCOFF file named libLibrary.so)
add_library(Library SHARED library.c library.h)

if(TARGET retrocrt)
    # Hack: if we are building as part of the Retro68 source tree,
    #       make sure the run-time library is already compiled
    # (not needed for standalone projects)
    add_dependencies(Library retrocrt)
endif(TARGET retrocrt)

# Step 2: Tell the linker to export symbols.

# Either export everything:
# target_link_options(Library PUBLIC -Wl,-bexpfull)

# Or tell it to use an export list from a separate file:
# (CMake 3.13 or later)
# target_link_options(Library PUBLIC -Wl,-bE:${CMAKE_CURRENT_SOURCE_DIR}/library.exp)
set_target_properties(Library PROPERTIES LINK_FLAGS -Wl,-bE:${CMAKE_CURRENT_SOURCE_DIR}/library.exp)

# Note: Step 1 & 2 are equivalent to the command:
#  powerpc-apple-macos-gcc -shared -Wl,-bE:library.exp library.c -o libLibrary.so

# Step 3: Convert the library to PEF format:

add_custom_command(
    OUTPUT Library.pef
    COMMAND ${MAKE_PEF} "libLibrary.so" -o "Library.pef"
    DEPENDS Library)

# Step 4: Combine the PEF data fork with a resource fork containing a cfrg resource:

if (REZ_INCLUDE_PATH)
    set(REZ_INCLUDE_FLAG -I${REZ_INCLUDE_PATH})
endif()

add_custom_command(
    OUTPUT Library.bin Library Library.dsk Library.ad "%Library.ad"
    COMMAND ${REZ} 
            ${REZ_FLAGS}
            ${CMAKE_CURRENT_SOURCE_DIR}/library.r
            ${REZ_INCLUDE_FLAG}
            -o "Library.bin" --cc "Library.dsk" --cc "Library"
            --cc "%Library.ad"
            -t "shlb" -c "????"
            --data Library.pef
            
    DEPENDS Library.pef ${rsrc_files})

# Step 5: Create a CMake custom target so CMake knows that Steps 3 and 4 need to be done
add_custom_target(Library_APPL ALL DEPENDS Library.bin)

# Step 6: Create the main application
# (the add_applicatin macro works similarly to the commands above, but for applications.)

add_application(Application application.c)

# Step 7: Link the application to the library target (the XCOFF version of the library!)
target_link_libraries(Application Library)
