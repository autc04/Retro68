# Process this file with automake to generate Makefile.in

# As far as I can tell automake testing support assumes that the build
# system and the host system are the same.  So these tests will not
# work when building with a cross-compiler.

# Ignore warning about AM_PROG_CC_C_O due to large_CFLAGS
AUTOMAKE_OPTIONS = foreign -Wno-portability

# The two_file_test tests -fmerge-constants, so we simply always turn
# it on.  This may need to be controlled by a configure option
# eventually.
AM_CFLAGS = $(WARN_CFLAGS) $(LFS_CFLAGS) -fmerge-constants
AM_CXXFLAGS = $(WARN_CXXFLAGS) $(LFS_CFLAGS) -fmerge-constants

AM_CPPFLAGS = \
	-I$(srcdir) -I$(srcdir)/.. -I$(srcdir)/../../include \
	-I$(srcdir)/../../elfcpp -I.. \
	-DLOCALEDIR="\"$(datadir)/locale\"" \
	@INCINTL@

TEST_READELF = $(top_builddir)/../binutils/readelf
TEST_OBJDUMP = $(top_builddir)/../binutils/objdump
TEST_CXXFILT = $(top_builddir)/../binutils/cxxfilt
TEST_STRIP = $(top_builddir)/../binutils/strip-new
TEST_AR = $(top_builddir)/../binutils/ar
TEST_NM = $(top_builddir)/../binutils/nm-new
TEST_AS = $(top_builddir)/../gas/as-new

if PLUGINS
LIBDL = -ldl
endif

if THREADS
THREADSLIB = -lpthread
endif

if OMP_SUPPORT
TLS_TEST_C_CFLAGS = -fopenmp
endif

# 'make clean' is good about deleting some intermediate files (such as
# .o's), but not all of them (such as .so's and .err files).  We
# improve on that here.  automake-1.9 info docs say "mostlyclean" is
# the right choice for files 'make' builds that people rebuild.
MOSTLYCLEANFILES = *.so *.syms *.stdout


# We will add to these later, for each individual test.  Note
# that we add each test under check_SCRIPTS or check_PROGRAMS;
# the TESTS variable is automatically populated from these.
check_SCRIPTS =
check_DATA =
check_PROGRAMS =
BUILT_SOURCES =

TESTS = $(check_SCRIPTS) $(check_PROGRAMS)

# ---------------------------------------------------------------------
# These tests test the internals of gold (unittests).

# Infrastucture needed for the unittests
check_LIBRARIES = libgoldtest.a
libgoldtest_a_SOURCES = test.cc testmain.cc testfile.cc

DEPENDENCIES = \
	libgoldtest.a ../libgold.a ../../libiberty/libiberty.a $(LIBINTL_DEP)
LDADD = libgoldtest.a ../libgold.a ../../libiberty/libiberty.a $(LIBINTL) \
	$(THREADSLIB) $(LIBDL)


# The unittests themselves
check_PROGRAMS += object_unittest
object_unittest_SOURCES = object_unittest.cc

check_PROGRAMS += binary_unittest
binary_unittest_SOURCES = binary_unittest.cc


# ---------------------------------------------------------------------
# These tests test the output of gold (end-to-end tests).  In
# particular, they make sure that gold can link "difficult" object
# files, and the resulting object files run correctly.  These can only
# run if we've built ld-new for the native architecture (that is,
# we're not cross-compiling it), since we run ld-new as part of these
# tests.  We use the gcc-specific flag '-B' to use our linker instead
# of the default linker, which is why we only run our tests under gcc.

if NATIVE_LINKER
if GCC

# Infrastucture needed for the unittests: a directory where the linker
# is named 'ld'.  This is because the -B flag appends 'ld' to its arg.
gcctestdir/ld: ../ld-new
	test -d gcctestdir || mkdir -p gcctestdir
	rm -f gcctestdir/ld
	(cd gcctestdir && $(LN_S) ../../ld-new ld)

# Each of these .o's is a useful, small complete program.  They're
# particularly useful for making sure ld-new's flags do what they're
# supposed to (hence their names), but are used for many tests that
# don't actually involve analyzing input data.
flagstest_debug.o: constructor_test.cc
	$(CXXCOMPILE) -O0 -g -c -o $@ $<
flagstest_ndebug.o: constructor_test.cc
	$(CXXCOMPILE) -O0 -c -o $@ $<


check_SCRIPTS += gc_comdat_test.sh
check_DATA += gc_comdat_test.stdout
MOSTLYCLEANFILES += gc_comdat_test
gc_comdat_test_1.o: gc_comdat_test_1.cc 
	$(CXXCOMPILE) -O0 -c -ffunction-sections -g -o $@ $<
gc_comdat_test_2.o: gc_comdat_test_2.cc 
	$(CXXCOMPILE) -O0 -c -ffunction-sections -g -o $@ $<
gc_comdat_test: gc_comdat_test_1.o gc_comdat_test_2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -Wl,--gc-sections gc_comdat_test_1.o gc_comdat_test_2.o
gc_comdat_test.stdout: gc_comdat_test
	$(TEST_NM) -C gc_comdat_test > gc_comdat_test.stdout

check_SCRIPTS += gc_tls_test.sh
check_DATA += gc_tls_test.stdout
MOSTLYCLEANFILES += gc_tls_test
gc_tls_test.o: gc_tls_test.cc
	$(CXXCOMPILE) -O0 -c -g -o $@ $<
gc_tls_test:gc_tls_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -Wl,--gc-sections gc_tls_test.o
gc_tls_test.stdout: gc_tls_test
	$(TEST_NM) -C gc_tls_test > gc_tls_test.stdout

check_SCRIPTS += icf_test.sh
check_DATA += icf_test.stdout
MOSTLYCLEANFILES += icf_test
icf_test.o: icf_test.cc 
	$(CXXCOMPILE) -O0 -c -ffunction-sections -g -o $@ $<
icf_test: icf_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -Wl,--icf=all icf_test.o
icf_test.stdout: icf_test
	$(TEST_NM) -C icf_test > icf_test.stdout

check_SCRIPTS += icf_keep_unique_test.sh
check_DATA += icf_keep_unique_test.stdout
MOSTLYCLEANFILES += icf_keep_unique_test
icf_keep_unique_test.o: icf_keep_unique_test.cc
	$(CXXCOMPILE) -O0 -c -ffunction-sections -g -o $@ $<
icf_keep_unique_test: icf_keep_unique_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -Wl,--icf=all -Wl,--keep-unique,_Z11unique_funcv icf_keep_unique_test.o
icf_keep_unique_test.stdout: icf_keep_unique_test
	$(TEST_NM) -C icf_keep_unique_test > icf_keep_unique_test.stdout

check_SCRIPTS += icf_safe_test.sh
check_DATA += icf_safe_test.stdout
MOSTLYCLEANFILES += icf_safe_test
icf_safe_test.o: icf_safe_test.cc 
	$(CXXCOMPILE) -O0 -c -ffunction-sections -g -o $@ $<
icf_safe_test: icf_safe_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -Wl,--icf=safe icf_safe_test.o
icf_safe_test.stdout: icf_safe_test
	$(TEST_NM) icf_safe_test > icf_safe_test.stdout

check_PROGRAMS += basic_test
check_PROGRAMS += basic_static_test
check_PROGRAMS += basic_pic_test
check_PROGRAMS += basic_static_pic_test
basic_test.o: basic_test.cc
	$(CXXCOMPILE) -O0 -c -o $@ $<
basic_test: basic_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ basic_test.o
basic_static_test: basic_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -static basic_test.o

basic_pic_test.o: basic_test.cc
	$(CXXCOMPILE) -O0 -c -fpic -o $@ $<
basic_pic_test: basic_pic_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ basic_pic_test.o
basic_static_pic_test: basic_pic_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -static basic_pic_test.o

check_PROGRAMS += basic_pie_test
basic_pie_test.o: basic_test.cc
	$(CXXCOMPILE) -O0 -c -fpie -o $@ $<
basic_pie_test: basic_pie_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -pie basic_pie_test.o

check_PROGRAMS += constructor_test
check_PROGRAMS += constructor_static_test
constructor_test_SOURCES = constructor_test.cc
constructor_test_DEPENDENCIES = gcctestdir/ld
constructor_test_LDFLAGS = -Bgcctestdir/

