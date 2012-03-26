## Process this file with automake to generate Makefile.in

AUTOMAKE_OPTIONS = 1.11 dejagnu foreign no-dist
ACLOCAL_AMFLAGS = -I .. -I ../config -I ../bfd

SUBDIRS = doc po

tooldir = $(exec_prefix)/$(target_alias)

YACC = `if [ -f ../bison/bison ] ; then echo ../bison/bison -y -L../bison/bison ; else echo @YACC@ ; fi`
LEX = `if [ -f ../flex/flex ] ; then echo ../flex/flex ; else echo @LEX@ ; fi`

# Automake 1.10+ disables lex and yacc output file regeneration if
# maintainer mode is disabled.  Avoid this.
am__skiplex =
am__skipyacc =

WARN_CFLAGS = @WARN_CFLAGS@
NO_WERROR = @NO_WERROR@
AM_CFLAGS = $(WARN_CFLAGS)

TARG_CPU = @target_cpu_type@
TARG_CPU_C = $(srcdir)/config/tc-@target_cpu_type@.c
TARG_CPU_O = tc-@target_cpu_type@.o
TARG_CPU_H = $(srcdir)/config/tc-@target_cpu_type@.h
OBJ_FORMAT_C = $(srcdir)/config/obj-@obj_format@.c
OBJ_FORMAT_O = obj-@obj_format@.o
OBJ_FORMAT_H = $(srcdir)/config/obj-@obj_format@.h
TARG_ENV_H = $(srcdir)/config/te-@te_file@.h
ATOF_TARG_C = $(srcdir)/config/atof-@atof@.c
ATOF_TARG_O = atof-@atof@.o

# use @target_cpu_type@ for refering to configured target name
IT_HDRS=itbl-parse.h $(srcdir)/itbl-ops.h
IT_SRCS=itbl-parse.c itbl-lex.c $(srcdir)/itbl-ops.c
IT_DEPS=$(srcdir)/itbl-parse.y $(srcdir)/itbl-lex.l $(srcdir)/config/itbl-@target_cpu_type@.h
IT_OBJS=itbl-parse.o itbl-lex.o itbl-ops.o

# CPU types.  This is only used for dependency information.

CPU_TYPES = \
	alpha \
	arc \
	arm \
	avr \
	bfin \
	cr16 \
	cris \
	crx \
	d10v \
	d30v \
	dlx \
	fr30 \
	frv \
	h8300 \
	hppa \
	i370 \
	i386 \
	i860 \
	i960 \
	ia64 \
	ip2k \
	lm32 \
	m32c \
	m32r \
	m68hc11 \
	m68k \
	maxq \
	mcore \
	mep \
	microblaze \
	mips \
	mmix \
	mn10200 \
	mn10300 \
	msp430 \
	mt \
	ns32k \
	openrisc \
	or32 \
	pdp11 \
	pj \
	ppc \
	s390 \
	score \
	sh \
	sh64 \
	sparc \
	spu \
	tic30 \
	tic4x \
	tic54x \
	v850 \
	vax \
	xc16x \
	xstormy16 \
	xtensa \
	z80 \
	z8k

# Object format types.  This is only used for dependency information.
# We deliberately omit SOM, since it does not work as a cross assembler.

OBJ_FORMATS = \
	aout \
	coff \
	ecoff \
	elf \
	evax \
	macho

# This is an sh case which sets valid according to whether the CPU
# type in the shell variable c and the OS type in the shell variable o
# are supported.  This helps cuts down on the amount of dependency
# information.

CPU_OBJ_VALID = \
	valid= ; \
	case $$o in \
	aout) \
	  case $$c in \
	  arm | cris | i386 | m68k | ns32k | pdp11 | sparc | tic30 | vax) \
	    valid=yes ;; \
	  esac ;; \
	coff) \
	  case $$c in \
	  arm | h8300 | i386 | i960 | m68k | maxq | mcore | mips | or32 \
		| ppc | sh | sparc | tic* | xscale | z80 | z8k) \
	    valid=yes ;; \
	  esac ;; \
	ecoff) \
	  case $$c in \
	  mips | alpha) valid=yes ;; \
	  esac ;; \
	elf) valid=yes ; \
	  case $$c in \
	  maxq | ns32k | tic* | z80 | z8k) valid= ;; \
	  esac ;; \
	evax) \
	  case $$c in \
	  alpha) valid=yes ;; \
	  esac ;; \
	macho) \
	  case $$c in \
	  i386) valid=yes ;; \
	  esac ;; \
	vms) \
	  case $$c in \
	  vax) valid=yes ;; \
	  esac ;; \
	esac;

