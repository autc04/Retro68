#   Copyright 2012 Wolfgang Thaller.
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

cmake_minimum_required(VERSION 2.8)
project(Retro)

include(CMakeParseArguments)

function(add_application name)
	set(options DEBUGBREAK CONSOLE)
	set(oneValueArgs TYPE CREATOR)
	set(multiValueArgs FILES MAKEAPPL_ARGS)
	cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

	list(APPEND ARGS_FILES ${ARGS_UNPARSED_ARGUMENTS})

	set(files)
		foreach(f ${ARGS_FILES})
		list(APPEND files "${CMAKE_CURRENT_SOURCE_DIR}/${f}")
	endforeach()

	add_executable(${name} ${files})

	if(${ARGS_DEBUGBREAK})
		list(APPEND ARGS_MAKEAPPL_ARGS -b)
	endif()
	if(${ARGS_CONSOLE})
		target_link_libraries(${name} RetroConsole)
	endif()


	if(TARGET libretro)
		set_target_properties(${name} PROPERTIES LINK_DEPENDS libretro)
	endif(TARGET libretro)

	set_target_properties(${name} PROPERTIES OUTPUT_NAME ${name}.flt)

	add_custom_command(
		OUTPUT ${name}.bin ${name} ${name}.dsk
		COMMAND ${MAKE_APPL} ${ARGS_MAKEAPPL_ARGS} -c "${name}.flt" -o "${name}"
		DEPENDS ${name})
	add_custom_target(${name}_APPL ALL DEPENDS ${name}.bin)
endfunction()

if(CMAKE_SYSTEM_NAME MATCHES Retro68)
add_subdirectory(libretro)

# add library path so that GCC picks up the freshly-built libretro
link_directories(${CMAKE_CURRENT_BINARY_DIR}/libretro)

add_subdirectory(Console)
add_subdirectory(TestApps)
add_subdirectory(Raytracer)
add_subdirectory(Launcher)
else()
add_subdirectory(MakeAPPL)
add_subdirectory(ASFilter)
endif()