constructor_static_test_SOURCES = $(constructor_test_SOURCES)
constructor_static_test_DEPENDENCIES = $(constructor_test_DEPENDENCIES)
constructor_static_test_LDFLAGS = $(constructor_test_LDFLAGS) -static


check_PROGRAMS += two_file_test
check_PROGRAMS += two_file_static_test
check_PROGRAMS += two_file_pic_test
two_file_test_SOURCES = \
	two_file_test_1.cc \
	two_file_test_1b.cc \
	two_file_test_2.cc \
	two_file_test_main.cc \
	two_file_test.h
two_file_test_DEPENDENCIES = gcctestdir/ld
two_file_test_LDFLAGS = -Bgcctestdir/

two_file_static_test_SOURCES = $(two_file_test_SOURCES)
two_file_static_test_DEPENDENCIES = $(two_file_test_DEPENDENCIES)
two_file_static_test_LDFLAGS = $(two_file_test_LDFLAGS) -static

two_file_pic_test_SOURCES = two_file_test_main.cc
two_file_pic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2_pic.o
two_file_pic_test_LDFLAGS = -Bgcctestdir/
two_file_pic_test_LDADD = two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2_pic.o


check_PROGRAMS += two_file_shared_1_test
check_PROGRAMS += two_file_shared_2_test
check_PROGRAMS += two_file_shared_1_pic_2_test
check_PROGRAMS += two_file_shared_2_pic_1_test
check_PROGRAMS += two_file_same_shared_test
check_PROGRAMS += two_file_separate_shared_12_test
check_PROGRAMS += two_file_separate_shared_21_test
two_file_test_1_pic.o: two_file_test_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
two_file_test_1b_pic.o: two_file_test_1b.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
two_file_test_2_pic.o: two_file_test_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
two_file_shared_1.so: two_file_test_1_pic.o two_file_test_1b_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1_pic.o two_file_test_1b_pic.o
two_file_shared_2.so: two_file_test_2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_2_pic.o
two_file_shared.so: two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2_pic.o

two_file_shared_1_test_SOURCES = two_file_test_2.cc two_file_test_main.cc
two_file_shared_1_test_DEPENDENCIES = gcctestdir/ld two_file_shared_1.so
two_file_shared_1_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_1_test_LDADD = two_file_shared_1.so

two_file_shared_2_test_SOURCES = two_file_test_1.cc two_file_test_1b.cc two_file_test_main.cc
two_file_shared_2_test_DEPENDENCIES = gcctestdir/ld two_file_shared_2.so
two_file_shared_2_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_2_test_LDADD = two_file_shared_2.so

two_file_shared_1_pic_2_test_SOURCES = two_file_test_main.cc
two_file_shared_1_pic_2_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1.so two_file_test_1_pic.o two_file_test_1b_pic.o
two_file_shared_1_pic_2_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_1_pic_2_test_LDADD = two_file_test_1_pic.o two_file_test_1b_pic.o two_file_shared_2.so

two_file_shared_2_pic_1_test_SOURCES = two_file_test_main.cc
two_file_shared_2_pic_1_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_2.so two_file_test_2_pic.o
two_file_shared_2_pic_1_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_2_pic_1_test_LDADD = two_file_test_2_pic.o two_file_shared_1.so

two_file_same_shared_test_SOURCES = two_file_test_main.cc
two_file_same_shared_test_DEPENDENCIES = gcctestdir/ld two_file_shared.so
two_file_same_shared_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_same_shared_test_LDADD = two_file_shared.so

two_file_separate_shared_12_test_SOURCES = two_file_test_main.cc
two_file_separate_shared_12_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1.so two_file_shared_2.so
two_file_separate_shared_12_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_separate_shared_12_test_LDADD = \
	two_file_shared_1.so two_file_shared_2.so

two_file_separate_shared_21_test_SOURCES = two_file_test_main.cc
two_file_separate_shared_21_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1.so two_file_shared_2.so
two_file_separate_shared_21_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_separate_shared_21_test_LDADD = \
	two_file_shared_2.so two_file_shared_1.so

check_PROGRAMS += two_file_relocatable_test
two_file_relocatable_test_SOURCES = two_file_test_main.cc
two_file_relocatable_test_DEPENDENCIES = \
	gcctestdir/ld two_file_relocatable.o
two_file_relocatable_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_relocatable_test_LDADD = two_file_relocatable.o
two_file_relocatable.o: gcctestdir/ld two_file_test_1.o two_file_test_1b.o two_file_test_2.o
	gcctestdir/ld -r -o $@ two_file_test_1.o two_file_test_1b.o two_file_test_2.o

check_PROGRAMS += two_file_pie_test
two_file_test_1_pie.o: two_file_test_1.cc
	$(CXXCOMPILE) -c -fpie -o $@ $<
two_file_test_1b_pie.o: two_file_test_1b.cc
	$(CXXCOMPILE) -c -fpie -o $@ $<
two_file_test_2_pie.o: two_file_test_2.cc
	$(CXXCOMPILE) -c -fpie -o $@ $<
two_file_test_main_pie.o: two_file_test_main.cc
	$(CXXCOMPILE) -c -fpie -o $@ $<
two_file_pie_test: two_file_test_1_pie.o two_file_test_1b_pie.o \
		two_file_test_2_pie.o two_file_test_main_pie.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -pie two_file_test_1_pie.o two_file_test_1b_pie.o two_file_test_2_pie.o two_file_test_main_pie.o

check_SCRIPTS += two_file_shared.sh
check_DATA += two_file_shared.dbg
MOSTLYCLEANFILES += two_file_shared.dbg
two_file_shared.dbg: two_file_shared.so
	$(TEST_READELF) -w $< >$@ 2>/dev/null

# The nonpic tests will fail on platforms which can not put non-PIC
# code into shared libraries, so we just don't run them in that case.
if FN_PTRS_IN_SO_WITHOUT_PIC

check_PROGRAMS += two_file_shared_1_nonpic_test
check_PROGRAMS += two_file_shared_2_nonpic_test
check_PROGRAMS += two_file_same_shared_nonpic_test
check_PROGRAMS += two_file_separate_shared_12_nonpic_test
check_PROGRAMS += two_file_separate_shared_21_nonpic_test
check_PROGRAMS += two_file_mixed_shared_test
check_PROGRAMS += two_file_mixed_2_shared_test
two_file_shared_1_nonpic.so: two_file_test_1.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1.o two_file_test_1b.o
two_file_shared_2_nonpic.so: two_file_test_2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_2.o
two_file_shared_nonpic.so: two_file_test_1.o two_file_test_1b.o two_file_test_2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1.o two_file_test_1b.o two_file_test_2.o
two_file_shared_mixed.so: two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1_pic.o two_file_test_1b_pic.o two_file_test_2.o
two_file_shared_mixed_1.so: two_file_test_1.o two_file_test_1b_pic.o two_file_shared_2.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1.o two_file_test_1b_pic.o two_file_shared_2.so

two_file_shared_1_nonpic_test_SOURCES = \
	two_file_test_2.cc two_file_test_main.cc
two_file_shared_1_nonpic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1_nonpic.so
two_file_shared_1_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_1_nonpic_test_LDADD = two_file_shared_1_nonpic.so

two_file_shared_2_nonpic_test_SOURCES = \
	two_file_test_1.cc two_file_test_1b.cc two_file_test_main.cc
two_file_shared_2_nonpic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_2_nonpic.so
two_file_shared_2_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_shared_2_nonpic_test_LDADD = two_file_shared_2_nonpic.so

two_file_same_shared_nonpic_test_SOURCES = two_file_test_main.cc
two_file_same_shared_nonpic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_nonpic.so
two_file_same_shared_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_same_shared_nonpic_test_LDADD = two_file_shared_nonpic.so

two_file_separate_shared_12_nonpic_test_SOURCES = two_file_test_main.cc
two_file_separate_shared_12_nonpic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1_nonpic.so two_file_shared_2_nonpic.so
two_file_separate_shared_12_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_separate_shared_12_nonpic_test_LDADD = \
	two_file_shared_1_nonpic.so two_file_shared_2_nonpic.so