# These are like CPU_TYPES and CPU_OBJ_VALID, for the obj=multi case.

MULTI_CPU_TYPES = i386 mips cris

MULTI_CPU_OBJ_VALID = \
	valid= ; \
	case $$o in \
	aout) \
	  case $$c in \
	  i386 | cris) valid=yes ;; \
	  esac ;; \
	coff) \
	  case $$c in \
	  i386 | mips) valid=yes ;; \
	  esac ;; \
	ecoff) \
	  case $$c in \
	  mips) valid=yes ;; \
	  esac ;; \
	elf) valid=yes ;; \
	esac;

# Regular source files.

GAS_CFILES = \
	app.c \
	as.c \
	atof-generic.c \
	cond.c \
	depend.c \
	dwarf2dbg.c \
	dw2gencfi.c \
	ecoff.c \
	ehopt.c \
	expr.c \
	flonum-copy.c \
	flonum-konst.c \
	flonum-mult.c \
	frags.c \
	hash.c \
	input-file.c \
	input-scrub.c \
	listing.c \
	literal.c \
	macro.c \
	messages.c \
	output-file.c \
	read.c \
	remap.c \
	sb.c \
	stabs.c \
	subsegs.c \
	symbols.c \
	write.c

CFILES = $(GAS_CFILES) itbl-ops.c cgen.c

HFILES = \
	as.h \
	asintl.h \
	bignum.h \
	bit_fix.h \
	cgen.h \
	dwarf2dbg.h \
	dw2gencfi.h \
	ecoff.h \
	emul-target.h \
	emul.h \
	expr.h \
	flonum.h \
	frags.h \
	hash.h \
	input-file.h \
	itbl-lex.h \
	itbl-ops.h \
	listing.h \
	macro.h \
	obj.h \
	output-file.h \
	read.h \
	sb.h \
	struc-symbol.h \
	subsegs.h \
	symbols.h \
	tc.h \
	write.h

# CPU files in config.

TARGET_CPU_CFILES = \
	config/tc-alpha.c \
	config/tc-arc.c \
	config/tc-arm.c \
	config/tc-avr.c \
	config/tc-bfin.c \
	config/tc-cr16.c \
	config/tc-cris.c \
	config/tc-crx.c \
	config/tc-d10v.c \
	config/tc-d30v.c \
	config/tc-dlx.c \
	config/tc-fr30.c \
	config/tc-frv.c \
	config/tc-h8300.c \
	config/tc-hppa.c \
	config/tc-ia64.c \
	config/tc-i370.c \
	config/tc-i386.c \
	config/tc-i860.c \
	config/tc-i960.c \
	config/tc-ip2k.c \
	config/tc-iq2000.c \
	config/tc-lm32.c \
	config/tc-m32c.c \
	config/tc-m32r.c \
	config/tc-m68hc11.c \
	config/tc-m68k.c \
	config/tc-maxq.c \
	config/tc-mcore.c \
	config/tc-mep.c \
	config/tc-microblaze.c \
	config/tc-mips.c \
	config/tc-mmix.c \
	config/tc-mn10200.c \
	config/tc-mn10300.c \
	config/tc-moxie.c \
	config/tc-msp430.c \
	config/tc-mt.c \
	config/tc-ns32k.c \
	config/tc-openrisc.c \
	config/tc-or32.c \
	config/tc-pdp11.c \
	config/tc-pj.c \
	config/tc-ppc.c \
	config/tc-s390.c \
	config/tc-score.c \
	config/tc-sh.c \
	config/tc-sh64.c \
	config/tc-sparc.c \
	config/tc-spu.c \
	config/tc-tic30.c \
	config/tc-tic4x.c \
	config/tc-tic54x.c \
	config/tc-vax.c \
	config/tc-v850.c \
	config/tc-xstormy16.c \
	config/tc-xc16x.c \
	config/tc-xtensa.c \
	config/tc-z80.c \
	config/tc-z8k.c \
	config/xtensa-relax.c

