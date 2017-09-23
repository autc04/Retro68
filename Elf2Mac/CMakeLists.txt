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

cmake_minimum_required(VERSION 3.1)

find_package(Boost COMPONENTS REQUIRED)

add_executable(Elf2Mac Elf2Mac.h Elf2Mac.cc LdScript.cc)
target_link_libraries(Elf2Mac ResourceFiles ${CMAKE_INSTALL_PREFIX}/lib/libelf.a -lz)

target_include_directories(Elf2Mac PRIVATE ${CMAKE_INSTALL_PREFIX}/include)
target_include_directories(Elf2Mac PRIVATE ${Boost_INCLUDE_DIR})

install(TARGETS Elf2Mac RUNTIME DESTINATION bin)
