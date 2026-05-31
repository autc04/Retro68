# Process this file with automake to generate Makefile.in

AUTOMAKE_OPTIONS = foreign

GPROF = ../gprof$(EXEEXT)

# NB: -O2 -fno-omit-frame-pointer is needed for expected call graph.  See
# https://sourceware.org/bugzilla/show_bug.cgi?id=32768
# -g is needed for line number info checked by tst-gmon-gprof-l.sh.  See
# https://sourceware.org/bugzilla/show_bug.cgi?id=32779
GPROF_FLAGS = -O2 -fno-omit-frame-pointer -pg -g

COMPILE = $(CC) $(AM_CFLAGS) $(GPROF_FLAGS)
LINK = $(CC) $(AM_CFLAGS) $(GPROF_FLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@

# We will add to these later, for each individual test.  Note
# that we add each test under check_SCRIPTS;
# the TESTS variable is automatically populated from these.
check_SCRIPTS =
check_DATA =
MOSTLYCLEANFILES =

TESTS = $(check_SCRIPTS)

if NATIVE

check_SCRIPTS += tst-gmon-gprof.sh

check_DATA += tst-gmon-gprof.out
MOSTLYCLEANFILES += tst-gmon.$(OBJEXT) tst-gmon$(EXEEXT) gmon.out
tst-gmon.$(OBJEXT): tst-gmon.c
	$(COMPILE) -c -o $@ $<
tst-gmon: tst-gmon.$(OBJEXT)
	$(LINK) tst-gmon.$(OBJEXT)
tst-gmon-gprof.out: tst-gmon$(EXEEXT) $(GPROF)
	$(srcdir)/tst-gmon-gprof.sh $(GPROF) tst-gmon$(EXEEXT)

check_SCRIPTS += tst-gmon-gprof-l.sh
check_DATA += tst-gmon-gprof-l.out
# Run tst-gmon-gprof-l.sh after tst-gmon-gprof.sh to avoid the race
# condition since they both generate gmon.out.
tst-gmon-gprof-l.out: tst-gmon$(EXEEXT) $(GPROF) tst-gmon-gprof.out
	$(srcdir)/tst-gmon-gprof-l.sh $(GPROF) tst-gmon$(EXEEXT)

endif NATIVE
