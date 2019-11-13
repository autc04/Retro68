#!/bin/bash
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
DEFAULT_PREFIX=`pwd -P`/toolchain/
PREFIX=$DEFAULT_PREFIX
BINUTILS=`pwd -P`/binutils-build

##################### Prerequisites check

if [ ! -d "$SRC/multiversal" ]; then
    echo "Could not find directory '$SRC/multiversal'."
    echo "It looks like you did not clone the git submodules."
    echo "Please run:"
    echo "    git submodule update --init"
    exit 1
fi

##################### Command-line Options

SKIP_THIRDPARTY=false
BUILD_68K=true
BUILD_PPC=true
BUILD_CARBON=true
CLEAN_AFTER_BUILD=false
HOST_CMAKE_FLAGS=()
CMAKE_GENERATOR=

function usage()
{
	echo "Usage: $0 [options]"
	echo
	echo "Options: "
	echo "    --prefix                  the path to install the toolchain to"
	echo "    --skip-thirdparty         do not rebuild gcc & third party libraries"
	echo "    --no-68k                  disable support for 68K Macs"
	echo "    --no-ppc                  disable classic PowerPC CFM support"
	echo "    --no-carbon               disable Carbon CFM support"
	echo "    --clean-after-build       remove intermediate build files right after building"
	echo "    --host-cxx-compiler       specify C++ compiler (needed on Mac OS X 10.4)"
	echo "    --host-c-compiler         specify C compiler (needed on Mac OS X 10.4)"
	echo "    --ninja                   use ninja for cmake builds"
    echo "    --universal               use Apple's universal interfaces (default: autodetect)"
    echo "    --multiversal             use the open-source multiversal interfaces (default: autodetect)"
	echo "    --help                    show this help message"
}

for ARG in $*; do
	case $ARG in
		--prefix=*)
			PREFIX="${ARG#*=}"
			;;
		--skip-thirdparty)
			SKIP_THIRDPARTY=true
			;;
		--no-68k)
			BUILD_68K=false
			;;
		--no-ppc)
			BUILD_PPC=false
			BUILD_CARBON=false
			;;
		--no-carbon)
			BUILD_CARBON=false
			;;
		--clean-after-build)
			CLEAN_AFTER_BUILD=true
			;;
		--host-cxx-compiler=*)
			HOST_CMAKE_FLAGS[${#HOST_CMAKE_FLAGS[@]}]="-DCMAKE_CXX_COMPILER=${ARG#*=}"
			HOST_CXX_COMPILER="${ARG#*=}"
			;;
		--host-c-compiler=*)
			HOST_CMAKE_FLAGS[${#HOST_CMAKE_FLAGS[@]}]="-DCMAKE_C_COMPILER=${ARG#*=}"
			HOST_C_COMPILER="${ARG#*=}"
			;;
		--ninja)
			CMAKE_GENERATOR=-GNinja
			;;
        --universal)
            INTERFACES_KIND=universal
            ;;
        --multiversal)
            INTERFACES_KIND=multiversal
            ;;
		--help)
			usage
			exit 0
			;;
		*)
			echo "unknown option $ARG"
			usage
			exit 1
			;;
	esac
done

ARCHS=""
if [ $BUILD_68K != false ]; then
	ARCHS="$ARCHS m68k"
fi
if [ $BUILD_PPC != false ]; then
	ARCHS="$ARCHS powerpc"
fi


##################### Sanity checks

if [ `pwd -P` == "$SRC" ]; then
	echo "Please do not invoke build-toolchain.sh from the source directory."
	echo "Instead, create a separate build directory:"
	echo "    cd .."
	echo "    mkdir Retro68-build"
	echo "    ../`basename $SRC`/build-toolchain.sh"
	exit 1
fi

if [ "$PREFIX" != "$DEFAULT_PREFIX" -a -d "$PREFIX" -a $SKIP_THIRDPARTY != true ]; then
	if [ ! -w "$PREFIX" ]; then
		echo "$PREFIX is not writable, cannot install to there."
		exit 1
	fi
	if [ "`ls -A "$PREFIX"`" ]; then
		echo "$PREFIX is not empty, cannot install to there."
		exit 1
	fi
fi

if [ $SKIP_THIRDPARTY != false ]; then
	MISSING=false
	if [ ! -d $PREFIX ]; then MISSING=true; fi
	if [ $BUILD_68K != false ]; then
		if [ ! -d binutils-build ]; then MISSING=true; fi
		if [ ! -d gcc-build ]; then MISSING=true; fi
	fi
	if [ $BUILD_PPC != false ]; then
		if [ ! -d binutils-build-ppc ]; then MISSING=true; fi
		if [ ! -d gcc-build-ppc ]; then MISSING=true; fi
	fi
	if [ ! -d hfsutils ]; then MISSING=true; fi

	if [ $MISSING != false ]; then
		echo "Not all third-party components have been built yet, ignoring --skip-thirdparty."
		SKIP_THIRDPARTY=false
	fi