two_file_separate_shared_21_nonpic_test_SOURCES = two_file_test_main.cc
two_file_separate_shared_21_nonpic_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_1_nonpic.so two_file_shared_2_nonpic.so
two_file_separate_shared_21_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_separate_shared_21_nonpic_test_LDADD = \
	two_file_shared_2_nonpic.so two_file_shared_1_nonpic.so

two_file_mixed_shared_test_SOURCES = two_file_test_main.cc
two_file_mixed_shared_test_DEPENDENCIES = gcctestdir/ld two_file_shared_mixed.so
two_file_mixed_shared_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_mixed_shared_test_LDADD = two_file_shared_mixed.so

two_file_mixed_2_shared_test_SOURCES = two_file_test_main.cc
two_file_mixed_2_shared_test_DEPENDENCIES = gcctestdir/ld two_file_shared_mixed_1.so two_file_shared_2.so
two_file_mixed_2_shared_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
two_file_mixed_2_shared_test_LDADD = two_file_shared_mixed_1.so two_file_shared_2.so

endif FN_PTRS_IN_SO_WITHOUT_PIC

check_PROGRAMS += two_file_strip_test
two_file_strip_test: two_file_test
	$(TEST_STRIP) -o two_file_strip_test two_file_test

check_PROGRAMS += two_file_same_shared_strip_test
two_file_same_shared_strip_test_SOURCES = two_file_test_main.cc
two_file_same_shared_strip_test_DEPENDENCIES = \
	gcctestdir/ld two_file_shared_strip.so
two_file_same_shared_strip_test_LDFLAGS = -Bgcctestdir/ -Wl,-R.
two_file_same_shared_strip_test_LDADD = two_file_shared_strip.so
two_file_shared_strip.so: two_file_shared.so
	$(TEST_STRIP) -S -o two_file_shared_strip.so two_file_shared.so

check_PROGRAMS += common_test_1
common_test_1_SOURCES = common_test_1.c
common_test_1_DEPENDENCIES = gcctestdir/ld
common_test_1_LDFLAGS = -Bgcctestdir/

check_PROGRAMS += exception_test
check_PROGRAMS += exception_static_test
check_PROGRAMS += exception_shared_1_test
check_PROGRAMS += exception_shared_2_test
check_PROGRAMS += exception_same_shared_test
check_PROGRAMS += exception_separate_shared_12_test
check_PROGRAMS += exception_separate_shared_21_test
exception_test_1_pic.o: exception_test_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
exception_test_2_pic.o: exception_test_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
exception_shared_1.so: exception_test_1_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared exception_test_1_pic.o
exception_shared_2.so: exception_test_2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared exception_test_2_pic.o
exception_shared.so: exception_test_1_pic.o exception_test_2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared exception_test_1_pic.o exception_test_2_pic.o

exception_test_SOURCES = \
	exception_test_main.cc \
	exception_test_1.cc \
	exception_test_2.cc \
	exception_test.h
exception_test_DEPENDENCIES = gcctestdir/ld
exception_test_LDFLAGS = -Bgcctestdir/

exception_static_test_SOURCES = $(exception_test_SOURCES)
exception_static_test_DEPENDENCIES = $(exception_test_DEPENDENCIES)
exception_static_test_LDFLAGS = $(exception_test_LDFLAGS) -static

exception_shared_1_test_SOURCES = exception_test_2.cc exception_test_main.cc
exception_shared_1_test_DEPENDENCIES = gcctestdir/ld exception_shared_1.so
exception_shared_1_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
exception_shared_1_test_LDADD = exception_shared_1.so

exception_shared_2_test_SOURCES = exception_test_1.cc exception_test_main.cc
exception_shared_2_test_DEPENDENCIES = gcctestdir/ld exception_shared_2.so
exception_shared_2_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
exception_shared_2_test_LDADD = exception_shared_2.so

exception_same_shared_test_SOURCES = exception_test_main.cc
exception_same_shared_test_DEPENDENCIES = gcctestdir/ld exception_shared.so
exception_same_shared_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
exception_same_shared_test_LDADD = exception_shared.so

exception_separate_shared_12_test_SOURCES = exception_test_main.cc
exception_separate_shared_12_test_DEPENDENCIES = \
	gcctestdir/ld exception_shared_1.so exception_shared_2.so
exception_separate_shared_12_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
exception_separate_shared_12_test_LDADD = \
	exception_shared_1.so exception_shared_2.so

exception_separate_shared_21_test_SOURCES = exception_test_main.cc
exception_separate_shared_21_test_DEPENDENCIES = \
	gcctestdir/ld exception_shared_1.so exception_shared_2.so
exception_separate_shared_21_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
exception_separate_shared_21_test_LDADD = \
	exception_shared_2.so exception_shared_1.so


check_PROGRAMS += weak_test
weak_test_SOURCES = weak_test.cc
weak_test_DEPENDENCIES = gcctestdir/ld
weak_test_LDFLAGS = -Bgcctestdir/

check_PROGRAMS += weak_undef_test
MOSTLYCLEANFILES += alt/weak_undef_lib.so
weak_undef_test_SOURCES = weak_undef_test.cc
weak_undef_test_DEPENDENCIES = gcctestdir/ld weak_undef_lib.so alt/weak_undef_lib.so
weak_undef_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,alt
weak_undef_test_LDADD = -L . weak_undef_lib.so
weak_undef_file1.o: weak_undef_file1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_undef_file2.o: weak_undef_file2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_undef_lib.so: weak_undef_file1.o
	$(CXXLINK) -Bgcctestdir/ -shared weak_undef_file1.o
alt/weak_undef_lib.so: weak_undef_file2.o
	test -d alt || mkdir -p alt
	$(CXXLINK) -Bgcctestdir/ -shared weak_undef_file2.o

if FN_PTRS_IN_SO_WITHOUT_PIC
check_PROGRAMS += weak_undef_nonpic_test
MOSTLYCLEANFILES += alt/weak_undef_lib_nonpic.so
weak_undef_nonpic_test_SOURCES = weak_undef_test.cc
weak_undef_nonpic_test_DEPENDENCIES = gcctestdir/ld weak_undef_lib_nonpic.so alt/weak_undef_lib_nonpic.so
weak_undef_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,alt
weak_undef_nonpic_test_LDADD = -L . weak_undef_lib_nonpic.so
weak_undef_file1_nonpic.o: weak_undef_file1.cc
	$(CXXCOMPILE) -c -o $@ $<
weak_undef_file2_nonpic.o: weak_undef_file2.cc
	$(CXXCOMPILE) -c -o $@ $<
weak_undef_lib_nonpic.so: weak_undef_file1_nonpic.o
	$(CXXLINK) -Bgcctestdir/ -shared weak_undef_file1_nonpic.o
alt/weak_undef_lib_nonpic.so: weak_undef_file2_nonpic.o
	test -d alt || mkdir -p alt
	$(CXXLINK) -Bgcctestdir/ -shared weak_undef_file2_nonpic.o
endif FN_PTRS_IN_SO_WITHOUT_PIC


check_PROGRAMS += weak_alias_test
weak_alias_test_SOURCES = weak_alias_test_main.cc
weak_alias_test_DEPENDENCIES = \
	gcctestdir/ld weak_alias_test_1.so weak_alias_test_2.so \
	weak_alias_test_3.o weak_alias_test_4.so
weak_alias_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
weak_alias_test_LDADD = \
	weak_alias_test_1.so weak_alias_test_2.so weak_alias_test_3.o \
	weak_alias_test_4.so
weak_alias_test_1_pic.o: weak_alias_test_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_alias_test_1.so: weak_alias_test_1_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared weak_alias_test_1_pic.o
weak_alias_test_2_pic.o: weak_alias_test_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_alias_test_2.so: weak_alias_test_2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared weak_alias_test_2_pic.o
weak_alias_test_3.o: weak_alias_test_3.cc
	$(CXXCOMPILE) -c -o $@ $<
weak_alias_test_4_pic.o: weak_alias_test_4.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_alias_test_4.so: weak_alias_test_4_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared weak_alias_test_4_pic.o

