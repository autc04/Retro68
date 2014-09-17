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

add_library(RetroConsole
	Console.cc
	Console.h
	MacUtils.h
    InitConsole.cc
	)

add_executable(Test
	test.cc
	Console.cc
	Console.h
	MacUtils.h
   )
add_executable(HelloWorld
	hello.c
   )
#target_link_libraries(Test :retrocrt.o)

target_link_libraries(Test retrocrt)
add_custom_command(
   OUTPUT Test.bin
   COMMAND ${MAKE_APPL} -c Test
   DEPENDS Test)
add_custom_target(TestAPPL ALL DEPENDS Test.bin)

target_link_libraries(HelloWorld RetroConsole retrocrt)
add_custom_command(
   OUTPUT HelloWorld.bin
   COMMAND ${MAKE_APPL} -c HelloWorld -o HelloWorld
   DEPENDS HelloWorld)
add_custom_target(HelloWorldAPPL ALL DEPENDS HelloWorld.bin)


set(UPLOAD_URL "" CACHE STRING "ftp url to upload to")
if(UPLOAD_URL)
add_custom_target(upload
		DEPENDS Test.bin
		COMMAND wput -u Test.bin ${UPLOAD_URL}
	)
endif()
