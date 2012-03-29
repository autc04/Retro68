
hfsutils - tools for reading and writing Macintosh HFS volumes
Copyright (C) 1996-1998 Robert Leslie

$Id: README,v 1.10 1998/09/08 18:51:51 rob Exp $

===============================================================================

NOTES ON THIS RELEASE

  This release uses GNU autoconf to automatically configure the software
  for installation and use on your system. This means you should not have
  to modify any files by hand to get the software to compile -- if you do,
  please let the author know so it can be fixed.

  For general installation instructions, please read the `INSTALL' file.

  There are a few special options you can give the `configure' program that
  you should know about:

      --with-tcl            build the Tcl/Tk components
      --with-tk             build the Tk-based X interface `xhfs'
      --disable-cli         do not build or install the command-line utils
      --enable-devlibs      enable installation of the developer libraries

  To build the Tcl tools `hfssh' and `hfs', you must use `--with-tcl'.
  To build the X interface `xhfs', you must use `--with-tcl --with-tk'.

  In order to build the Tcl tools you must have Tcl 7.6 or newer already
  installed on your system. To build the X interface, you must have Tk 4.2
  or newer installed as well.

  If `configure' is unable to locate your Tcl or Tk installation, you will
  have to give it a hint. It looks for the files `tclConfig.sh' and
  `tkConfig.sh' (respectively) which contain all the details about your
  configuration; these files were created when Tcl/Tk was installed on your
  system.

  To help `configure' find these files, you can specify a directory name on
  the command line. For example:

      ./configure --with-tcl=/usr/share/tcl --with-tk=/usr/share/tk

  When in doubt, wait and see if `configure' complains.

  By default, the command-line utilities (hmount, hls, hcopy, etc.) are
  always built and installed. If you don't want them, use `--disable-cli'.

  If you want to install the developer libraries (libhfs.a, librsrc.a, and
  associated header files) as well as the programs, use `--enable-devlibs'.
  The libraries are not installed by default.

  The `INSTALL' file contains the rest of the details you will need to
  compile and install the software. Please read it!

===============================================================================

NOTES ON "SETUID" INSTALLATION

  Although the author has made some effort to make the programs in this
  package somewhat setuid-safe, none are intended to be installed in such a
  manner, and you do so at your own risk!

  Specifically, installing the programs setuid root is a bad idea, as it will
  allow anyone to attempt to open (or format) any file as an HFS volume,
  disregarding the normal UNIX file permission checks.

  A better idea is to modify the permissions on the necessary device files to
  allow access to appropriate users. For example, if you make your floppy
  device group-writable to a special group of floppy users, then only those
  users will be able to access an inserted floppy disk and nothing needs to
  be made setuid.

  Here is an example:

   % ls -l /dev/fd0 /usr/local/bin/xhfs
   brw-rw----   1 root     floppy     2,   0 Sep 17 13:51 /dev/fd0
   -rwxr-xr-x   1 root     staff      339874 Jan 17 20:18 /usr/local/bin/xhfs

   % grep floppy /etc/group
   floppy:*:25:rob,thigpen

  This configuration permits users `rob' and `thigpen' read/write access to
  the floppy device, without needing to make any programs setuid.

  Another possibility is to make some of the programs in this package setgid
  (NOT setuid) to a similar group which has access to the necessary devices.
  This avoids the need to add specific users to a group, since it allows
  anyone to access the devices using the utilities, while still maintaining
  the integrity of the data on the devices since they are not world-writable.
  (A world-writable device lends itself to the possibility that someone may
  corrupt some portion of it by other means and render an HFS volume
  unusable, whereas limiting access only through the utilities means the
  volume is unlikely to be corrupted under normal usage -- although note that
  since HFS itself does not provide any file permission structure, anyone may
  still modify the HFS volume in any way. The only protection here is that
  the modifications must be made in an HFS-compatible way, so that the
  possibility of corruption is reduced.)

  Here is another example:

   % ls -l /dev/fd0 /usr/local/bin/xhfs
   brw-rw----   1 root     floppy     2,   0 Sep 17 13:51 /dev/fd0
   -rwxr-sr-x   1 root     floppy     339874 Jan 17 20:18 /usr/local/bin/xhfs

   % grep floppy /etc/group
   floppy:*:25:

  In this case, only setgid `floppy' programs (such as `/usr/local/bin/xhfs')
  are permitted access to the floppy device.

  To summarize: it is suggested that the utilities NOT be installed setuid or
  setgid. It is possible to install the utilities setgid as described above,
  but it is NOT recommended that the utilities be installed setuid root under
  any circumstances.

===============================================================================

CONTACTING THE AUTHOR

  Please see the `COPYRIGHT' file for copyright and warranty information.

  Send comments, bug reports, suggestions, patches, etc. to:

    * Robert Leslie <rob@mars.org>

  See also the HFS Utilities home page on the Web:

    * http://www.mars.org/home/rob/proj/hfs/

===============================================================================