check_SCRIPTS += weak_plt.sh
check_PROGRAMS += weak_plt
check_DATA += weak_plt_shared.so
weak_plt_main_pic.o: weak_plt_main.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_plt: weak_plt_main_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ weak_plt_main_pic.o
weak_plt_shared_pic.o: weak_plt_shared.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
weak_plt_shared.so: weak_plt_shared_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared weak_plt_shared_pic.o

check_PROGRAMS += copy_test
copy_test_SOURCES = copy_test.cc
copy_test_DEPENDENCIES = gcctestdir/ld copy_test_1.so copy_test_2.so
copy_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
copy_test_LDADD = copy_test_1.so copy_test_2.so
copy_test_1_pic.o: copy_test_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
copy_test_1.so: gcctestdir/ld copy_test_1_pic.o
	$(CXXLINK) -Bgcctestdir/ -shared copy_test_1_pic.o
copy_test_2_pic.o: copy_test_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
copy_test_2.so: gcctestdir/ld copy_test_2_pic.o
	$(CXXLINK) -Bgcctestdir/ -shared copy_test_2_pic.o

if TLS

check_PROGRAMS += tls_test
check_PROGRAMS += tls_pic_test
check_PROGRAMS += tls_shared_test
check_PROGRAMS += tls_shared_ie_test
check_PROGRAMS += tls_shared_gd_to_ie_test
tls_test_pic.o: tls_test.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
tls_test_file2_pic.o: tls_test_file2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
tls_test_c_pic.o: tls_test_c.c
	$(COMPILE) -c -fpic $(TLS_TEST_C_CFLAGS) -o $@ $<
tls_test_shared.so: tls_test_pic.o tls_test_file2_pic.o tls_test_c_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test_pic.o tls_test_file2_pic.o tls_test_c_pic.o -Wl,-z,defs
tls_test_shared2.so: tls_test_file2_pic.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test_file2_pic.o

tls_test_pic_ie.o: tls_test.cc
	$(CXXCOMPILE) -c -fpic -ftls-model=initial-exec -o $@ $<
tls_test_file2_pic_ie.o: tls_test_file2.cc
	$(CXXCOMPILE) -c -fpic -ftls-model=initial-exec -o $@ $<
tls_test_c_pic_ie.o: tls_test_c.c
	$(COMPILE) -c -fpic -ftls-model=initial-exec $(TLS_TEST_C_CFLAGS) -o $@ $<
tls_test_ie_shared.so: tls_test_pic_ie.o tls_test_file2_pic_ie.o tls_test_c_pic_ie.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test_pic_ie.o tls_test_file2_pic_ie.o tls_test_c_pic_ie.o

tls_test_SOURCES = tls_test.cc tls_test_file2.cc tls_test_main.cc tls_test.h
tls_test_DEPENDENCIES = gcctestdir/ld tls_test_c.o
tls_test_LDFLAGS = -Bgcctestdir/
tls_test_LDADD = tls_test_c.o -lpthread
tls_test_c.o: tls_test_c.c
	$(COMPILE) -c $(TLS_TEST_C_CFLAGS) -o $@ $<

tls_pic_test_SOURCES = tls_test_main.cc
tls_pic_test_DEPENDENCIES = gcctestdir/ld tls_test_pic.o tls_test_file2_pic.o \
	tls_test_c_pic.o
tls_pic_test_LDFLAGS = -Bgcctestdir/
tls_pic_test_LDADD = tls_test_pic.o tls_test_file2_pic.o tls_test_c_pic.o \
	-lpthread

tls_shared_test_SOURCES = tls_test_main.cc
tls_shared_test_DEPENDENCIES = gcctestdir/ld tls_test_shared.so
tls_shared_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_test_LDADD = tls_test_shared.so -lpthread

tls_shared_ie_test_SOURCES = tls_test_main.cc
tls_shared_ie_test_DEPENDENCIES = gcctestdir/ld tls_test_ie_shared.so
tls_shared_ie_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_ie_test_LDADD = tls_test_ie_shared.so -lpthread

tls_shared_gd_to_ie_test_SOURCES = tls_test_main.cc
tls_shared_gd_to_ie_test_DEPENDENCIES = gcctestdir/ld tls_test_pic.o \
	tls_test_c_pic.o tls_test_shared2.so
tls_shared_gd_to_ie_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_gd_to_ie_test_LDADD = tls_test_pic.o tls_test_c_pic.o \
	tls_test_shared2.so -lpthread

if TLS_GNU2_DIALECT

check_PROGRAMS += tls_shared_gnu2_gd_to_ie_test

tls_test_gnu2.o: tls_test.cc
	$(CXXCOMPILE) -c -fpic -mtls-dialect=gnu2 -o $@ $<
tls_test_file2_gnu2.o: tls_test_file2.cc
	$(CXXCOMPILE) -c -fpic -mtls-dialect=gnu2 -o $@ $<
tls_test_c_gnu2.o: tls_test_c.c
	$(COMPILE) -c -fpic -mtls-dialect=gnu2 $(TLS_TEST_C_CFLAGS) -o $@ $<
tls_test_gnu2_shared2.so: tls_test_file2_gnu2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test_file2_gnu2.o

tls_shared_gnu2_gd_to_ie_test_SOURCES = tls_test_main.cc
tls_shared_gnu2_gd_to_ie_test_DEPENDENCIES = gcctestdir/ld tls_test_gnu2.o \
	tls_test_c_gnu2.o tls_test_gnu2_shared2.so
tls_shared_gnu2_gd_to_ie_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_gnu2_gd_to_ie_test_LDADD = tls_test_gnu2.o tls_test_c_gnu2.o \
	tls_test_gnu2_shared2.so -lpthread

if TLS_DESCRIPTORS

check_PROGRAMS += tls_shared_gnu2_test

tls_test_gnu2_shared.so: tls_test_gnu2.o tls_test_file2_gnu2.o tls_test_c_gnu2.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test_gnu2.o tls_test_file2_gnu2.o tls_test_c_gnu2.o

tls_shared_gnu2_test_SOURCES = tls_test_main.cc
tls_shared_gnu2_test_DEPENDENCIES = gcctestdir/ld tls_test_gnu2_shared.so
tls_shared_gnu2_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_gnu2_test_LDADD = tls_test_gnu2_shared.so -lpthread

endif TLS_DESCRIPTORS

endif TLS_GNU2_DIALECT

if STATIC_TLS
check_PROGRAMS += tls_static_test
check_PROGRAMS += tls_static_pic_test

tls_static_test_SOURCES = $(tls_test_SOURCES)
tls_static_test_DEPENDENCIES = $(tls_test_DEPENDENCIES)
tls_static_test_LDFLAGS = $(tls_test_LDFLAGS) -static
tls_static_test_LDADD = $(tls_test_LDADD)

tls_static_pic_test_SOURCES = $(tls_pic_test_SOURCES)
tls_static_pic_test_DEPENDENCIES = $(tls_pic_test_DEPENDENCIES)
tls_static_pic_test_LDFLAGS = $(tls_pic_test_LDFLAGS) -static
tls_static_pic_test_LDADD = $(tls_pic_test_LDADD)
endif

if FN_PTRS_IN_SO_WITHOUT_PIC
check_PROGRAMS += tls_shared_nonpic_test
tls_test_shared_nonpic.so: tls_test.o tls_test_file2.o tls_test_c.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared tls_test.o tls_test_file2.o tls_test_c.o

tls_shared_nonpic_test_SOURCES = tls_test_main.cc
tls_shared_nonpic_test_DEPENDENCIES = gcctestdir/ld tls_test_shared_nonpic.so
tls_shared_nonpic_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
tls_shared_nonpic_test_LDADD = tls_test_shared_nonpic.so -lpthread
endif FN_PTRS_IN_SO_WITHOUT_PIC

endif TLS

check_PROGRAMS += many_sections_test
many_sections_test_SOURCES = many_sections_test.cc
many_sections_test_DEPENDENCIES = gcctestdir/ld
many_sections_test_LDFLAGS = -Bgcctestdir/ -rdynamic

BUILT_SOURCES += many_sections_define.h
MOSTLYCLEANFILES += many_sections_define.h
many_sections_define.h:
	(for i in `seq 1 70000`; do \
	   echo "int var_$$i __attribute__((section(\"section_$$i\"))) = $$i;"; \
	 done) > $@.tmp
	mv -f $@.tmp $@