TARGET_CPU_HFILES = \
	config/tc-alpha.h \
	config/tc-arc.h \
	config/tc-arm.h \
	config/tc-avr.h \
	config/tc-bfin.h \
	config/tc-cr16.h \
	config/tc-cris.h \
	config/tc-crx.h \
	config/tc-d10v.h \
	config/tc-d30v.h \
	config/tc-dlx.h \
	config/tc-fr30.h \
	config/tc-frv.h \
	config/tc-h8300.h \
	config/tc-hppa.h \
	config/tc-ia64.h \
	config/tc-i370.h \
	config/tc-i386.h \
	config/tc-i860.h \
	config/tc-i960.h \
	config/tc-ip2k.h \
	config/tc-iq2000.h \
	config/tc-lm32.h \
	config/tc-m32c.h \
	config/tc-m32r.h \
	config/tc-m68hc11.h \
	config/tc-m68k.h \
	config/tc-maxq.h \
	config/tc-mcore.h \
	config/tc-mep.h \
	config/tc-microblaze.h \
	config/tc-mips.h \
	config/tc-mmix.h \
	config/tc-mn10200.h \
	config/tc-mn10300.h \
	config/tc-msp430.h \
	config/tc-mt.h \
	config/tc-ns32k.h \
	config/tc-openrisc.h \
	config/tc-or32.h \
	config/tc-pdp11.h \
	config/tc-pj.h \
	config/tc-ppc.h \
	config/tc-s390.h \
	config/tc-score.h \
	config/tc-sh.h \
	config/tc-sh64.h \
	config/tc-sparc.h \
	config/tc-spu.h \
	config/tc-tic30.h \
	config/tc-tic4x.h \
	config/tc-tic54x.h \
	config/tc-vax.h \
	config/tc-v850.h \
	config/tc-xstormy16.h \
	config/tc-xc16x.h \
	config/tc-xtensa.h \
	config/tc-z80.h \
	config/tc-z8k.h \
	config/xtensa-relax.h

# OBJ files in config

OBJ_FORMAT_CFILES = \
	config/obj-aout.c \
	config/obj-coff.c \
	config/obj-ecoff.c \
	config/obj-elf.c \
	config/obj-evax.c \
	config/obj-fdpicelf.c \
	config/obj-macho.c \
	config/obj-multi.c \
	config/obj-som.c

OBJ_FORMAT_HFILES = \
	config/obj-aout.h \
	config/obj-coff.h \
	config/obj-ecoff.h \
	config/obj-elf.h \
	config/obj-evax.h \
	config/obj-fdpicelf.h \
	config/obj-macho.h \
	config/obj-multi.h \
	config/obj-som.h

# Emulation header files in config

TARG_ENV_HFILES = \
	config/te-386bsd.h \
	config/te-aix5.h \
	config/te-armeabi.h \
	config/te-armlinuxeabi.h \
	config/te-dynix.h \
	config/te-epoc-pe.h \
	config/te-freebsd.h \
	config/te-generic.h \
	config/te-gnu.h \
	config/te-go32.h \
	config/te-hppa.h \
	config/te-hppa64.h \
	config/te-hppalinux64.h \
	config/te-i386aix.h \
	config/te-ia64aix.h \
	config/te-interix.h \
	config/te-lnews.h \
	config/te-lynx.h \
	config/te-mach.h \
	config/te-macos.h \
	config/te-nbsd.h \
	config/te-nbsd532.h \
	config/te-netware.h \
	config/te-pc532mach.h \
	config/te-pe.h \
	config/te-psos.h \
	config/te-riscix.h \
	config/te-solaris.h \
	config/te-sparcaout.h \
	config/te-sun3.h \
	config/te-svr4.h \
	config/te-symbian.h \
	config/te-tmips.h \
	config/te-vxworks.h \
	config/te-wince-pe.h

TARG_ENV_CFILES = \
	config/te-vms.c

