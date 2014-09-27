#   Copyright 2014 Wolfgang Thaller.
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
set(CMAKE_CXX_FLAGS "-std=c++11") # -fomit-frame-pointer")

add_executable(ExceptionTest
	ExceptionTest.cc
   )

target_link_libraries(ExceptionTest RetroConsole retrocrt)
add_custom_command(
   OUTPUT ExceptionTest.bin
   COMMAND ${MAKE_APPL} -c ExceptionTest -o ExceptionTest
   DEPENDS ExceptionTest)
add_custom_target(ExceptionTestAPPL ALL DEPENDS ExceptionTest.bin)


enable_language(ASM)
add_executable(AsmTest
	AsmTest.s
   )
set_target_properties(AsmTest PROPERTIES LINKER_LANGUAGE C)

target_link_libraries(AsmTest retrocrt)
add_custom_command(
   OUTPUT AsmTest.bin
   COMMAND ${MAKE_APPL} -c AsmTest -o AsmTest
   DEPENDS AsmTest)
add_custom_target(AsmTestAPPL ALL DEPENDS AsmTest.bin)



set(UPLOAD_URL "" CACHE STRING "ftp url to upload to")
if(UPLOAD_URL)
add_custom_target(upload
		DEPENDS Test.bin
		COMMAND wput -u Test.bin ${UPLOAD_URL}
	)
endif()
