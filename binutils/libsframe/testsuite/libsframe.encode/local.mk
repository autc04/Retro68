if HAVE_COMPAT_DEJAGNU
  check_PROGRAMS += %D%/encode-1
endif

%C%_encode_1_SOURCES = %D%/encode-1.c
%C%_encode_1_LDADD = $(testsuite_LDADD)
%C%_encode_1_CPPFLAGS = $(testsuite_CPPFLAGS)
