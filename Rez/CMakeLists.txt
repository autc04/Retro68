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

# Look for bison.
	# We need Version 3, and Mac OS X still comes with an outdated version (2.3).
	# So we just add the path where the homebrew package manager installs its
	# "keg-only" version. Shouldn't hurt on Linux.
set(CMAKE_PROGRAM_PATH $CMAKE_PROGRAM_PATH "/usr/local/opt/bison/bin")
find_package(BISON 3.0.2)

if(Boost_FOUND AND BISON_FOUND)


include_directories(. ${CMAKE_CURRENT_BINARY_DIR})

set(BISON_OUTPUTS ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.cc ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.hh
	${CMAKE_CURRENT_BINARY_DIR}/location.hh ${CMAKE_CURRENT_BINARY_DIR}/position.hh
	${CMAKE_CURRENT_BINARY_DIR}/stack.hh)

add_custom_command(OUTPUT ${BISON_OUTPUTS}
        COMMAND ${BISON_EXECUTABLE}
        ARGS -o ${CMAKE_CURRENT_BINARY_DIR}/RezParser.generated.cc RezParser.yy
        DEPENDS RezParser.yy
        COMMENT "[BISON][RezParser] Building parser with bison ${BISON_VERSION}"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})


add_library(RezLib
		RezParser.yy
		${BISON_OUTPUTS}

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
target_include_directories(RezLib PRIVATE ${Boost_INCLUDE_DIR})

add_executable(Rez
		Rez.cc
	)
target_link_libraries(Rez RezLib ResourceFiles ${Boost_LIBRARIES})
target_include_directories(Rez PRIVATE ${Boost_INCLUDE_DIR})

install(TARGETS Rez RUNTIME DESTINATION bin)

add_subdirectory(Test)

else(Boost_FOUND AND BISON_FOUND)
	message(WARNING "Rez compiler will not be built; both boost and Bison 3.0.2 are required")
endif(Boost_FOUND AND BISON_FOUND)
