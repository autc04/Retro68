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

cmake_minimum_required(VERSION 3.3)
project(Retro)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED TRUE)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror=return-type -Wno-multichar")

enable_testing()

if(CMAKE_SYSTEM_NAME MATCHES Retro.*)

set( REZ_TEMPLATES_PATH ${CMAKE_CURRENT_SOURCE_DIR}/libretro)
include(add_application)

string(TOLOWER ${CMAKE_SYSTEM_NAME} SYSLOWER)
configure_file(cmake/${SYSLOWER}.toolchain.cmake.in cmake/${SYSLOWER}.toolchain.cmake @ONLY)
install(DIRECTORY cmake/ DESTINATION cmake FILES_MATCHING PATTERN "*.cmake")
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmake/${SYSLOWER}.toolchain.cmake DESTINATION cmake)

add_subdirectory(libretro)

# add library path so that GCC picks up the freshly-built libretro
link_directories(${CMAKE_CURRENT_BINARY_DIR}/libretro)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/libretro)
set(REZ_INCLUDE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/libretro:${CMAKE_INSTALL_PREFIX}/RIncludes" )

add_subdirectory(Console)
add_subdirectory(Samples/HelloWorld)
add_subdirectory(TestApps)
add_subdirectory(Samples/Dialog)
add_subdirectory(Samples/Raytracer)

if(CMAKE_SYSTEM_NAME MATCHES Retro68)
add_subdirectory(Samples/Launcher)
add_subdirectory(Samples/SystemExtension)
add_subdirectory(Samples/WDEF)
endif()

if(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
else()
add_subdirectory(Samples/MPWTool)
endif()

add_subdirectory(LaunchAPPL)

add_subdirectory(AutomatedTests)
else()

set(RETRO68_ROOT ${CMAKE_INSTALL_PREFIX})
configure_file(cmake/intree.toolchain.cmake.in cmake/intree.toolchain.cmake @ONLY)
configure_file(cmake/intreeppc.toolchain.cmake.in cmake/intreeppc.toolchain.cmake @ONLY)
configure_file(cmake/intreecarbon.toolchain.cmake.in cmake/intreecarbon.toolchain.cmake @ONLY)

add_subdirectory(libelf)
add_subdirectory(ResourceFiles)
add_subdirectory(Rez)
add_subdirectory(ConvertObj)
add_subdirectory(PEFTools)
add_subdirectory(Elf2Mac)
add_subdirectory(LaunchAPPL)
endif()
