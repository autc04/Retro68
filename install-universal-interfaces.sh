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

               # PPC libraries need a resource fork, but the code in
               # interfaces-and-libraries.sh doesn't correctly detect InterfaceLib in
               # Macbinary format. Work around this for now by using Basilisk II format
               # which can be parsed by ResourceFile and still allows the filename
               # detection logic to work.
               if [[ $HFSPATH == *SharedLibraries: ]];
               then
                   if [[ ! -d $UNIXPATH.rsrc ]];
                   then
                       mkdir $UNIXPATH.rsrc
                   fi

                   # First copy as Macbinary
                   hcopy -m $HFSFULLPATH $UNIXFULLPATH.bin

                   # Extract data fork using normal name
                   bash -c "cd $UNIXPATH && macunpack -d $UNIXFULLPATH.bin && mv $UNIXFULLPATH.data $UNIXFULLPATH"

                   # Extract resource fork into .rsrc directory
                   bash -c "cd $UNIXPATH && macunpack -r $UNIXFULLPATH.bin && mv $UNIXFULLPATH.rsrc $UNIXPATH.rsrc/$LINE"

                   # Delete original Macbinary
                   rm -rf $UNIXFULLPATH.bin
               else
                   hcopy -r $HFSFULLPATH $UNIXFULLPATH
               fi
           fi
       fi
    fi
done <<< "$FILES"

# Unmount image
humount
