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

set(CMAKE_CXX_FLAGS "--std=c++11 -Wall")

find_package(Boost COMPONENTS wave filesystem system thread regex program_options)

if(Boost_FOUND)

find_package(BISON REQUIRED)

include_directories(. ${CMAKE_CURRENT_BINARY_DIR})

bison_target(RezParser RezParser.yy
	${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.cc ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.hh
	${CMAKE_CURRENT_BINARY_DIR}/location.hh ${CMAKE_CURRENT_BINARY_DIR}/position.hh
	${CMAKE_CURRENT_BINARY_DIR}/stack.hh)

add_library(RezLib
		RezParser.yy
		${BISON_RezParser_OUTPUTS}

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

		ResSpec.h

		Diagnostic.h Diagnostic.cc
	)
target_link_libraries(RezLib ResourceFiles ${Boost_LIBRARIES})

add_executable(Rez
		Rez.cc
	)
target_link_libraries(Rez RezLib ResourceFiles ${Boost_LIBRARIES})

install(TARGETS Rez RUNTIME DESTINATION bin)

add_subdirectory(Test)

endif(Boost_FOUND)