fi

### Running on a Power Mac (tested with 10.4 Tiger)

if [ "`uname -m`" = "Power Macintosh" ]; then
		# The default compiler won't work,
		# check whether the compiler has been explictly specified
		# on the command line
	if [ $SKIP_THIRDPARTY = false ]; then
		if [ -z "$HOST_CXX_COMPILER" -o -z "$HOST_C_COMPILER" ]; then
			echo "**** Apple's version of GCC on Power Macs is too old."
			echo "**** Please explicitly specify the C and C++ compilers"
			echo "**** using the --host-c-compiler and --host-cxx-compiler options."
			echo "**** You can install a usable compiler using tigerbrew."
			exit 1
		fi
	fi

		# work around a problem with building gcc-7 with homebrew's gcc-5
	export gcc_cv_c_no_fpie=no
fi

##################### Locate and check Interfaces & Libraries

if [ -d "$SRC/CIncludes" -o -d "$SRC/RIncludes" ]; then
	echo
	echo "### WARNING:"
	echo "### Different from previous versions, Retro68 now expects to find"
	echo "### header files and libraries inside the InterfacesAndLibraries diretory."
	echo
fi

INTERFACES_DIR="$SRC/InterfacesAndLibraries"

. "$SRC/interfaces-and-libraries.sh"

locateAndCheckInterfacesAndLibraries

##################### Third-Party components: binutils, gcc, hfsutils

if [ $SKIP_THIRDPARTY != true ]; then

	if [ "$PREFIX" = "$DEFAULT_PREFIX" ]; then
		# Remove old install tree
		rm -rf $PREFIX
	fi
	mkdir -p $PREFIX

	# Components needed for targeting 68K: binutils, gcc
	if [ $BUILD_68K != false ]; then

			# present-day Mac users are likely to install dependencies
			# in /usr/local via the homebrew package manager
		export CPPFLAGS="-I/usr/local/include"
		export LDFLAGS="-L/usr/local/lib"

			# or they could be using MacPorts. Default install
			# location is /opt/local
		if [ -d "/opt/local/include" ]; then
			export CPPFLAGS="$CPPFLAGS -I/opt/local/include"
			export LDFLAGS="$LDFLAGS -L/opt/local/lib"
		fi

		export CC=$HOST_C_COMPILER
		export CXX=$HOST_CXX_COMPILER

		# Build binutils for 68K
		mkdir -p binutils-build
		cd binutils-build
		$SRC/binutils/configure --target=m68k-apple-macos --prefix=$PREFIX --disable-doc
		make -j8
		make install
		cd ..

		# Build gcc for 68K
		mkdir -p gcc-build
		cd gcc-build
		export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
		$SRC/gcc/configure --target=m68k-apple-macos --prefix=$PREFIX \
				--enable-languages=c,c++ --with-arch=m68k --with-cpu=m68000 \
				--disable-libssp MAKEINFO=missing
		# There seems to be a build failure in parallel builds; ignore any errors and try again without -j8.
		make -j8 || make
		make install
		unset target_configargs
		cd ..

		unset CPPFLAGS
		unset LDFLAGS
		unset CC
		unset CXX

		# Move the real linker aside and install symlinks to Elf2Mac
		# (Elf2Mac is built by cmake below)
		mv $PREFIX/bin/m68k-apple-macos-ld $PREFIX/bin/m68k-apple-macos-ld.real
		mv $PREFIX/m68k-apple-macos/bin/ld $PREFIX/m68k-apple-macos/bin/ld.real
		ln -s $PREFIX/bin/Elf2Mac $PREFIX/bin/m68k-apple-macos-ld
		ln -s $PREFIX/bin/Elf2Mac $PREFIX/m68k-apple-macos/bin/ld

		if [ $CLEAN_AFTER_BUILD != false ]; then
			rm -rf binutils-build
			rm -rf gcc-build
		fi

	fi

	# Components needed for targeting PPC (including Carbon): binutils, gcc
	if [ $BUILD_PPC != false ]; then

			# present-day Mac users are likely to install dependencies
			# in /usr/local via the homebrew package manager
		export CPPFLAGS="-I/usr/local/include"
		export LDFLAGS="-L/usr/local/lib"

			# or they could be using MacPorts. Default install
			# location is /opt/local
		if [ -d "/opt/local/include" ]; then
			export CPPFLAGS="$CPPFLAGS -I/opt/local/include"
			export LDFLAGS="$LDFLAGS -L/opt/local/lib"
		fi

		export CC=$HOST_C_COMPILER
		export CXX=$HOST_CXX_COMPILER

		# Build binutils for PPC
		mkdir -p binutils-build-ppc
		cd binutils-build-ppc
		$SRC/binutils/configure --disable-plugins --target=powerpc-apple-macos --prefix=$PREFIX --disable-doc
		make -j8
		make install
		cd ..

		# Build gcc for PPC
		mkdir -p gcc-build-ppc
		cd gcc-build-ppc
		export target_configargs="--disable-nls --enable-libstdcxx-dual-abi=no --disable-libstdcxx-verbose"
		$SRC/gcc/configure --target=powerpc-apple-macos --prefix=$PREFIX \
			--enable-languages=c,c++ --disable-libssp --disable-lto MAKEINFO=missing
		make -j8
		make install
		unset target_configargs
		cd ..

		unset CPPFLAGS
		unset LDFLAGS
		unset CC
		unset CXX

		if [ $CLEAN_AFTER_BUILD != false ]; then
			rm -rf binutils-build-ppc
			rm -rf gcc-build-ppc
		fi
	fi

	# Build hfsutil
	mkdir -p $PREFIX/lib
	mkdir -p $PREFIX/share/man/man1
	rm -rf hfsutils
	cp -r $SRC/hfsutils .
	cd hfsutils
	./configure --prefix=$PREFIX --mandir=$PREFIX/share/man --enable-devlibs
	make
	make install
	cd ..

	if [ $CLEAN_AFTER_BUILD != false ]; then
		rm -rf hfsutils
	fi