# Multi files in config

MULTI_CFILES = \
	config/e-crisaout.c \
	config/e-criself.c \
	config/e-i386aout.c \
	config/e-i386coff.c \
	config/e-i386elf.c \
	config/e-mipsecoff.c \
	config/e-mipself.c

CONFIG_OBJS = \
	$(TARG_CPU_O) \
	$(OBJ_FORMAT_O) \
	$(ATOF_TARG_O) \
	$(extra_objects)

GENERIC_OBJS = \
	app.o \
	as.o \
	atof-generic.o \
	cond.o \
	depend.o \
	dwarf2dbg.o \
	dw2gencfi.o \
	ehopt.o \
	expr.o \
	flonum-konst.o \
	flonum-copy.o \
	flonum-mult.o \
	frags.o \
	hash.o \
	input-file.o \
	input-scrub.o \
	literal.o \
	messages.o \
	output-file.o \
	read.o \
	remap.o \
	subsegs.o \
	symbols.o \
	write.o \
	listing.o \
	ecoff.o \
	stabs.o \
	sb.o \
	macro.o

CONFIG_ATOF_CFILES = \
	config/atof-ieee.c \
	config/atof-vax.c

OBJS = $(CONFIG_OBJS) $(GENERIC_OBJS)

POTFILES = $(MULTI_CFILES) $(CONFIG_ATOF_CFILES) \
	$(TARG_ENV_HFILES) $(TARG_ENV_CFILES) $(OBJ_FORMAT_HFILES) \
	$(OBJ_FORMAT_CFILES) $(TARGET_CPU_HFILES) $(TARGET_CPU_CFILES) \
	$(HFILES) $(CFILES)
po/POTFILES.in: @MAINT@ Makefile
	for f in $(POTFILES); do echo $$f; done | LC_ALL=C sort > tmp \
	  && mv tmp $(srcdir)/po/POTFILES.in

# Note: GASP is now deprecated and has been removed.  It is still
# available in the CVS archive or older binutils releases if it is needed.
noinst_PROGRAMS = as-new
noinst_SCRIPTS = $(GDBINIT)
EXTRA_SCRIPTS = .gdbinit

EXTRA_DIST = m68k-parse.c itbl-parse.c itbl-parse.h itbl-lex.c \
	bfin-parse.c bfin-parse.h bfin-lex.c

diststuff: $(EXTRA_DIST) info

DISTCLEANFILES = targ-cpu.h obj-format.h targ-env.h itbl-cpu.h cgen-desc.h

# Now figure out from those variables how to compile and link.

BASEDIR = $(srcdir)/..
BFDDIR = $(BASEDIR)/bfd
INCDIR = $(BASEDIR)/include

# This is the variable actually used when we compile.
# Specify the directories to be searched for header files.
# Both . and srcdir are used, in that order,
# so that tm.h and config.h will be found in the compilation
# subdirectory rather than in the source directory.
AM_CPPFLAGS = -I. -I$(srcdir) -I../bfd -I$(srcdir)/config \
	-I$(INCDIR) -I$(srcdir)/.. -I$(BFDDIR) @INCINTL@ \
	-DLOCALEDIR="\"$(datadir)/locale\""

# How to link with both our special library facilities
# and the system's installed libraries.

GASLIBS = @OPCODES_LIB@ ../bfd/libbfd.la ../libiberty/libiberty.a

# Files to be copied away after each stage in building.
STAGESTUFF = *.o $(noinst_PROGRAMS)

as_new_SOURCES = $(GAS_CFILES)
as_new_LDADD = $(TARG_CPU_O) $(OBJ_FORMAT_O) $(ATOF_TARG_O) \
	$(extra_objects) $(GASLIBS) $(LIBINTL) $(LIBM)
as_new_DEPENDENCIES = $(TARG_CPU_O) $(OBJ_FORMAT_O) $(ATOF_TARG_O) \
	$(extra_objects) $(GASLIBS) $(LIBINTL_DEP)
EXTRA_as_new_SOURCES = $(CFILES) $(HFILES) $(TARGET_CPU_CFILES) \
	$(TARGET_CPU_HFILES) $(OBJ_FORMAT_CFILES) $(OBJ_FORMAT_HFILES) \
	$(TARG_ENV_CFILES) $(CONFIG_ATOF_CFILES) $(MULTI_CFILES)

