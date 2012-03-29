#
# hfsutils - tools for reading and writing Macintosh HFS volumes
# Copyright (C) 1996-1998 Robert Leslie
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# $Id: Makefile,v 1.4 1998/04/11 23:40:09 rob Exp $
#

CC =		gcc
LD =		ld
INCLUDES =	-I/usr/src/linux/include -I../../libhfs
DEFINES =	-D__KERNEL__ -DMODULE
LIBS =		

COPTS =		-g #-Wall -Wstrict-prototypes
LDOPTS =	

CFLAGS =	$(COPTS) $(INCLUDES) $(DEFINES)
LDFLAGS =	$(LDOPTS)

###############################################################################

TARGETS =	$(KERNTARGET)

KERNTARGET =	hfs.o
KERNOBJS =	module.o

###############################################################################

all :: $(TARGETS)

again :: clean all

depend ::
	( sed -n '1,/^### DEPEND/p' Makefile;  \
	  echo;  \
	  $(CC) -MM $(INCLUDES) $(DEFINES) *.c;  \
	) > Makefile.new
	mv -f Makefile.new Makefile

clean ::
	rm -f $(TARGETS) *.o gmon.* core

###############################################################################

$(KERNTARGET): $(KERNOBJS)
	$(LD) -r -o $@ $(KERNOBJS)

### DEPENDENCIES FOLLOW #######################################################

module.o: module.c ../../libhfs/libhfs.h ../../libhfs/hfs.h \
 ../../libhfs/apple.h
