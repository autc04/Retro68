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

set(CMAKE_CXX_FLAGS "--std=c++11")

find_package(Boost COMPONENTS wave filesystem system thread regex)


find_package(BISON REQUIRED)

include_directories(. ${CMAKE_CURRENT_BINARY_DIR})

add_custom_command(
  DEPENDS RezParser.yy
  COMMAND ${BISON_EXECUTABLE}
  ARGS -o ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.cc
	   ${CMAKE_CURRENT_SOURCE_DIR}/RezParser.yy --graph
  COMMENT "Generating parser.cpp"
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.cc ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.hh
)
add_executable(Rez
		Rez.cc

		RezParser.yy RezParser.generated.hh RezParser.generated.cc

		RezLexer.h
		RezLexer.cc
		RezLexerWaveToken.h
		RezLexerNextToken.cc

		RezWorld.cc
		RezWorld.h

		ResourceDefinitions.cc
		ResourceDefinitions.h

		Expression.cc
		Expression.h

		ResourceCompiler.cc
		ResourceCompiler.h
	)
target_link_libraries(Rez ${Boost_LIBRARIES})

install(TARGETS Rez RUNTIME DESTINATION bin)