BUILT_SOURCES += many_sections_check.h
MOSTLYCLEANFILES += many_sections_check.h
many_sections_check.h:
	(for i in `seq 1 1000 70000`; do \
	   echo "assert(var_$$i == $$i);"; \
	 done) > $@.tmp
	mv -f $@.tmp $@

check_PROGRAMS += many_sections_r_test
many_sections_r_test.o: many_sections_test.o gcctestdir/ld
	gcctestdir/ld -r -o $@ many_sections_test.o
many_sections_r_test: many_sections_r_test.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ many_sections_r_test.o $(LIBS)

if CONSTRUCTOR_PRIORITY

check_PROGRAMS += initpri1
initpri1_SOURCES = initpri1.c
initpri1_DEPENDENCIES = gcctestdir/ld
initpri1_LDFLAGS = -Bgcctestdir/

endif


# Test --detect-odr-violations
check_SCRIPTS += debug_msg.sh

# Create the data files that debug_msg.sh analyzes.
check_DATA += debug_msg.err
MOSTLYCLEANFILES += debug_msg.err
debug_msg.o: debug_msg.cc
	$(CXXCOMPILE) -O0 -g -c -w -o $@ $(srcdir)/debug_msg.cc
odr_violation1.o: odr_violation1.cc
	$(CXXCOMPILE) -O0 -g -c -w -o $@ $(srcdir)/odr_violation1.cc
odr_violation2.o: odr_violation2.cc
	$(CXXCOMPILE) -O0 -g -c -w -o $@ $(srcdir)/odr_violation2.cc
debug_msg.err: debug_msg.o odr_violation1.o odr_violation2.o gcctestdir/ld
	@echo $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg debug_msg.o odr_violation1.o odr_violation2.o "2>$@"
	@if $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg debug_msg.o odr_violation1.o odr_violation2.o 2>$@; \
	then \
	  echo 1>&2 "Link of debug_msg should have failed"; \
	  rm -f $@; \
	  exit 1; \
	fi

# See if we can also detect problems when we're linking .so's, not .o's.
check_DATA += debug_msg_so.err
MOSTLYCLEANFILES += debug_msg_so.err
debug_msg.so: debug_msg.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g -shared -fPIC -w -o $@ $(srcdir)/debug_msg.cc
odr_violation1.so: odr_violation1.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g -shared -fPIC -w -o $@ $(srcdir)/odr_violation1.cc
odr_violation2.so: odr_violation2.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g -shared -fPIC -w -o $@ $(srcdir)/odr_violation2.cc
debug_msg_so.err: debug_msg.so odr_violation1.so odr_violation2.so gcctestdir/ld
	@echo $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg_so debug_msg.so odr_violation1.so odr_violation2.so "2>$@"
	@if $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg_so debug_msg.so odr_violation1.so odr_violation2.so 2>$@; \
	then \
	  echo 1>&2 "Link of debug_msg_so should have failed"; \
	  rm -f $@; \
	  exit 1; \
	fi

# We also want to make sure we do something reasonable when there's no
# debug info available.  For the best test, we use .so's.
check_DATA += debug_msg_ndebug.err
MOSTLYCLEANFILES += debug_msg_ndebug.err
debug_msg_ndebug.so: debug_msg.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g0 -shared -fPIC -w -o $@ $(srcdir)/debug_msg.cc
odr_violation1_ndebug.so: odr_violation1.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g0 -shared -fPIC -w -o $@ $(srcdir)/odr_violation1.cc
odr_violation2_ndebug.so: odr_violation2.cc gcctestdir/ld
	$(CXXCOMPILE) -Bgcctestdir/ -O0 -g0 -shared -fPIC -w -o $@ $(srcdir)/odr_violation2.cc
debug_msg_ndebug.err: debug_msg_ndebug.so odr_violation1_ndebug.so odr_violation2_ndebug.so gcctestdir/ld
	@echo $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg_ndebug debug_msg_ndebug.so odr_violation1_ndebug.so odr_violation2_ndebug.so "2>$@"
	@if $(CXXLINK) -Bgcctestdir/ -Wl,--detect-odr-violations -o debug_msg_ndebug debug_msg_ndebug.so odr_violation1_ndebug.so odr_violation2_ndebug.so 2>$@; \
	then \
	  echo 1>&2 "Link of debug_msg_ndebug should have failed"; \
	  rm -f $@; \
	  exit 1; \
	fi


# Similar to --detect-odr-violations: check for undefined symbols in .so's
check_SCRIPTS += undef_symbol.sh
check_DATA += undef_symbol.err
MOSTLYCLEANFILES += undef_symbol.err
undef_symbol.o: undef_symbol.cc
	$(CXXCOMPILE) -O0 -g -c -fPIC $<
undef_symbol.so: undef_symbol.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared undef_symbol.o
undef_symbol.err: undef_symbol_main.o undef_symbol.so gcctestdir/ld
	@echo $(CXXLINK) -Bgcctestdir/ -o undef_symbol_test undef_symbol_main.o undef_symbol.so "2>$@"
	@if $(CXXLINK) -Bgcctestdir/ -o undef_symbol_test undef_symbol_main.o undef_symbol.so 2>$@; \
	then \
	  echo 1>&2 "Link of undef_symbol_test should have failed"; \
	  rm -f $@; \
	  exit 1; \
	fi


# Test -o when emitting to a special file (such as something in /dev).
check_PROGRAMS += flagstest_o_specialfile
flagstest_o_specialfile: flagstest_debug.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -o /dev/stdout $< 2>&1 | cat > $@
	chmod a+x $@
	test -s $@

if HAVE_ZLIB

# Test --compress-debug-sections.  FIXME: check we actually compress.
check_PROGRAMS += flagstest_compress_debug_sections
flagstest_compress_debug_sections: flagstest_debug.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -o $@ $< -Wl,--compress-debug-sections=zlib
	test -s $@


# The specialfile output has a tricky case when we also compress debug
# sections, because it requires output-file resizing.
check_PROGRAMS += flagstest_o_specialfile_and_compress_debug_sections
flagstest_o_specialfile_and_compress_debug_sections: flagstest_debug.o \
		gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -o /dev/stdout $< -Wl,--compress-debug-sections=zlib 2>&1 | cat > $@
	chmod a+x $@
	test -s $@

endif HAVE_ZLIB

# Test symbol versioning.
check_PROGRAMS += ver_test
ver_test_SOURCES = ver_test_main.cc
ver_test_DEPENDENCIES = gcctestdir/ld ver_test_1.so ver_test_2.so ver_test_4.so
ver_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_LDADD = ver_test_1.so ver_test_2.so ver_test_4.so
ver_test_1.so: ver_test_1.o ver_test_2.so ver_test_3.o ver_test_4.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared ver_test_1.o ver_test_2.so ver_test_3.o ver_test_4.so
ver_test_2.so: ver_test_2.o $(srcdir)/ver_test_2.script ver_test_4.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_2.script ver_test_2.o ver_test_4.so
ver_test_4.so: ver_test_4.o $(srcdir)/ver_test_4.script gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_4.script ver_test_4.o
ver_test_1.o: ver_test_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
ver_test_2.o: ver_test_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
ver_test_3.o: ver_test_3.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
ver_test_4.o: ver_test_4.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<

check_SCRIPTS += ver_test_1.sh
check_DATA += ver_test_1.syms
ver_test_1.syms: ver_test_1.so
	$(TEST_READELF) -s $< >$@ 2>/dev/null

check_PROGRAMS += ver_test_2
ver_test_2_SOURCES = ver_test_main_2.cc
ver_test_2_DEPENDENCIES = gcctestdir/ld ver_test_4.so ver_test_2.so
ver_test_2_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_2_LDADD = ver_test_4.so ver_test_2.so

check_SCRIPTS += ver_test_2.sh
check_DATA += ver_test_2.syms
ver_test_2.syms: ver_test_2
	$(TEST_READELF) -s $< >$@ 2>/dev/null

check_SCRIPTS += ver_test_4.sh
check_DATA += ver_test_4.syms
ver_test_4.syms: ver_test_4.so
	$(TEST_READELF) -s $< >$@ 2>/dev/null

