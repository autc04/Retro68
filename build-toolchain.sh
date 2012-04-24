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

SRC=$(cd `dirname $0` && pwd -P)
mkdir -p binutils-build
mkdir -p toolchain
PREFIX=`pwd`/toolchain/
set -e

cd binutils-build
export "CFLAGS=-Wno-error"
$SRC/binutils/configure --target=m68k-unknown-elf --prefix=$PREFIX
make -j8
make install

cd ..

mkdir -p gcc-build
cd gcc-build
$SRC/gcc/configure --target=m68k-unknown-elf --prefix=$PREFIX --enable-languages=c,c++ --with-arch=m68k --with-cpu=m68000 --disable-libssp
make -j8
make install

cd ..

BINUTILS=$(cd binutils-build && pwd -P)

cp $SRC/elf.h $PREFIX/include/
export "CFLAGS=-I../../Retro68/binutils/include -I../toolchain/include"
mkdir -p elf2flt-build
cd elf2flt-build
$SRC/elf2flt/configure --target=m68k-unknown-elf --prefix=$PREFIX --with-binutils-build-dir=$BINUTILS
make -j8 TOOLDIR=$PREFIX/bin
make install
unset CFLAGS

cd ..

mkdir -p $PREFIX/man/man1
rm -rf hfsutils
cp -r $SRC/hfsutils .
cd hfsutils
./configure --prefix=$PREFIX
make 
make install
cd ..

runhaskell ../Retro68/PrepareHeaders.hs ../Retro68/Universal\ Headers toolchain/m68k-unknown-elf/include

mkdir -p build-host
cd build-host
cmake ../../Retro68/ -DCMAKE_INSTALL_PREFIX=$PREFIX
cd ..

mkdir -p build-target
cd build-target
cmake ../../Retro68/ -DCMAKE_INSTALL_PREFIX=$PREFIX/m68k-unknown-elf \
					-DCMAKE_TOOLCHAIN_FILE=$SRC/retro68.toolchain.cmake \
					-DRETRO68_ROOT=$PREFIX \
					-DCMAKE_BUILD_TYPE=Release
cd ..

make -C build-host install

mv $PREFIX/bin/m68k-unknown-elf-as $PREFIX/bin/m68k-unknown-elf-as.real
ln -s $PREFIX/bin/asfilter $PREFIX/bin/m68k-unknown-elf-as
mv $PREFIX/m68k-unknown-elf/bin/as $PREFIX/m68k-unknown-elf/bin/as.real
ln -s $PREFIX/bin/asfilter $PREFIX/m68k-unknown-elf/bin/as

make -C build-target install