EXPECT = expect
RUNTEST = runtest
RUNTESTFLAGS=

check-DEJAGNU: site.exp
	if [ -d testsuite ]; then \
	  true; \
	else \
	  mkdir testsuite; \
	fi
	rm -f testsuite/site.exp
	cp site.exp testsuite/site.exp
	rootme=`pwd`; export rootme; \
	srcdir=`cd ${srcdir}; pwd` ; export srcdir ; \
	EXPECT=${EXPECT} ; export EXPECT ; \
	runtest=$(RUNTEST); \
	cd testsuite; \
	if $(SHELL) -c "$$runtest --version" > /dev/null 2>&1; then \
	  $$runtest --tool $(DEJATOOL) --srcdir $${srcdir}/testsuite \
		$(RUNTESTFLAGS); \
	else echo "WARNING: could not find \`runtest'" 1>&2; :;\
	fi

# The m68k operand parser.

EXTRA_as_new_SOURCES += config/m68k-parse.y config/bfin-parse.y

# If m68k-parse.y is in a different directory, then ylwrap will use an
# absolute path when it invokes yacc, which will cause yacc to put the
# absolute path into the generated file.  That's a pain when it comes
# to generating snapshots, because it introduces spurious diffs.
# Since when we make the snapshots $(srcdir) = ".", we check for that
# case and handle it differently.  This means that anybody who
# configures with $(srcdir) = "." will have to set their path in the
# debugger if they want to debug m68k-parse.y.  This is bad, but on
# the other hand it's good that people who use the prebuilt
# m68k-parse.c don't get a spurious absolute path.
m68k-parse.c: $(srcdir)/config/m68k-parse.y
	f=$(srcdir)/config/m68k-parse.y; \
	if [ $$f = "./config/m68k-parse.y" ]; then \
	  ln -s config/m68k-parse.y . > /dev/null 2>/dev/null || \
	   ln config/m68k-parse.y . > /dev/null 2>/dev/null || \
	   cp config/m68k-parse.y . >/dev/null 2>/dev/null; \
	  f=m68k-parse.y; \
	else true; fi; \
	$(SHELL) $(YLWRAP) $$f y.tab.c m68k-parse.c -- $(YACCCOMPILE); \
	if [ $$f = "m68k-parse.y" ]; then \
	  rm -f m68k-parse.y; \
	else true; fi
# Disable -Werror, if it has been enabled, since old versions of bison/
# yacc will produce working code which contain compile time warnings.
m68k-parse.o: m68k-parse.c
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `test -f m68k-parse.c || echo $(srcdir)/`m68k-parse.c $(NO_WERROR)
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='m68k-parse.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -c `test -f m68k-parse.c || echo $(srcdir)/`m68k-parse.c $(NO_WERROR)
endif

# Don't let the .y.h rule clobber m68k-parse.h.
m68k-parse.h: ; @true
$(srcdir)/config/m68k-parse.h: ; @true

bfin-parse.c: $(srcdir)/config/bfin-parse.y
	$(SHELL) $(YLWRAP) $(srcdir)/config/bfin-parse.y y.tab.c bfin-parse.c y.tab.h bfin-parse.h -- $(YACCCOMPILE) -d ;
bfin-parse.h: bfin-parse.c
bfin-parse.o: bfin-parse.c \
 $(srcdir)/config/bfin-aux.h $(srcdir)/config/bfin-defs.h \
 $(INCDIR)/elf/common.h $(INCDIR)/elf/bfin.h $(BFDDIR)/libbfd.h

bfin-parse.h: ; @true
$(srcdir)/config/bfin-parse.h: ; @true

bfin-lex.c: $(srcdir)/config/bfin-lex.l
	$(SHELL) $(YLWRAP) $(srcdir)/config/bfin-lex.l lex.yy.c bfin-lex.c -- $(LEXCOMPILE)
