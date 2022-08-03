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

shopt -s nullglob

function locateInterfaceThing()
{
    local varname=$1
    local name=$2
    printf "Searching for %-25s" "$name..."
    local found=`find -L "$INTERFACES_DIR"/ -name ".*" -prune -o -name $name -print`
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
    if [ "$INTERFACES_KIND" = "multiversal" ]; then
        echo "Apple's Universal Interfaces & Libraries will not be installed."
        echo "Continuing with the open-source Multiversal Interfaces."
        echo
        return
    fi
    echo "==============================================================================="
    if [ -z "$INTERFACES_KIND" ]; then
        echo "If you want to use Apple's Universal Interfaces & Libraries "
        echo "rather than the open-source Multiversal Interfaces, get a copy of"
        echo "version 3.x, and place it in the InterfacesAndLibraries directory inside"
        echo "the Retro68 source directory."
    else
        echo "Please get a copy of Apple's Universal Interfaces & Libraries, "
        echo "version 3.x, and place it in the InterfacesAndLibraries directory inside"
        echo "the Retro68 source directory."
    fi
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
    
    if [ -z "$INTERFACES_KIND" ]; then
        INTERFACES_KIND=multiversal
        echo
        echo "Continuing with the open-source Multiversal Interfaces."
        echo "==============================================================================="
        echo        
    else
        echo "==============================================================================="
        exit 1
    fi
}

function locateAndCheckInterfacesAndLibraries()
{
    echo "Looking for various files in $INTERFACES_DIR/..."

    if locateInterfaceThing CONDITIONALMACROS_H ConditionalMacros.h; then
        CINCLUDES=`dirname "$CONDITIONALMACROS_H"`
    else
        echo "Could not find ConditionalMacros.h anywhere inside $INTERFACES_DIR"
        echo
        explainInterfaces
        return
    fi

    if locateInterfaceThing CONDITIONALMACROS_R ConditionalMacros.r; then
        RINCLUDES=`dirname "$CONDITIONALMACROS_R"`
    else
        echo "Could not find ConditionalMacros.r anywhere inside $INTERFACES_DIR"
        echo
        explainInterfaces
        return
    fi

    if [ $BUILD_68K != false ]; then

        if locateInterfaceThing INTERFACE_O Interface.o; then
            M68KLIBRARIES=`dirname "$INTERFACE_O"`
        elif locateInterfaceThing INTERFACELIB_68K libInterface.a; then
            M68KLIBRARIES=`dirname "$INTERFACELIB_68K"`
        else
            echo "Could not find Interface.o anywhere inside $INTERFACES_DIR"
            echo "(This file is required for 68K support only)"
            echo
            explainInterfaces
            return
        fi

    fi

    if [ $BUILD_PPC != false ]; then

        if locateInterfaceThing INTERFACELIB InterfaceLib; then
            SHAREDLIBRARIES=`dirname "$INTERFACELIB"`
        else
            SHAREDLIBRARIES=""
            echo "Could not find InterfaceLib, using included import libraries."
        fi

        if locateInterfaceThing OPENTRANSPORTAPPPPC OpenTransportAppPPC.o; then
            PPCLIBRARIES=`dirname "$OPENTRANSPORTAPPPPC"`
        else
            echo "Could not find OpenTransportAppPPC.o anywhere inside $INTERFACES_DIR"
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
                return
            fi
        else
            echo "Could not find Carbon.h anywhere inside $INTERFACES_DIR"
            echo "(This file is required for Carbon support only)"
            echo
            explainInterfaces
            return
        fi
        if locateInterfaceThing CARBONLIB CarbonLib; then
            carbondir=`dirname "$CARBONLIB"`
            if [ "$carbondir" != "$SHAREDLIBRARIES" ]; then
                echo "CarbonLib found, but not in the same directory as InterfaceLib."
                echo "This is confusing."
                echo
                explainInterfaces
                return
            fi
        else
            echo "Could not find CarbonLib anywhere inside $INTERFACES_DIR"
            echo "(This file is required for Carbon support only)"
            echo
            explainInterfaces
            return
        fi
    fi

    if [ -z "$INTERFACES_KIND" ]; then
        INTERFACES_KIND=universal
    fi
}


function linkThings()
{
    FROM="$1"
    TO="$2"
    PATTERN="$3"
    
    mkdir -p "$TO"
    (cd "$TO" && find "$FROM" -name "$PATTERN" -exec ln -s {} . \;)
}

function removeConflictingHeaders()
{
    # On case-insensitive file systems, there will be some conflicts with
    # newlib. For now, universal interfaces get the right of way.
    rm -f "$1/Threads.h"        # threads.h: does not currently work anyways
    rm -f "$1/Memory.h"         # memory.h: non-standard aliasof string.h
    cp "$1/strings.h" "$1/bsdstrings.h"
    rm -f "$1/Strings.h"        # strings.h: traditional bsd string functions
}


