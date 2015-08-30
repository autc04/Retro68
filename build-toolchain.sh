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

set -e

# Set up paths.
SRC=$(cd `dirname $0` && pwd -P)
PREFIX=`pwd -P`/toolchain/
BINUTILS=`pwd -P`/binutils-build

# Remove old install tree
rm -rf toolchain
mkdir -p toolchain


# Build binutils for 68K
mkdir -p binutils-build
cd binutils-build
export "CFLAGS=-Wno-error"
$SRC/binutils/configure --target=m68k-apple-macos --prefix=$PREFIX --disable-doc
make -j8
make install
cd ..

# Build gcc for 68K
mkdir -p gcc-build
cd gcc-build
$SRC/gcc/configure --target=m68k-apple-macos --prefix=$PREFIX --enable-languages=c,c++ --with-arch=m68k --with-cpu=m68000 --disable-libssp MAKEINFO=missing
make -j8
make install
cd ..

# Install elf.h (for elf2flt)
mkdir -p $PREFIX/include
cp $SRC/elf.h $PREFIX/include/

# Build elf2flt
export "CFLAGS=-I${SRC}/binutils/include -I../toolchain/include"
mkdir -p elf2flt-build
cd elf2flt-build
$SRC/elf2flt/configure --target=m68k-apple-macos --prefix=$PREFIX --with-binutils-build-dir=$BINUTILS
make -j8 TOOLDIR=$PREFIX/bin
make install
unset CFLAGS
cd ..

# Build hfsutil
mkdir -p $PREFIX/man/man1
rm -rf hfsutils
cp -r $SRC/hfsutils .
cd hfsutils
./configure --prefix=$PREFIX --enable-devlibs
make 
make install
cd ..

# Install Universal Interfaces
sh "$SRC/prepare-headers.sh" "$SRC/CIncludes" toolchain/m68k-apple-macos/include

mkdir -p toolchain/m68k-apple-macos/RIncludes
sh "$SRC/prepare-rincludes.sh" "$SRC/RIncludes" toolchain/m68k-apple-macos/RIncludes

# Build host-based components
mkdir -p build-host
cd build-host
cmake ${SRC} -DCMAKE_INSTALL_PREFIX=$PREFIX
cd ..
make -C build-host install

	# create an empty libretrocrt.a so that cmake's compiler test doesn't fail
$PREFIX/bin/m68k-apple-macos-ar cqs $PREFIX/m68k-apple-macos/lib/libretrocrt.a
	# the real libretrocrt.a is built and installed by `make -C build-target install` later

# Build target-based components
mkdir -p build-target
cd build-target
cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intree.toolchain.cmake \
			 -DIN_RETRO68_TREE=True	\
			 -DCMAKE_BUILD_TYPE=Release
cd ..
make -C build-target install