bfin-lex.o: bfin-lex.c bfin-parse.h $(srcdir)/config/bfin-defs.h
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `test -f bfin-lex.c || echo $(srcdir)/`bfin-lex.c $(NO_WERROR)
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='bfin-lex.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -c `test -f bfin-lex.c || echo $(srcdir)/`bfin-lex.c $(NO_WERROR)
endif

# The instruction table specification lexical analyzer and parser.

# Disable -Werror, if it has been enabled, since old versions of bison/
# yacc will produce working code which contain compile time warnings.
itbl-lex.o: itbl-lex.c itbl-parse.h
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `test -f itbl-lex.c || echo $(srcdir)/`itbl-lex.c $(NO_WERROR)
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='itbl-lex.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -c `test -f itbl-lex.c || echo $(srcdir)/`itbl-lex.c $(NO_WERROR)
endif

# Disable -Werror, if it has been enabled, since old versions of bison/
# yacc will produce working code which contain compile time warnings.
itbl-parse.o: itbl-parse.c
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `test -f itbl-parse.c || echo $(srcdir)/`itbl-parse.c $(NO_WERROR)
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='itbl-parse.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -c `test -f itbl-parse.c || echo $(srcdir)/`itbl-parse.c $(NO_WERROR)
endif

itbl-parse.c: $(srcdir)/itbl-parse.y
	$(SHELL) $(YLWRAP) $(srcdir)/itbl-parse.y y.tab.c itbl-parse.c y.tab.h itbl-parse.h -- $(YACCCOMPILE) -d

itbl-parse.h: itbl-parse.c ; @true

itbl-ops.o: itbl-parse.h

# stand-alone itbl assembler & disassembler

EXTRA_PROGRAMS = itbl-test
itbl_test_SOURCES = itbl-parse.y itbl-lex.l
itbl_test_LDADD = itbl-tops.o itbl-test.o $(GASLIBS) @LEXLIB@

itbl-tops.o: itbl-ops.c itbl-parse.h
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -o $@ -c -DSTAND_ALONE $(srcdir)/itbl-ops.c
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='itbl-ops.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -o $@ -DSTAND_ALONE -c $(srcdir)/itbl-ops.c
endif

itbl-test.o: $(srcdir)/testsuite/gas/all/itbl-test.c
if am__fastdepCC
	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ -DSTAND_ALONE $(srcdir)/testsuite/gas/all/itbl-test.c
	mv -f $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
else
if AMDEP
	source='itbl-test.c' object='$@' libtool=no @AMDEPBACKSLASH@
	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
endif
	$(COMPILE) -c -DSTAND_ALONE $(srcdir)/testsuite/gas/all/itbl-test.c
endif

# CGEN interface.

CGEN_CPU_PREFIX = @cgen_cpu_prefix@

cgen.o: cgen.c cgen.h cgen-desc.h subsegs.h \
	$(INCDIR)/obstack.h $(INCDIR)/opcode/cgen.h \
	$(srcdir)/../opcodes/$(CGEN_CPU_PREFIX)-desc.h \
	$(srcdir)/../opcodes/$(CGEN_CPU_PREFIX)-opc.h

# Remake the info files.

