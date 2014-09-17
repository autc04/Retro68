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

set(CMAKE_CXX_FLAGS "--std=c++0x")

set(USE_BOOST_REGEX FALSE CACHE BOOL "Force use of boost for regular expressions")

if(CMAKE_COMPILER_IS_GNUCXX)
	if(${CMAKE_CXX_COMPILER_VERSION} VERSION_LESS 4.9)
		set(USE_BOOST_REGEX TRUE)
		message(STATUS "forcing use of boost::regex")
	endif()
endif()

if(USE_BOOST_REGEX)
	add_definitions(-DUSE_BOOST_REGEX)
	find_package(Boost COMPONENTS regex)
endif()

add_executable(asfilter asfilter.cc)

if(USE_BOOST_REGEX)
	target_link_libraries(asfilter ${Boost_LIBRARIES})
endif()

install(TARGETS asfilter RUNTIME DESTINATION bin)
