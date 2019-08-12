#   Copyright 2017 Wolfgang Thaller.
#
#   This file is part of Retro68.
#
#   Retro68 is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Retro68 is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Retro68.  If not, see <http://www.gnu.org/licenses/>.

# Here's how to build a system extension, a.k.a. an INIT.
# The same applies to various other kinds of code resources.

# PowerPC is not currently supported here.
# As for Carbon, there are no code resources anyway.

# Step 1:
# Build the code resource as a regular executable
# (not using the add_application macro)
add_executable(SystemExtension
	SystemExtension.c
	ShowInitIcon.c
	SystemExtension.r
	ShowInitIcon.h)

if(TARGET retrocrt)
    # Hack: if we are building as part of the Retro68 source tree,
    #       make sure the run-time library is already compiled
    # (not needed for standalone projects)
    add_dependencies(SystemExtension retrocrt)
endif(TARGET retrocrt)



set_target_properties(SystemExtension PROPERTIES
	OUTPUT_NAME SystemExtension.flt
	
		# set a linker flag that says we want a flat piece
		# of code in a data file
	LINK_FLAGS -Wl,--mac-flat)

	# Use Rez to put it together
add_custom_command(
	OUTPUT SystemExtension.bin SystemExtension.dsk
	COMMAND ${REZ} -I ${REZ_INCLUDE_PATH}
					${CMAKE_CURRENT_SOURCE_DIR}/SystemExtension.r
					--copy ${CMAKE_CURRENT_SOURCE_DIR}/Icons.rsrc.bin
					-o SystemExtension.bin
					--cc SystemExtension.dsk
					--cc SystemExtension
					-t INIT
	DEPENDS SystemExtension SystemExtension.r Icons.rsrc.bin)


add_custom_target(SystemExtension_INIT ALL DEPENDS SystemExtension.dsk)
