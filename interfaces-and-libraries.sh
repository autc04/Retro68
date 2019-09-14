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

function locateInterfaceThing()
{
    local varname=$1
    local name=$2
    printf "Searching for %-25s" "$name..."
    local found=`find "$INTERFACES_DIR"/ -name ".*" -prune -o -name $name -print`
    if [ -n "$found" ]; then
        eval "$varname=\$found"
        echo ${found#$INTERFACES_DIR/}
        return 0    # success
    else
        echo "NOT FOUND"
        return 1    # failure
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

function locateAndCheckInterfacesAndLibraries()
{
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
            M68KLIBRARIES=`dirname "$INTERFACE_O"`
        elif locateInterfaceThing INTERFACELIB_68K libInterface.a; then
            M68KLIBRARIES=`dirname "$INTERFACELIB_68K"`
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
                echo "CarbonLib found, but not in the same directory as InterfaceLib."
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
}

# remove old symlinks in $PREFIX/*-apple-macos/include/
# and link files from $PREFIX/CIncludes
function linkHeaders()
{
    # On case-insensitive file systems, there will be some conflicts with
    # newlib. For now, universal interfaces get the right of way.
    rm -f "$1/Threads.h"        # thread.h: does not currently work anyways
    rm -f "$1/Memory.h"         # memory.h: non-standard aliasof string.h
    rm -f "$1/Strings.h"        # strings.h: traditional bsd string functions

    (cd "$1" && find "../../CIncludes" -name '*.h' -exec ln -s {} . \;)
}

function unlinkHeaders()
{
    for file  in "$1/"*; do
        if [[ `readlink "$file"` == ../../CIncludes/* ]]; then
            rm "$file"
        fi
    done
}

function setUpInterfacesAndLibraries()
{
    echo "Preparing CIncludes..."
    rm -rf "$PREFIX/CIncludes"
    mkdir "$PREFIX/CIncludes"
    sh "$SRC/prepare-headers.sh" "$CINCLUDES" "$PREFIX/CIncludes"

    echo "Preparing RIncludes..."
    mkdir -p "$PREFIX/RIncludes"
    find "$PREFIX/RIncludes" ! -name 'Retro*.r' -type f -exec rm -f {} \;
    sh "$SRC/prepare-rincludes.sh" "$RINCLUDES" "$PREFIX/RIncludes"

    echo "Creating Symlinks for CIncludes and RIncludes..."

    if [ $BUILD_68K != false ]; then
        ln -sf ../RIncludes $PREFIX/m68k-apple-macos/RIncludes
        linkHeaders $PREFIX/m68k-apple-macos/include
    fi

    if [ $BUILD_PPC != false ]; then
        ln -sf ../RIncludes $PREFIX/powerpc-apple-macos/RIncludes
        linkHeaders $PREFIX/powerpc-apple-macos/include
    fi

    FILE_LIST="$PREFIX/apple-libraries.txt"
    rm -f "$FILE_LIST"
    touch "$FILE_LIST"

    if [ $BUILD_68K != false ]; then
        echo "Converting 68K static libraries..."
        for macobj in "${M68KLIBRARIES}/"*.o; do
            if [ -r "$macobj" ]; then
                libname=`basename "$macobj"`
                libname=${libname%.o}
                printf "    %30s => %-30s\n" ${libname}.o lib${libname}.a
                asm="$PREFIX/m68k-apple-macos/lib/$libname.s"
                obj="$PREFIX/m68k-apple-macos/lib/$libname.o"
                lib="Fm68k-apple-macos/lib/lib${libname}.a"

                rm -f $lib

                if ConvertObj "$macobj" > "$asm"; then
                    m68k-apple-macos-as "$asm" -o "$obj"
                    m68k-apple-macos-ar cqs "$lib" "$obj"
                    echo "m68k-apple-macos/lib/$libname.o" >> "$FILE_LIST"
                    echo "m68k-apple-macos/lib/lib${libname}.a" >> "$FILE_LIST"
                fi
                rm -f "$asm"
            fi
        done
        for lib in "${M68KLIBRARIES}/"lib*.a; do
            libname=`basename "$lib"`
            cp $lib "$PREFIX/m68k-apple-macos/lib/"
            echo "m68k-apple-macos/lib/${libname}" >> "$FILE_LIST"
        done
    fi

    if [ $BUILD_PPC != false ]; then
        case `ResInfo -n "$INTERFACELIB" || echo 0` in
            0)
                echo "WARNING: Couldn't read resource fork for \"$INTERFACELIB\"."
                echo "         Falling back to included import libraries."
                echo "Copying readymade PowerPC import libraries..."
                cp $SRC/ImportLibraries/*.a $PREFIX/powerpc-apple-macos/lib/
                ;;
            *)
                echo "Building PowerPC import libraries..."
                for shlib in "${SHAREDLIBRARIES}/"*; do
                    libname=`basename "$shlib"`
                    implib=lib${libname}.a
                    printf "    %30s => %-30s\n" ${libname} ${implib}
                    MakeImport "$shlib" "$PREFIX/powerpc-apple-macos/lib/$implib" \
                        && echo "powerpc-apple-macos/lib/$implib" >> "$FILE_LIST"
                done
                ;;
        esac

        if [ -d "${PPCLIBRARIES}" ]; then
            echo "Copying static PPC libraries"
            for obj in "${PPCLIBRARIES}/"OpenT*.o "${PPCLIBRARIES}/CarbonAccessors.o" "${PPCLIBRARIES}/CursorDevicesGlue.o"; do
                if [ -r "$obj" ]; then
                    # copy the library:
                    cp "$obj" "$PREFIX/powerpc-apple-macos/lib/"
                    basename=`basename "${obj%.o}"`
                    # and wrap it in a .a archive for convenience
                    lib="$PREFIX"/powerpc-apple-macos/lib/lib$basename.a
                    rm -f "$lib"
                    powerpc-apple-macos-ar cqs "$lib" "$obj"
                    echo "powerpc-apple-macos/lib/$basename.o" >> "$FILE_LIST"
                    echo "powerpc-apple-macos/lib/lib$basename.a" >> "$FILE_LIST"
                fi
            done
        fi
    fi
}

function removeInterfacesAndLibraries()
{
    FILE_LIST="$PREFIX/apple-libraries.txt"
    if [ -r "$FILE_LIST" ]; then
        echo "Removing currently installed Apple Interfaces and Libraries..."
        for file in `cat "$FILE_LIST"`; do
            rm -f "$PREFIX/$file"
        done
        unlinkHeaders "$PREFIX/m68k-apple-macos/include"
        unlinkHeaders "$PREFIX/powerpc-apple-macos/include"
        rm -f "$PREFIX/m68k-apple-macos/RIncludes"
        rm -f "$PREFIX/powerpc-apple-macos/RIncludes"
        rm -rf "$PREFIX/CIncludes"
        find "$PREFIX/RIncludes" ! -name 'Retro*.r' -type f -exec rm -f {} \;
        rm -f "$FILE_LIST"
    fi
}

if (return 0 2>/dev/null); then
    # We are being sourced from build-toolchain.sh
    true
else
    # We are being run directly

    if [ $# -lt 2 ]; then
        echo "Usage: $0 /install/path /path/to/InterfacesAndLibraries"
        echo "       $0 /install/path --remove"
        exit 1
    fi

    PREFIX="$1"
    INTERFACES_DIR="$2"
    BUILD_68K=${3:-true}
    BUILD_PPC=${4:-true}
    BUILD_CARBON=${5:-true}
    SRC=$(cd `dirname $0` && pwd -P)
    export PATH="$PREFIX/bin:$PATH"

    if [ "${INTERFACES_DIR}" = "--remove" ]; then
        removeInterfacesAndLibraries
    else
        locateAndCheckInterfacesAndLibraries
        removeInterfacesAndLibraries
        setUpInterfacesAndLibraries
    fi
fi
