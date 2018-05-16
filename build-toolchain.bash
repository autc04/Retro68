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
PREFIX=`pwd -P`/toolchain/
BINUTILS=`pwd -P`/binutils-build

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
	echo "    --skip-thirdparty         do not rebuild gcc & third party libraries"
	echo "    --no-68k                  disable support for 68K Macs"
	echo "    --no-ppc                  disable classic PowerPC CFM support"
	echo "    --no-carbon               disable Carbon CFM support"
	echo "    --clean-after-build       remove intermediate build files right after building"
	echo "    --host-cxx-compiler       specify C++ compiler (needed on Mac OS X 10.4)" 
	echo "    --host-c-compiler         specify C compiler (needed on Mac OS X 10.4)"
	echo "    --ninja                   use ninja for cmake builds"
	echo "    --help                    show this help message"
}

for ARG in $*; do
	case $ARG in
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


if [ $SKIP_THIRDPARTY != false ]; then
	MISSING=false
	if [ ! -d toolchain ]; then MISSING=true; fi
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

function locateInterfaceThing()
{
	local varname=$1
	local name=$2
	printf "Searching for %-25s" "$name..."
	local found=`find "$INTERFACES_DIR" -name ".*" -prune -o -name $name -print`
	if [ -n "$found" ]; then
		eval "$varname=\$found"
		echo ${found#$INTERFACES_DIR/}
		return 0	# success
	else
		echo "NOT FOUND"
		return 1	# failure
	fi
}

function explainInterfaces()
{
	echo "Please get a copy of Apple's Universal Interfaces & Libraries, "
	echo "version 3.x, and place it in the InterfacesAndLibraries directory inside"
	echo "the Retro68 source directory."
	echo
	echo "The exact directory layout does not matter, but there has to be"
	echo "  - a directory with C header files (usually \"CIncludes\")"
	echo "  - a directory with Rez header files (usually \"RIncludes\")"
	echo "  - (for 68K) a directory containing Interface.o (usually \"Libraries\")"
	echo "  - (for PPC) a directory containing InterfaceLib (usually \"SharedLibraries\")"
	echo "  - (for Carbon) Carbon.h and CarbonLib, in the same directories"
	echo
	echo "The Interfaces&Libraries folder from Apple's last MPW release (MPW 3.5 "
	echo "aka MPW GM 'Golden Master') is known to work."
	exit 1
}

echo "Looking for various files in $INTERFACES_DIR/..."

if locateInterfaceThing CONDITIONALMACROS_H ConditionalMacros.h; then
	CINCLUDES=`dirname "$CONDITIONALMACROS_H"`
else
	echo "Could not find ConditionalMacros.h anywhere inside InterfaceAndLibraries/"
	echo
	explainInterfaces
fi

if locateInterfaceThing CONDITIONALMACROS_R ConditionalMacros.r; then
	RINCLUDES=`dirname "$CONDITIONALMACROS_R"`
else
	echo "Could not find ConditionalMacros.r anywhere inside InterfaceAndLibraries/"
	echo
	explainInterfaces
fi

if [ $BUILD_68K != false ]; then

	if locateInterfaceThing INTERFACE_O Interface.o; then
		true
	else
		echo "Could not find Interface.o anywhere inside InterfaceAndLibraries/"
		echo "(This file is required for 68K support only)"
		echo
		explainInterfaces
	fi

fi

if [ $BUILD_PPC != false ]; then

	if locateInterfaceThing INTERFACELIB InterfaceLib; then
		SHAREDLIBRARIES=`dirname "$INTERFACELIB"`
	else
		echo "Could not find InterfaceLib anywhere inside InterfaceAndLibraries/"
		echo "(This file is required for PowerPC support only)"
		echo
		explainInterfaces
	fi

	if locateInterfaceThing OPENTRANSPORTAPPPPC OpenTransportAppPPC.o; then
		PPCLIBRARIES=`dirname "$OPENTRANSPORTAPPPPC"`
	else
		echo "Could not find OpenTransportAppPPC.o anywhere inside InterfaceAndLibraries/"
		echo "(This file is required for OpenTransport on PPC only)"
fi

fi

if [ $BUILD_CARBON != false ]; then
	if locateInterfaceThing CARBON_H Carbon.h; then
		carbondir=`dirname "$CARBON_H"`
		if [ "$carbondir" != "$CINCLUDES" ]; then
			echo "Carbon.h found, but not in the same directory as ConditionalMacros.h."
			echo "This is confusing."
			echo
			explainInterfaces
		fi
	else
		echo "Could not find Carbon.h anywhere inside InterfaceAndLibraries/"
		echo "(This file is required for Carbon support only)"
		echo
		explainInterfaces
	fi
	if locateInterfaceThing CARBONLIB CarbonLib; then
		carbondir=`dirname "$CARBONLIB"`
		if [ "$carbondir" != "$SHAREDLIBRARIES" ]; then
			echo "Carbon.h found, but not in the same directory as InterfaceLib."
			echo "This is confusing."
			echo
			explainInterfaces
		fi
	else
		echo "Could not find CarbonLib anywhere inside InterfaceAndLibraries/"
		echo "(This file is required for Carbon support only)"
		echo
		explainInterfaces
	fi
fi

##################### Third-Party components: binutils, gcc, hfsutils

if [ $SKIP_THIRDPARTY != true ]; then

	# Remove old install tree
	rm -rf toolchain
	mkdir -p toolchain

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
		$SRC/binutils/configure --target=powerpc-apple-macos --prefix=$PREFIX --disable-doc
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
	mkdir -p $PREFIX/man/man1
	rm -rf hfsutils
	cp -r $SRC/hfsutils .
	cd hfsutils
	./configure --prefix=$PREFIX --enable-devlibs
	make
	make install
	cd ..

	if [ $CLEAN_AFTER_BUILD != false ]; then
		rm -rf hfsutils
	fi

fi # SKIP_THIRDPARTY

##################### Build host-based components: MakePEF, MakeImport, ConvertObj, Rez, ...

echo "Building host-based tools..."

# Copy PEFBinaryFormat.h from Universal Interfaces, needed by MakePEF & MakeImport
(export LANG=en; sed 's/\r$//' < "$CINCLUDES/PEFBinaryFormat.h" | tr '\r' '\n' > "toolchain/include/PEFBinaryFormat.h")

mkdir -p build-host
cd build-host
cmake ${SRC} -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Debug "${HOST_CMAKE_FLAGS[@]}" ${CMAKE_GENERATOR}
cd ..
cmake --build build-host --target install

	# make tools (such as MakeImport and the compilers) available for later commands
export PATH=$PREFIX/bin:$PATH

##################### Setup Interfaces & Libraries

echo "Preparing CIncludes..."
rm -rf "toolchain/CIncludes"
mkdir "toolchain/CIncludes"
sh "$SRC/prepare-headers.sh" "$CINCLUDES" "toolchain/CIncludes"

echo "Preparing RIncludes..."
rm -rf "toolchain/RIncludes"
mkdir "toolchain/RIncludes"
sh "$SRC/prepare-rincludes.sh" "$RINCLUDES" "toolchain/RIncludes"

# remove old symlinks in toolchain/*-apple-macos/include/
# and link files from toolchain/CIncludes
function linkheaders()
{
	# incompatible with Universal Interfaces on case-insensitive file systems
	# (and does not currently work anyways)
    rm -f "$1"/threads.h

	# the following command doesn't work on older Mac OS X versions.
	# allow it to fail quietly, at worst we leave some dangling symlinks around
	# in the rare situation that headers are removed from the input directory
	find "$1" -lname "../../CIncludes/*" -delete || true
    (cd "$1" && find "../../CIncludes/" -name '*.h' -exec ln -s {} . \;)
}

echo "Creating Symlinks for CIncludes and RIncludes..."

if [ $BUILD_68K != false ]; then
    ln -sf ../RIncludes toolchain/m68k-apple-macos/RIncludes
    linkheaders toolchain/m68k-apple-macos/include
fi

if [ $BUILD_PPC != false ]; then
    ln -sf ../RIncludes toolchain/powerpc-apple-macos/RIncludes
    linkheaders toolchain/powerpc-apple-macos/include
fi

if [ $BUILD_PPC != false ]; then
	case `ResInfo -n "$INTERFACELIB" || echo 0` in
		0)
			echo "WARNING: Couldn't read resource fork for \"$INTERFACELIB\"."
			echo "         Falling back to included import libraries."
			echo "Copying readymade PowerPC import libraries..."
			cp $SRC/ImportLibraries/*.a toolchain/powerpc-apple-macos/lib/
			;;
		*)
			echo "Building PowerPC import libraries..."
			for shlib in "${SHAREDLIBRARIES}/"*; do
				libname=`basename "$shlib"`
				implib=lib${libname}.a
				printf "    %30s => %-30s\n" ${libname} ${implib}
				MakeImport "$shlib" "toolchain/powerpc-apple-macos/lib/$implib"
			done
			;;
	esac

    if [ -d ${PPCLIBRARIES} ]; then
        echo "Copying static PPC libraries"
        for obj in ${PPCLIBRARIES}/OpenT*.o ${PPCLIBRARIES}/CarbonAccessors.o ${PPCLIBRARIES}/CursorDevicesGlue.o; do
            if [ -r $obj ]; then
                # copy the library:
                cp $obj toolchain/powerpc-apple-macos/lib/

                # and wrap it in a .a archive for convenience
            	lib=toolchain/powerpc-apple-macos/lib/lib`basename "${obj%.o}"`.a
                rm -f $lib
                toolchain/bin/powerpc-apple-macos-ar cqs $lib $obj
            fi
        done
    fi
fi

# if [ $BUILD_PPC != false ]; then
#	echo "Copying PowerPC import libraries..."
#	cp $SRC/ImportLibraries/*.a toolchain/powerpc-apple-macos/lib/
#fi




	# If this is the first build,
	# create an empty libretrocrt.a for each platform so that cmake's compiler
	# test doesn't fail
for arch in $ARCHS; do
	if [ ! -e "$PREFIX/${arch}-apple-macos/lib/libretrocrt.a" ]; then
		echo "Creating dummy libretrocrt.a for $arch..."
		"$PREFIX/bin/${arch}-apple-macos-ar" cqs "$PREFIX/${arch}-apple-macos/lib/libretrocrt.a"
	fi
done
if [ ! -e "$PREFIX/powerpc-apple-macos/lib/libretrocrt-carbon.a" ]; then
    echo "Creating dummy libretrocrt-carbon.a for $arch..."
    "$PREFIX/bin/powerpc-apple-macos-ar" cqs "$PREFIX/powerpc-apple-macos/lib/libretrocrt-carbon.a"
fi

	# the real libretrocrt.a is built and installed by 
	# `cmake --build build-target --target install` later

	##################### Setup Interfaces & Libraries

if [ $BUILD_68K != false ]; then
	echo "Building target libraries and samples for 68K..."
	# Build target-based components for 68K
	mkdir -p build-target
	cd build-target

	INTERFACE_O=`find "$SRC/InterfacesAndLibraries" -name ".*" -prune -o -name Interface.o -print`

	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intree.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
				 "-DINTERFACE_O=${INTERFACE_O}" \
                 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target --target install

fi

if [ $BUILD_PPC != false ]; then
	echo "Building target libraries and samples for PowerPC..."
	# Build target-based components for PPC
	mkdir -p build-target-ppc
	cd build-target-ppc
	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreeppc.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
                 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target-ppc --target install
fi

if [ $BUILD_CARBON != false ]; then
	echo "Building target libraries and samples for Carbon..."
	# Build target-based components for Carbon
	mkdir -p build-target-carbon
	cd build-target-carbon
	cmake ${SRC} -DCMAKE_TOOLCHAIN_FILE=../build-host/cmake/intreecarbon.toolchain.cmake \
				 -DCMAKE_BUILD_TYPE=Release \
                 ${CMAKE_GENERATOR}
	cd ..
	cmake --build build-target-carbon --target install
fi

echo
echo "Done building Retro68."
if [ $BUILD_68K != false ]; then
	echo "You will find 68K sample appliations in build-target/Samples/."
fi
if [ $BUILD_PPC != false ]; then
	echo "You will find PowerPC sample appliations in build-target-ppc/Samples/."
fi
if [ $BUILD_CARBON != false ]; then
	echo "You will find Carbon sample appliations in build-target-carbon/Samples/."
fi
