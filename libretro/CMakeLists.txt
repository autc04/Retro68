#	Copyright 2012 Wolfgang Thaller.
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
add_library(retrocrt_multi
	start.c
	malloc.c
	syscalls.c
	)
add_custom_command(
	OUTPUT retrocrt.o
	DEPENDS retrocrt_multi
	COMMAND ${CMAKE_LINKER} -r -o retrocrt.o
							--whole-archive libretrocrt_multi.a
	)
add_library(retrocrt retrocrt.o glue.c)
#add_custom_target(retrocrt_o ALL DEPENDS retrocrt.o)
install(TARGETS retrocrt  DESTINATION lib)