ver_test_5.so: ver_test_5.o $(srcdir)/ver_test_5.script ver_test_4.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_5.script ver_test_5.o ver_test_4.so
ver_test_5.o: ver_test_5.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
check_SCRIPTS += ver_test_5.sh
check_DATA += ver_test_5.syms
ver_test_5.syms: ver_test_5.so
	$(TEST_READELF) -s $< >$@ 2>/dev/null

check_PROGRAMS += ver_test_6
ver_test_6_SOURCES = ver_test_6.c
ver_test_6_DEPENDENCIES = gcctestdir/ld ver_test_2.so
ver_test_6_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_6_LDADD = ver_test_2.so

ver_test_7.so: ver_test_4.o $(srcdir)/ver_test_4.script ver_test_7.o gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_4.script ver_test_4.o ver_test_7.o
ver_test_7.o: ver_test_7.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
check_SCRIPTS += ver_test_7.sh
check_DATA += ver_test_7.syms
ver_test_7.syms: ver_test_7.so
	$(TEST_READELF) -s $< >$@ 2>/dev/null

check_PROGRAMS += ver_test_8
ver_test_8_SOURCES = two_file_test_main.cc
ver_test_8_DEPENDENCIES = gcctestdir/ld ver_test_8_1.so ver_test_8_2.so
ver_test_8_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_8_LDADD = ver_test_8_1.so ver_test_8_2.so
ver_test_8_1.so: two_file_test_1_pic.o two_file_test_1b_pic.o ver_test_8_2.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared two_file_test_1_pic.o two_file_test_1b_pic.o ver_test_8_2.so
ver_test_8_2.so: two_file_test_2_pic.o $(srcdir)/ver_test_8.script gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_8.script two_file_test_2_pic.o

check_PROGRAMS += ver_test_9
ver_test_9_SOURCES = ver_test_main.cc
ver_test_9_DEPENDENCIES = gcctestdir/ld ver_test_9.so
ver_test_9_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_9_LDADD = ver_test_9.so
ver_test_9.so: ver_test_9.o ver_test_4.so ver_test_5.so gcctestdir/ld
	$(CXXLINK) -Bgcctestdir/ -shared ver_test_9.o ver_test_5.so ver_test_4.so
ver_test_9.o: ver_test_9.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<

check_SCRIPTS += ver_test_10.sh
check_DATA += ver_test_10.syms
ver_test_10.syms: ver_test_10.so
	$(TEST_READELF) -s $< >$@ 2>/dev/null
ver_test_10.so: gcctestdir/ld ver_test_2.o ver_test_10.script
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,--version-script,$(srcdir)/ver_test_10.script ver_test_2.o

check_PROGRAMS += ver_test_11
MOSTLYCLEANFILES += ver_test_11.a
ver_test_11_SOURCES = ver_test_main_2.cc
ver_test_11_DEPENDENCIES = gcctestdir/ld ver_test_11.a
ver_test_11_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
ver_test_11_LDADD = ver_test_11.a
ver_test_11.a: ver_test_1.o ver_test_2.o ver_test_4.o
	$(TEST_AR) rc $@ $^

check_PROGRAMS += protected_1
protected_1_SOURCES = \
	protected_main_1.cc protected_main_2.cc protected_main_3.cc
protected_1_DEPENDENCIES = gcctestdir/ld protected_1.so
protected_1_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
protected_1_LDADD = protected_1.so

protected_1.so: gcctestdir/ld protected_1_pic.o protected_2_pic.o protected_3_pic.o
	$(CXXLINK) -Bgcctestdir/ -shared protected_1_pic.o protected_2_pic.o protected_3_pic.o
protected_1_pic.o: protected_1.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
protected_2_pic.o: protected_2.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<
protected_3_pic.o: protected_3.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<

check_PROGRAMS += protected_2
protected_2_SOURCES = protected_main_1.cc protected_3.cc
protected_2_DEPENDENCIES = gcctestdir/ld protected_1.so
protected_2_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
protected_2_LDADD = protected_1.so

check_PROGRAMS += relro_test
relro_test_SOURCES = relro_test_main.cc
relro_test_DEPENDENCIES = gcctestdir/ld relro_test.so
relro_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
relro_test_LDADD = relro_test.so
relro_test.so: gcctestdir/ld relro_test_pic.o
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-z,relro relro_test_pic.o
relro_test_pic.o: relro_test.cc
	$(CXXCOMPILE) -c -fpic -o $@ $<

check_PROGRAMS += relro_script_test
relro_script_test_SOURCES = relro_test_main.cc
relro_script_test_DEPENDENCIES = gcctestdir/ld relro_script_test.so
relro_script_test_LDFLAGS = -Bgcctestdir/ -Wl,-R,.
relro_script_test_LDADD = relro_script_test.so
relro_script_test.so: gcctestdir/ld relro_script_test.t relro_test_pic.o
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-z,relro -T $(srcdir)/relro_script_test.t relro_test_pic.o

check_PROGRAMS += script_test_1
script_test_1_SOURCES = script_test_1.cc
script_test_1_DEPENDENCIES = gcctestdir/ld script_test_1.t
script_test_1_LDFLAGS = -Bgcctestdir/ -Wl,-R,. -T $(srcdir)/script_test_1.t

check_PROGRAMS += script_test_2
script_test_2_SOURCES = script_test_2.cc script_test_2a.cc script_test_2b.cc
script_test_2_DEPENDENCIES = gcctestdir/ld script_test_2.t
script_test_2_LDFLAGS = -Bgcctestdir/ -Wl,-R,. -T $(srcdir)/script_test_2.t

check_PROGRAMS += justsyms
justsyms_SOURCES = justsyms_1.cc
justsyms_DEPENDENCIES = gcctestdir/ld justsyms_2r.o
justsyms_LDFLAGS = -Bgcctestdir/ -Wl,-R,justsyms_2r.o
justsyms_2.o: justsyms_2.cc
	$(CXXCOMPILE) -c -o $@ $<
justsyms_2r.o: justsyms_2.o gcctestdir/ld $(srcdir)/justsyms.t
	gcctestdir/ld -o $@ -r -T $(srcdir)/justsyms.t justsyms_2.o

check_PROGRAMS += binary_test
MOSTLYCLEANFILES += binary.txt
binary_test_SOURCES = binary_test.cc
binary_test_DEPENDENCIES = gcctestdir/ld binary.txt
binary_test_LDFLAGS = -Bgcctestdir/ -Wl,--format,binary,binary.txt,--format,elf
# Copy the file to the build directory to avoid worrying about the
# full pathname in the generated symbols.
binary.txt: $(srcdir)/binary.in
	rm -f $@
	$(LN_S) $< $@

check_SCRIPTS += ver_matching_test.sh
check_DATA += ver_matching_test.stdout
MOSTLYCLEANFILES += ver_matching_test.stdout
ver_matching_def.so: ver_matching_def.cc gcctestdir/ld
	$(CXXLINK) -O0 -Bgcctestdir/ -shared $(srcdir)/ver_matching_def.cc -Wl,--version-script=$(srcdir)/version_script.map
ver_matching_test.stdout: ver_matching_def.so
	$(TEST_OBJDUMP) -T ver_matching_def.so | $(TEST_CXXFILT) > ver_matching_test.stdout

check_PROGRAMS += script_test_3
check_SCRIPTS += script_test_3.sh
check_DATA += script_test_3.stdout
MOSTLYCLEANFILES += script_test_3.stdout
script_test_3: basic_test.o gcctestdir/ld script_test_3.t
	$(CXXLINK) -Bgcctestdir/ basic_test.o -T $(srcdir)/script_test_3.t
script_test_3.stdout: script_test_3
	$(TEST_READELF) -SlW script_test_3 > script_test_3.stdout

check_SCRIPTS += script_test_4.sh
check_DATA += script_test_4.stdout
MOSTLYCLEANFILES += script_test_4
script_test_4: basic_test.o gcctestdir/ld $(srcdir)/script_test_4.t
	$(CXXLINK) -Bgcctestdir/ basic_test.o -T $(srcdir)/script_test_4.t
