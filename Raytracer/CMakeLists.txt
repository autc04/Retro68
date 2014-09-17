#	Copyright 2014 Wolfgang Thaller.
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

cmake_minimum_required(VERSION 2.8)

if(NOT APPLE)
set(CMAKE_CXX_FLAGS "-std=c++11 -fno-threadsafe-statics -g -fomit-frame-pointer") # -mcpu=68040")
endif()

include_directories(../App2)
add_executable(Raytracer MACOSX_BUNDLE
	raytracer.c
	)
add_executable(Raytracer2 MACOSX_BUNDLE
	raytracer2.cc
	fixed.h
	fixed.cc
	)

if(APPLE)
target_link_libraries(Raytracer "-framework Carbon")
target_link_libraries(Raytracer2 "-framework Carbon")
else()
add_executable(FixedBenchmark fixedbenchmark.cc fixed.h fixed.cc)
target_link_libraries(FixedBenchmark RetroConsole retrocrt)
add_custom_command(
	OUTPUT FixedBenchmark.bin
	COMMAND ${MAKE_APPL} -c FixedBenchmark -o FixedBenchmark
	DEPENDS FixedBenchmark)
add_custom_target(FixedBenchmarkAPPL ALL DEPENDS FixedBenchmark.bin)

target_link_libraries(Raytracer retrocrt)
add_custom_command(
	OUTPUT Raytracer.bin
	COMMAND ${MAKE_APPL} -c Raytracer -o Raytracer
	DEPENDS Raytracer)
target_link_libraries(Raytracer "-lm")
add_custom_target(RaytracerAPPL ALL DEPENDS Raytracer.bin)

target_link_libraries(Raytracer2 retrocrt)
add_custom_command(
	OUTPUT Raytracer2.bin
	COMMAND ${MAKE_APPL} -c Raytracer2 -o Raytracer2
	DEPENDS Raytracer2)
add_custom_target(Raytracer2APPL ALL DEPENDS Raytracer2.bin)
endif()