function unlinkThings()
{
    for file  in "$1/"*; do
        if [[ `readlink "$file"` == $2/* ]]; then
            rm "$file"
        fi
    done
}

function linkInterfacesAndLibraries()
{
    linkThings "../$1/RIncludes" "$PREFIX/RIncludes" "*.r"
    
    if [ $BUILD_68K != false ]; then
        ln -sf ../RIncludes "$PREFIX/m68k-apple-macos/RIncludes"
        removeConflictingHeaders "$PREFIX/m68k-apple-macos/include"
        linkThings "../../$1/CIncludes" "$PREFIX/m68k-apple-macos/include" "*.h"
        linkThings "../../$1/lib68k" "$PREFIX/m68k-apple-macos/lib" "*.a"
    fi

    if [ $BUILD_PPC != false ]; then
        ln -sf ../RIncludes "$PREFIX/powerpc-apple-macos/RIncludes"
        removeConflictingHeaders "$PREFIX/powerpc-apple-macos/include"
        linkThings "../../$1/CIncludes" "$PREFIX/powerpc-apple-macos/include" "*.h"
        linkThings "../../$1/libppc" "$PREFIX/powerpc-apple-macos/lib" "*.a"
    fi
}

function unlinkInterfacesAndLibraries()
{
    unlinkThings "$PREFIX/RIncludes" "../*/RIncludes"
    unlinkThings "$PREFIX/m68k-apple-macos/include" "../../*/CIncludes"
    unlinkThings "$PREFIX/powerpc-apple-macos/include" "../../*/CIncludes"
    unlinkThings "$PREFIX/m68k-apple-macos/lib" "../../*/lib68k"
    unlinkThings "$PREFIX/powerpc-apple-macos/lib" "../../*/libppc"
    rm -f "$PREFIX/m68k-apple-macos/RIncludes"
    rm -f "$PREFIX/powerpc-apple-macos/RIncludes"
}

function setup68KLibraries()
{
    DEST=${1:-"$PREFIX/universal"}
    echo "Converting 68K static libraries..."
    mkdir -p "$DEST/lib68k"
    for macobj in "${M68KLIBRARIES}/"*.o; do
        if [ -r "$macobj" ]; then
            libname=`basename "$macobj"`
            libname=${libname%.o}
            printf "    %30s => %-30s\n" ${libname}.o lib${libname}.a
            asm="$DEST/lib68k/$libname.s"
            obj="$DEST/lib68k/$libname.o"
            lib="$DEST/lib68k/lib${libname}.a"

            rm -f $lib

            if ConvertObj "$macobj" > "$asm"; then
                m68k-apple-macos-as "$asm" -o "$obj"
                m68k-apple-macos-ar cqs "$lib" "$obj"
            fi
            rm -f "$asm"
        fi
    done
}

function setupPPCLibraries()
{
    DEST=${1:-"$PREFIX/universal"}
    mkdir -p "$DEST/libppc"
    case `ResInfo -n "$INTERFACELIB" 2> /dev/null || echo 0` in
        0)
            if [ -n "$INTERFACELIB" ]; then
                echo "WARNING: Couldn't read resource fork for \"$INTERFACELIB\"."
                echo "         Falling back to included import libraries."
            fi
            echo "Copying readymade PowerPC import libraries..."
            cp $PREFIX/multiversal/libppc/*.a $DEST/libppc/
            ;;
        *)
            echo "Building PowerPC import libraries..."
            for shlib in "${SHAREDLIBRARIES}/"*; do
                libname=`basename "$shlib"`
                implib=lib${libname%.bin}.a
                printf "    %30s => %-30s\n" ${libname} ${implib}
                MakeImport "$shlib" "$DEST/libppc/$implib" || true
            done
            ;;
    esac

    if [ -d "${PPCLIBRARIES}" ]; then
        echo "Copying static PPC libraries"
        for obj in "${PPCLIBRARIES}/"OpenT*.o "${PPCLIBRARIES}/CarbonAccessors.o" "${PPCLIBRARIES}/CursorDevicesGlue.o"; do
            if [ -r "$obj" ]; then
                # copy the library:
                cp "$obj" "$DEST/libppc/"
                basename=`basename "${obj%.o}"`
                # and wrap it in a .a archive for convenience
                lib="$DEST"/libppc/lib$basename.a
                rm -f "$lib"
                powerpc-apple-macos-ar cqs "$lib" "$obj"
            fi
        done
    fi
}

function setUpInterfacesAndLibraries()
{
    DEST=${1:-"$PREFIX/universal"}
    rm -rf "$DEST"
    mkdir "$DEST"

    echo "Preparing CIncludes..."
    mkdir "$DEST/CIncludes"
    sh "$SRC/prepare-headers.sh" "$CINCLUDES" "$DEST/CIncludes"

    echo "Preparing RIncludes..."
    mkdir "$DEST/RIncludes"
    sh "$SRC/prepare-rincludes.sh" "$RINCLUDES" "$DEST/RIncludes"

    if [ $BUILD_68K != false ]; then
        setup68KLibraries "$DEST"
    fi

    if [ $BUILD_PPC != false ]; then
        setupPPCLibraries "$DEST"
    fi
}

function removeInterfacesAndLibraries()
{
    unlinkInterfacesAndLibraries
    rm -rf "$PREFIX/universal"
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
    elif [ "${INTERFACES_DIR}" = "--unlink" ]; then
        unlinkInterfacesAndLibraries
    elif [ "${INTERFACES_DIR}" = "--multiversal" ]; then
        unlinkInterfacesAndLibraries
        linkInterfacesAndLibraries "multiversal"
    elif [ "${INTERFACES_DIR}" = "--universal" ]; then
        unlinkInterfacesAndLibraries
        linkInterfacesAndLibraries "universal"
    else
        INTERFACES_KIND=universal
        locateAndCheckInterfacesAndLibraries
        removeInterfacesAndLibraries
        setUpInterfacesAndLibraries
        linkInterfacesAndLibraries "universal"
    fi
fi