script_test_4.stdout: script_test_4
	$(TEST_READELF) -SlW script_test_4 > script_test_4.stdout

check_SCRIPTS += script_test_5.sh
check_DATA += script_test_5.stdout
MOSTLYCLEANFILES += script_test_5
script_test_5: script_test_5.o gcctestdir/ld $(srcdir)/script_test_5.t
	$(CXXLINK) -Bgcctestdir/ script_test_5.o -T $(srcdir)/script_test_5.t
script_test_5.stdout: script_test_5
	$(TEST_READELF) -SW script_test_5 > script_test_5.stdout

# Test --dynamic-list, --dynamic-list-data, --dynamic-list-cpp-new,
# and --dynamic-list-cpp-typeinfo

check_SCRIPTS += dynamic_list.sh
check_DATA += dynamic_list.stdout
MOSTLYCLEANFILES += dynamic_list dynamic_list.stdout
dynamic_list: basic_test.o gcctestdir/ld $(srcdir)/dynamic_list.t
	$(CXXLINK) -Bgcctestdir/ basic_test.o \
	  -Wl,--dynamic-list $(srcdir)/dynamic_list.t \
	  -Wl,--dynamic-list-data \
	  -Wl,--dynamic-list-cpp-new \
	  -Wl,--dynamic-list-cpp-typeinfo
dynamic_list.stdout: dynamic_list
	$(TEST_READELF) -DWs dynamic_list > dynamic_list.stdout

check_PROGRAMS += thin_archive_test_1
MOSTLYCLEANFILES += libthin1.a libthin3.a libthinall.a \
	alt/thin_archive_test_2.o alt/thin_archive_test_4.o \
	alt/libthin2.a alt/libthin4.a
thin_archive_test_1_SOURCES = thin_archive_main.cc
thin_archive_test_1_DEPENDENCIES = gcctestdir/ld libthin1.a alt/libthin2.a
thin_archive_test_1_LDFLAGS = -Bgcctestdir/ -Lalt
thin_archive_test_1_LDADD = libthin1.a -lthin2

check_PROGRAMS += thin_archive_test_2
thin_archive_test_2_SOURCES = thin_archive_main.cc
thin_archive_test_2_DEPENDENCIES = gcctestdir/ld libthinall.a
thin_archive_test_2_LDFLAGS = -Bgcctestdir/ -L.
thin_archive_test_2_LDADD = -lthinall

libthin1.a: thin_archive_test_1.o alt/thin_archive_test_2.o
	rm -f $@
	$(TEST_AR) crT $@ $^
alt/libthin2.a: thin_archive_test_3.o alt/thin_archive_test_4.o
	rm -f $@
	$(TEST_AR) crT $@ $^
libthin3.a: thin_archive_test_1.o alt/thin_archive_test_4.o
	rm -f $@
	$(TEST_AR) crT $@ $^
alt/libthin4.a: alt/thin_archive_test_2.o thin_archive_test_3.o
	rm -f $@
	$(TEST_AR) crT $@ $^
libthinall.a: libthin3.a alt/libthin4.a
	rm -f $@
	$(TEST_AR) crT $@ $^
alt/thin_archive_test_2.o: thin_archive_test_2.cc
	test -d alt || mkdir -p alt
	$(CXXCOMPILE) -c -o $@ $<
alt/thin_archive_test_4.o: thin_archive_test_4.cc
	test -d alt || mkdir -p alt
	$(CXXCOMPILE) -c -o $@ $<

if PLUGINS

check_PROGRAMS += plugin_test_1
check_SCRIPTS += plugin_test_1.sh
check_DATA += plugin_test_1.err
MOSTLYCLEANFILES += plugin_test_1.err
plugin_test_1: two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_test_2.syms empty.syms gcctestdir/ld plugin_test.so
	$(CXXLINK) -Bgcctestdir/ -Wl,--no-demangle,--plugin,"./plugin_test.so",--plugin-opt,"_Z4f13iv" two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_test_2.syms empty.syms 2>plugin_test_1.err
plugin_test_1.err: plugin_test_1
	@touch plugin_test_1.err

check_PROGRAMS += plugin_test_2
check_SCRIPTS += plugin_test_2.sh
check_DATA += plugin_test_2.err
MOSTLYCLEANFILES += plugin_test_2.err
plugin_test_2: two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_shared_2.so gcctestdir/ld plugin_test.so
	$(CXXLINK) -Bgcctestdir/ -Wl,--no-demangle,-R,.,--plugin,"./plugin_test.so" two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_shared_2.so 2>plugin_test_2.err
plugin_test_2.err: plugin_test_2
	@touch plugin_test_2.err

check_PROGRAMS += plugin_test_3
check_SCRIPTS += plugin_test_3.sh
check_DATA += plugin_test_3.err
MOSTLYCLEANFILES += plugin_test_3.err
plugin_test_3: two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_test_2.syms empty.syms gcctestdir/ld plugin_test.so
	$(CXXLINK) -Bgcctestdir/ -Wl,--export-dynamic -Wl,--no-demangle,--plugin,"./plugin_test.so",--plugin-opt,"_Z4f13iv" two_file_test_main.o two_file_test_1.syms two_file_test_1b.syms two_file_test_2.syms empty.syms 2>plugin_test_3.err
plugin_test_3.err: plugin_test_3
	@touch plugin_test_3.err

check_PROGRAMS += plugin_test_4
check_SCRIPTS += plugin_test_4.sh
check_DATA += plugin_test_4.err
MOSTLYCLEANFILES += plugin_test_4.a plugin_test_4.err
plugin_test_4: two_file_test_main.o plugin_test_4.a gcctestdir/ld plugin_test.so
	$(CXXLINK) -Bgcctestdir/ -Wl,--no-demangle,--plugin,"./plugin_test.so",--plugin-opt,"_Z4f13iv" two_file_test_main.o -Wl,--whole-archive,plugin_test_4.a,--no-whole-archive 2>plugin_test_4.err
plugin_test_4.err: plugin_test_4
	@touch plugin_test_4.err

plugin_test_4.a: two_file_test_1.syms two_file_test_1b.syms two_file_test_2.syms
	$(TEST_AR) cr $@ $^

plugin_test.so: plugin_test.o
	$(LINK) -Bgcctestdir/ -shared plugin_test.o
plugin_test.o: plugin_test.c
	$(COMPILE) -O0 -c -fpic -o $@ $<

two_file_test_main.syms: two_file_test_main.o
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
two_file_test_1.syms: two_file_test_1.o
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
two_file_test_1b.syms: two_file_test_1b.o
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
two_file_test_2.syms: two_file_test_2.o
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
empty.syms:
	@echo "" >empty.syms
	@echo "Symbol table" >>empty.syms

endif PLUGINS

check_PROGRAMS += exclude_libs_test
check_SCRIPTS += exclude_libs_test.sh
check_DATA += exclude_libs_test.syms
MOSTLYCLEANFILES += exclude_libs_test.syms libexclude_libs_test_1.a \
        libexclude_libs_test_2.a alt/libexclude_libs_test_3.a
exclude_libs_test_SOURCES = exclude_libs_test.c
exclude_libs_test_DEPENDENCIES = gcctestdir/ld libexclude_libs_test_1.a \
	libexclude_libs_test_2.a alt/libexclude_libs_test_3.a
exclude_libs_test_LDFLAGS = -Bgcctestdir/ -L. -Lalt \
	-Wl,--exclude-libs,dummy:libexclude_libs_test_1 \
	-Wl,--exclude-libs,libexclude_libs_test_3
exclude_libs_test_LDADD = -lexclude_libs_test_1 -lexclude_libs_test_2 \
	alt/libexclude_libs_test_3.a
exclude_libs_test.syms: exclude_libs_test
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
libexclude_libs_test_1.a: exclude_libs_test_1.o
	$(TEST_AR) rc $@ $^
libexclude_libs_test_2.a: exclude_libs_test_2.o
	$(TEST_AR) rc $@ $^
alt/libexclude_libs_test_3.a: exclude_libs_test_3.o
	test -d alt || mkdir -p alt
	$(TEST_AR) rc $@ $^

check_PROGRAMS += local_labels_test
local_labels_test.o: ver_test_6.c
	$(COMPILE) -g -c -Wa,-L -o $@ $<
