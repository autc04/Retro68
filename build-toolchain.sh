SRC=$(readlink -f `dirname $0`)
mkdir -p binutils-build
mkdir -p toolchain
PREFIX=`pwd`/toolchain/
set -e

cd binutils-build
export "CFLAGS=-Wno-unused-but-set-variable -Wno-unused-but-set-parameter"
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

#mkdir -p newlib-build
#cd newlib-build
BINUTILS=$(readlink -f binutils-build)

export "CFLAGS=-I../../Retro68/binutils/include"
mkdir -p elf2flt-build
cd elf2flt-build
$SRC/elf2flt/configure --target=m68k-unknown-elf --prefix=$PREFIX --with-binutils-build-dir=$BINUTILS
make -j8
make install
unset CFLAGS

cd ..

rm -rf hfsutils
cp -r $SRC/hfsutils .
cd hfsutils
./configure --prefix=$PREFIX
make 
make install
cd ..

runhaskell ../Retro68/PrepareHeaders.hs ../Retro68/Universal\ Headers toolchain/m68k-unknown-elf/include

