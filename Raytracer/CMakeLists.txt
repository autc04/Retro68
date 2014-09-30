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

if(APPLE)
	add_executable(Raytracer MACOSX_BUNDLE
		raytracer.c
		)
	add_executable(Raytracer2 MACOSX_BUNDLE
		raytracer2.cc
		fixed.h
		fixed.cc
		)

	target_link_libraries(Raytracer "-framework Carbon")
	target_link_libraries(Raytracer2 "-framework Carbon")
else()
	set(CMAKE_CXX_FLAGS "-std=c++11")

	add_application(Raytracer
		raytracer.c
		)
	target_link_libraries(Raytracer "-lm")

	add_application(Raytracer2
		raytracer2.cc
		fixed.h
		fixed.cc
		)

	add_application(FixedBenchmark CONSOLE
					FILES fixedbenchmark.cc fixed.h fixed.cc)
endif()

