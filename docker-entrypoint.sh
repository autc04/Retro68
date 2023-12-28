#!/bin/bash

set -e

TMPDIR=/tmp
BUILDDIR=/Retro68-build

if [[ $INTERFACES == "universal" ]];
then
    # If the universal RIncludes directory is empty, download and install the universal headers
    if [ ! "$(ls -A $BUILDDIR/toolchain/universal/RIncludes 2> /dev/null)" ]; then
        # If INTERFACESFILE is empty, exit
        if [[ -z $INTERFACESFILE ]];
        then
            echo -n "Universal interfaces not present, please specify the location of a suitable "
            echo "MacBinary DiskCopy image using the INTERFACESFILE environment variable."
            exit 1
        fi

        BASEINTERFACESFILE=`basename $INTERFACESFILE`

        # If INTERFACESFILE is a URL, download it first to TMPDIR. Otherwise assume the file is
        # already present and copy it to TMPDIR for installation
        if [[ $INTERFACESFILE == http* ]];
        then
            echo "Downloading Universal interfaces from MacBinary DiskCopy image $BASEINTERFACESFILE..."
            curl -s $INTERFACESFILE -o $TMPDIR/$BASEINTERFACESFILE
            echo "done"
        else
            if [[ -z $INTERFACESFILE ]];
            then
                echo "Unable to locate universal interfaces file $INTERFACESFILE"
                exit 1
            else
                echo "Using Universal intefaces from MacBinary Diskcopy image $BASEINTERFACESFILE"
                cp $INTERFACESFILE $TMPDIR/$BASEINTERFACESFILE
            fi
        fi

        # Extract the file
        $BUILDDIR/bin/install-universal-interfaces.sh $TMPDIR $BASEINTERFACESFILE

        # Switch to universal
        echo "Linking Universal interfaces..."
        $BUILDDIR/bin/interfaces-and-libraries.sh $BUILDDIR/toolchain $TMPDIR/InterfacesAndLibraries
        echo "done"
    else
        echo "Linking Universal interfaces..."

        # Link to existing universal interfaces
        PREFIX=$BUILDDIR/toolchain
        . "$BUILDDIR/bin/interfaces-and-libraries.sh"
        BUILD_68K=true
        BUILD_PPC=true

        unlinkInterfacesAndLibraries
        linkInterfacesAndLibraries "universal"
        echo "done"
    fi
else
    echo "Using multiversal interfaces"
fi

# Execute command
exec "$@"
