#!/bin/bash

#
# install-universal-interfaces.sh
#
# Optionally download and attempt to install the universal interfaces from
# a Macbinary disk image containing the Interfaces&Libraries directory
#
# Usage:
#    install-universal-interfaces.sh <tempdir> <filename>
#
# Decompress the Macbinary image at <tempdir>/<filename> into
# <tempdir>/InterfacesAndLibraries in the correct format for
# interfaces-and-libraries.sh.
#

set -e

TMPDIR=$1
FILENAME=$2

if [[ ! -f $TMPDIR/$FILENAME ]];
then
    echo "$TMPDIR/$FILENAME not found"
    exit 1
fi

echo "Decompressing $FILENAME..."
ConvertDiskImage $TMPDIR/$FILENAME $TMPDIR/$FILENAME.img
echo "Decompression complete"

# Copy over Interfaces&Libraries files
echo "Copying Interfaces&Libraries files..."
hmount $TMPDIR/$FILENAME.img

# Find Interfaces&Libraries directory, get recursive directory listing
HFSINTERFACESANDLIBSDIR=`hls -R | grep 'Interfaces&Libraries:$'`
IFS="$(printf '\n')"
echo "Found Interfaces&Libraries at $HFSINTERFACESANDLIBSDIR"
FILES=`hls -FR1 $HFSINTERFACESANDLIBSDIR`

UNIXINTERFACESANDLIBSDIR=$TMPDIR/InterfacesAndLibraries
mkdir -p $UNIXINTERFACESANDLIBSDIR

# Parse results: first line is the HFS path, following lines contain one file
# per line terminated by an empty line
while IFS= read -r LINE; do
    if [[ $LINE == :* ]];
    then
       # If it starts with : then it is a HFS path
       HFSPATH=$LINE
       UNIXRELPATH=$(echo "$HFSPATH" | sed "s#$HFSINTERFACESANDLIBSDIR##g" | sed "s#:#/"#g)
       UNIXPATH="$UNIXINTERFACESANDLIBSDIR/$UNIXRELPATH"

       # Make UNIX directory
       mkdir -p $UNIXPATH
    else
       # If it ends with : it is a directory so ignore (we will find it during the descent)
       if [[ ! $LINE == *: ]];
       then
           # If it isn't empty, it must be a filename
           if [[ ! -z $LINE ]];
           then
               HFSFULLPATH="$HFSPATH$LINE"
               UNIXFULLPATH="$UNIXPATH$LINE"

               echo "Copying $HFSFULLPATH to $UNIXFULLPATH"
               if [[ $HFSPATH == *SharedLibraries: ]];
               then
                   # interfaces-and-libraries.sh can detect and use PPC libraries in
                   # MacBinary format
                   hcopy -m $HFSFULLPATH $UNIXFULLPATH.bin
               else
                   # Otherwise copy files in raw format
                   hcopy -r $HFSFULLPATH $UNIXFULLPATH
               fi
           fi
       fi
    fi
done <<< "$FILES"

# Unmount image
humount