local_labels_test: local_labels_test.o
	$(LINK) -Bgcctestdir/ local_labels_test.o

check_PROGRAMS += discard_locals_test
check_SCRIPTS += discard_locals_test.sh
check_DATA += discard_locals_test.syms
MOSTLYCLEANFILES += discard_locals_test.syms
discard_locals_test_SOURCES = discard_locals_test.c
discard_locals_test_LDFLAGS = -Bgcctestdir/ -Wl,--discard-locals
discard_locals_test.syms: discard_locals_test
	$(TEST_READELF) -sW $< >$@ 2>/dev/null
# '-Wa,-L' is required to preserve the local label used for testing.
discard_locals_test.o: discard_locals_test.c
	$(COMPILE) -c -Wa,-L -o $@ $<

if MCMODEL_MEDIUM
check_PROGRAMS += large
large_SOURCES = large.c
large_CFLAGS = -mcmodel=medium
large_DEPENDENCIES = gcctestdir/ld
large_LDFLAGS = -Bgcctestdir/
endif MCMODEL_MEDIUM

# Test that hidden and internal symbols in the main program cannot be
# referenced by a shared library.
check_SCRIPTS += hidden_test.sh
check_DATA += hidden_test.err
MOSTLYCLEANFILES += hidden_test hidden_test.err
libhidden.so: hidden_test_1.c gcctestdir/ld
	$(COMPILE) -Bgcctestdir/ -g -shared -fPIC -w -o $@ $(srcdir)/hidden_test_1.c
hidden_test: hidden_test_main.o libhidden.so gcctestdir/ld
	$(LINK) -Bgcctestdir/ -Wl,-R,. hidden_test_main.o libhidden.so 2>hidden_test.err
hidden_test.err: hidden_test
	@touch hidden_test.err

# Test -retain-symbols-file.
check_SCRIPTS += retain_symbols_file_test.sh
check_DATA += retain_symbols_file_test.stdout
MOSTLYCLEANFILES += retain_symbols_file_test retain_symbols_file_test.in \
                    retain_symbols_file_test.stdout
retain_symbols_file_test.so: basic_pic_test.o gcctestdir/ld
	echo 'main' > retain_symbols_file_test.in
	echo 't1' >> retain_symbols_file_test.in
	echo '_ZN4t16bC1Ev' >> retain_symbols_file_test.in
	echo '_ZNK4t20a3getEv' >> retain_symbols_file_test.in
	echo '_Z3t18v' >> retain_symbols_file_test.in
	echo '__tcf_0' >> retain_symbols_file_test.in	
	$(CXXLINK) -Bgcctestdir/ -shared -Wl,-retain-symbols-file,retain_symbols_file_test.in basic_pic_test.o
retain_symbols_file_test.stdout: retain_symbols_file_test.so
	$(TEST_NM) -C retain_symbols_file_test.so > $@


# Test that if the output file already exists and is empty,
# it will get execute permission.
check_PROGRAMS += permission_test
permission_test: basic_test.o gcctestdir/ld
	umask 022; \
	rm -f $@; \
	touch $@; \
	chmod 600 $@; \
	$(CXXLINK) -Bgcctestdir/ basic_test.o

# Check -l:foo.a
check_PROGRAMS += searched_file_test
MOSTLYCLEANFILES += searched_file_test searched_file_test_lib.o \
                    alt/searched_file_test_lib.a
searched_file_test_SOURCES = searched_file_test.cc
searched_file_test_DEPENDENCIES = alt/searched_file_test_lib.a
searched_file_test_LDFLAGS = -Bgcctestdir/ -Lalt
searched_file_test_LDADD = -l:searched_file_test_lib.a
searched_file_test_lib.o: searched_file_test_lib.cc
	$(CXXCOMPILE) -c -o $@ $<
alt/searched_file_test_lib.a: searched_file_test_lib.o
	test -d alt || mkdir -p alt
	$(TEST_AR) rc $@ $^

endif GCC
endif NATIVE_LINKER

# These tests work with cross linkers.

if DEFAULT_TARGET_I386

check_SCRIPTS += split_i386.sh
check_DATA += split_i386_1.stdout split_i386_2.stdout \
	split_i386_3.stdout split_i386_4.stdout split_i386_r.stdout
SPLIT_DEFSYMS = --defsym __morestack=0x100 --defsym __morestack_non_split=0x200
split_i386_1.o: split_i386_1.s
	$(TEST_AS) -o $@ $<
split_i386_2.o: split_i386_2.s
	$(TEST_AS) -o $@ $<
split_i386_3.o: split_i386_3.s
	$(TEST_AS) -o $@ $<
split_i386_4.o: split_i386_4.s
	$(TEST_AS) -o $@ $<
split_i386_n.o: split_i386_n.s
	$(TEST_AS) -o $@ $<
split_i386_1: split_i386_1.o split_i386_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_i386_1.o split_i386_n.o
split_i386_1.stdout: split_i386_1
	$(TEST_OBJDUMP) -d $< > $@
split_i386_2: split_i386_2.o split_i386_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_i386_2.o split_i386_n.o
split_i386_2.stdout: split_i386_2
	$(TEST_OBJDUMP) -d $< > $@
split_i386_3.stdout: split_i386_3.o split_i386_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o split_i386_3 split_i386_3.o split_i386_n.o > $@ 2>&1 || exit 0
split_i386_4: split_i386_4.o split_i386_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_i386_4.o split_i386_n.o
split_i386_4.stdout: split_i386_4
	$(TEST_OBJDUMP) -d $< > $@
split_i386_r.stdout: split_i386_1.o split_i386_n.o ../ld-new
	../ld-new -r split_i386_1.o split_i386_n.o -o split_i386_r > $@ 2>&1 || exit 0
MOSTLYCLEANFILES += split_i386_1 split_i386_2 split_i386_3 \
	split_i386_4 split_i386_r

endif DEFAULT_TARGET_I386

if DEFAULT_TARGET_X86_64

check_SCRIPTS += split_x86_64.sh
check_DATA += split_x86_64_1.stdout split_x86_64_2.stdout \
	split_x86_64_3.stdout split_x86_64_4.stdout split_x86_64_r.stdout
SPLIT_DEFSYMS = --defsym __morestack=0x100 --defsym __morestack_non_split=0x200
split_x86_64_1.o: split_x86_64_1.s
	$(TEST_AS) -o $@ $<
split_x86_64_2.o: split_x86_64_2.s
	$(TEST_AS) -o $@ $<
split_x86_64_3.o: split_x86_64_3.s
	$(TEST_AS) -o $@ $<
split_x86_64_4.o: split_x86_64_4.s
	$(TEST_AS) -o $@ $<
split_x86_64_n.o: split_x86_64_n.s
	$(TEST_AS) -o $@ $<
split_x86_64_1: split_x86_64_1.o split_x86_64_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_x86_64_1.o split_x86_64_n.o
split_x86_64_1.stdout: split_x86_64_1
	$(TEST_OBJDUMP) -d $< > $@
split_x86_64_2: split_x86_64_2.o split_x86_64_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_x86_64_2.o split_x86_64_n.o
split_x86_64_2.stdout: split_x86_64_2
	$(TEST_OBJDUMP) -d $< > $@
split_x86_64_3.stdout: split_x86_64_3.o split_x86_64_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o split_x86_64_3 split_x86_64_3.o split_x86_64_n.o > $@ 2>&1 || exit 0
split_x86_64_4: split_x86_64_4.o split_x86_64_n.o ../ld-new
	../ld-new $(SPLIT_DEFSYMS) -o $@ split_x86_64_4.o split_x86_64_n.o
split_x86_64_4.stdout: split_x86_64_4
	$(TEST_OBJDUMP) -d $< > $@
split_x86_64_r.stdout: split_x86_64_1.o split_x86_64_n.o ../ld-new
	../ld-new -r split_x86_64_1.o split_x86_64_n.o -o split_x86_64_r > $@ 2>&1 || exit 0
MOSTLYCLEANFILES += split_x86_64_1 split_x86_64_2 split_x86_64_3 \
	split_x86_64_4 split_x86_64_r

endif DEFAULT_TARGET_X86_64
