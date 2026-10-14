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

find_package(Boost CONFIG COMPONENTS filesystem REQUIRED)

add_library(ResourceFiles
    ResourceFork.h ResourceFork.cc
    BinaryIO.h BinaryIO.cc
    ResType.h ResType.cc
    ResourceFile.h ResourceFile.cc
    )

# Prefer Retro68's own hfsutils (built with --enable-devlibs and installed into
# the toolchain prefix) over any incompatible libhfs in system locations (e.g.
# from cdrtools). The default search is kept as a fallback, so an hfsutils
# provided elsewhere (e.g. as a Nix buildInput) is still found.
find_path(HFS_INCLUDE_DIR NAMES hfs.h HINTS ${CMAKE_INSTALL_PREFIX}/include)
find_library(HFS_LIBRARY NAMES hfs HINTS ${CMAKE_INSTALL_PREFIX}/lib)

target_link_libraries(ResourceFiles Boost::filesystem ${HFS_LIBRARY})
target_include_directories(ResourceFiles PUBLIC .
                                         PRIVATE ${HFS_INCLUDE_DIR})

find_package(Boost CONFIG COMPONENTS program_options REQUIRED)

add_executable(ResInfo ResInfo.cc)
target_link_libraries(ResInfo ResourceFiles Boost::program_options)

install(TARGETS ResInfo RUNTIME DESTINATION bin)