else # SKIP_THIRDPARTY
    removeInterfacesAndLibraries
fi # SKIP_THIRDPARTY

##################### Build host-based components: MakePEF, MakeImport, ConvertObj, Rez, ...

echo "Building host-based tools..."

mkdir -p build-host
cd build-host
cmake ${SRC} -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Debug "${HOST_CMAKE_FLAGS[@]}" ${CMAKE_GENERATOR}
cd ..
cmake --build build-host --target install

echo 'subdirs("build-host")' > CTestTestfile.cmake

	# make tools (such as MakeImport and the compilers) available for later commands
export PATH=$PREFIX/bin:$PATH

##################### Set up Interfaces & Libraries

(cd "${SRC}/multiversal" && ruby make-multiverse.rb -G CIncludes -o "${PREFIX}/multiversal")
mkdir -p "${PREFIX}/multiversal/libppc"
cp "${SRC}/ImportLibraries"/*.a "${PREFIX}/multiversal/libppc/"
setUpInterfacesAndLibraries
linkInterfacesAndLibraries ${INTERFACES_KIND}

##################### Build target libraries and samples

if [ $BUILD_68K != false ]; then
	echo "Building target libraries and samples for 68K..."
	# Build target-based components for 68K
	mkdir -p build-target
	cd build-target

	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intree.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
				 -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
				 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target --target install

	echo 'subdirs("build-target")' >> CTestTestfile.cmake
fi

if [ $BUILD_PPC != false ]; then
	echo "Building target libraries and samples for PowerPC..."
	# Build target-based components for PPC
	mkdir -p build-target-ppc
	cd build-target-ppc
	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreeppc.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
				 -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
				 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target-ppc --target install

	echo 'subdirs("build-target-ppc")' >> CTestTestfile.cmake
fi

if [ $BUILD_CARBON != false ]; then
	echo "Building target libraries and samples for Carbon..."
	# Build target-based components for Carbon
	mkdir -p build-target-carbon
	cd build-target-carbon
	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreecarbon.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
				 -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
				 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target-carbon --target install

	echo 'subdirs("build-target-carbon")' >> CTestTestfile.cmake
fi

echo
echo "==============================================================================="
echo "Done building Retro68."
echo "The toolchain has been installed to: ${PREFIX}"
if [ `which Rez` != $PREFIX/bin/Rez ]; then
    echo "you might want to add ${PREFIX}/bin to your PATH."
fi
case "${INTERFACES_KIND}" in
    universal)
        echo "Using Apple's Universal Interfaces."
        ;;
    multiversal)
        echo "Using the open-source Multiversal Interfaces."
        ;;
esac

if [ $BUILD_68K != false ]; then
	echo "You will find 68K sample appliations in build-target/Samples/."
fi
if [ $BUILD_PPC != false ]; then
	echo "You will find PowerPC sample appliations in build-target-ppc/Samples/."
fi
if [ $BUILD_CARBON != false ]; then
	echo "You will find Carbon sample appliations in build-target-carbon/Samples/."
fi