MOSTLYCLEANFILES = $(STAGESTUFF) core \
	testsuite/*.o testsuite/*.out testsuite/gas.log testsuite/gas.sum \
	testsuite/site.exp site.bak site.exp stage stage1 stage2

.PHONY: install-exec-local install-data-local
.PHONY: install-exec-bindir install-exec-tooldir

install-exec-local: install-exec-bindir @install_tooldir@

install-exec-bindir: $(noinst_PROGRAMS)
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	@list='$(noinst_PROGRAMS)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(bindir)/`echo $$p|sed -e 's/$(EXEEXT)$$//' -e 's/-new//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
	    $(LIBTOOL)  --mode=install $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed -e 's/$(EXEEXT)$$//' -e 's/-new//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	  else :; fi; \
	done

install-exec-tooldir: install-exec-bindir $(noinst_PROGRAMS)
	$(mkinstalldirs) $(DESTDIR)$(tooldir)/bin
	n=`echo as | sed '$(transform)'`; \
	if [ "$(bindir)/$$n$(EXEEXT)" != "$(tooldir)/bin/as$(EXEEXT)" ]; then \
	  rm -f $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
	  ln $(DESTDIR)$(bindir)/$$n$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT) >/dev/null 2>/dev/null \
	    || $(LIBTOOL) --mode=install $(INSTALL_PROGRAM) as-new$(EXEEXT) $(DESTDIR)$(tooldir)/bin/as$(EXEEXT); \
	else \
	  true ; \
	fi

# These exist for maintenance purposes.

.PHONY: bootstrap bootstrap2 bootstrap3 stage1 stage2 stage3 comparison

bootstrap: as-new
	$(MAKE) stage1
	rm -f stage && ln -s stage1 stage
	$(MAKE) CC="$(CC)" CFLAGS="-O -Bstage/ $(CFLAGS)" libdir=$(libdir) ALLOCA= $(noinst_PROGRAMS)
	$(MAKE) stage2
	rm -f stage && ln -s stage2 stage
	$(MAKE) CC="$(CC)" CFLAGS="-O -Bstage/ $(CFLAGS)" libdir=$(libdir) ALLOCA= $(noinst_PROGRAMS)
	$(MAKE) comparison against=stage2

bootstrap2:
	rm -f stage && ln -s stage1 stage
	$(MAKE) CC="$(CC)" CFLAGS="-O -Bstage/ $(CFLAGS)" libdir=$(libdir) ALLOCA= $(noinst_PROGRAMS)
	$(MAKE) stage2
	rm -f stage && ln -s stage2 stage
	$(MAKE) CC="$(CC)" CFLAGS="-O -Bstage/ $(CFLAGS)" libdir=$(libdir) ALLOCA= $(noinst_PROGRAMS)
	$(MAKE) comparison against=stage2

bootstrap3:
	rm -f stage && ln -s stage2 stage
	$(MAKE) CC="$(CC)" CFLAGS="-O -Bstage/ $(CFLAGS)" libdir=$(libdir) ALLOCA= $(noinst_PROGRAMS)
	$(MAKE) comparison against=stage2

# Copy the object files from a particular stage into a subdirectory.
stage1:
	-mkdir stage1
	-mv $(STAGESTUFF) stage1
	if [ -f stage1/as-new$(EXEEXT) -a ! -f stage1/as$(EXEEXT) ] ; then (cd stage1 ; ln -s as-new$(EXEEXT) as$(EXEEXT)) ; fi

stage2:
	-mkdir stage2
	-mv $(STAGESTUFF) stage2
	if [ -f stage2/as-new$(EXEEXT) -a ! -f stage2/as$(EXEEXT) ] ; then (cd stage2 ; ln -s as-new$(EXEEXT) as$(EXEEXT)) ; fi

stage3:
	-mkdir stage3
	-mv $(STAGESTUFF) stage3
	if [ -f stage3/as-new$(EXEEXT) -a ! -f stage3/as$(EXEEXT) ] ; then (cd stage3 ; ln -s as-new as$(EXEEXT)) ; fi

against=stage2

# This rule is derived from corresponding code in the Makefile.in for gcc.
# The "tail +16c" is to bypass headers which may include timestamps or
# temporary assembly file names.
comparison:
	x=0 ; \
	for file in *.o ; do \
	  tail +16c ./$$file > tmp-foo1; \
	  if tail +16c ${against}/$$file > tmp-foo2 2>/dev/null ; then \
	    if cmp tmp-foo1 tmp-foo2 ; then \
	      true ; \
	    else \
	      echo $$file differs ; \
	      x=1 ; \
	    fi ; \
	  else true; fi ; \
	done ; \
	exit $$x
	-rm -f tmp-foo*

.PHONY: de-stage1 de-stage2 de-stage3

de-stage1:
	- (cd stage1 ; rm -f as$(EXEEXT) ; mv -f * ..)
	- rmdir stage1

de-stage2:
	- (cd stage2 ; rm -f as$(EXEEXT) ; mv -f * ..)
	- rmdir stage2

de-stage3:
	- (cd stage3 ; rm -f as$(EXEEXT) ; mv -f * ..)
	- rmdir stage3

CONFIG_STATUS_DEPENDENCIES = $(BFDDIR)/configure.in $(srcdir)/configure.tgt
