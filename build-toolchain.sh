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

for ARG in $*; do
	case $ARG in
		--cmakeonly)
				CMAKEONLY=true
			;;
		*)
			echo "unknown option $ARG"
			exit 1
			;;
	esac
done

if [ $CMAKEONLY != true ]; then

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

unset CFLAGS
# Build binutils for PPC
mkdir -p binutils-build-ppc
cd binutils-build-ppc
$SRC/binutils/configure --target=powerpc-apple-macos --prefix=$PREFIX --disable-doc
make -j8
make install
cd ..

# Build gcc for PPC
mkdir -p gcc-build-ppc
cd gcc-build-ppc
$SRC/gcc/configure --target=powerpc-apple-macos --prefix=$PREFIX --enable-languages=c,c++ --disable-libssp --disable-lto MAKEINFO=missing
make -j8
make install
cd ..

# Install elf.h (for elf2flt)
mkdir -p $PREFIX/include
cp $SRC/elf.h $PREFIX/include/

# Build elf2flt
export "CFLAGS=-I${SRC}/binutils/include -I../toolchain/include"
export "CPPFLAGS=$CFLAGS"
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
for arch in m68k powerpc; do
	sh "$SRC/prepare-headers.sh" "$SRC/CIncludes" toolchain/${arch}-apple-macos/include
	mkdir -p toolchain/${arch}-apple-macos/RIncludes
	sh "$SRC/prepare-rincludes.sh" "$SRC/RIncludes" toolchain/${arch}-apple-macos/RIncludes
done

cp $SRC/ImportLibraries/*.a toolchain/powerpc-apple-macos/lib/

fi # CMAKEONLY

# Build host-based components
mkdir -p build-host
cd build-host
cmake ${SRC} -DCMAKE_INSTALL_PREFIX=$PREFIX
cd ..
make -C build-host install

	# create an empty libretrocrt.a so that cmake's compiler test doesn't fail
for arch in m68k powerpc; do
	$PREFIX/bin/${arch}-apple-macos-ar cqs $PREFIX/${arch}-apple-macos/lib/libretrocrt.a
done
	# the real libretrocrt.a is built and installed by `make -C build-target install` later

# Build target-based components for 68K
mkdir -p build-target
cd build-target
cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intree.toolchain.cmake \
			 -DCMAKE_BUILD_TYPE=Release
cd ..
make -C build-target install

# Build target-based components for PPC
mkdir -p build-target-ppc
cd build-target-ppc
cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreeppc.toolchain.cmake \
			 -DCMAKE_BUILD_TYPE=Release
cd ..
make -C build-target-ppc install

# Build target-based components for Carbon
mkdir -p build-target-carbon
cd build-target-carbon
cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreecarbon.toolchain.cmake \
			 -DCMAKE_BUILD_TYPE=Release
cd ..
make -C build-target-carbon install
