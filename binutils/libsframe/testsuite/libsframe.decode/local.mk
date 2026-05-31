check_PROGRAMS =
if HAVE_COMPAT_DEJAGNU
  check_PROGRAMS += %D%/be-flipping %D%/be-flipping-v3 \
                    %D%/frecnt-1 %D%/frecnt-2 %D%/frecnt-v2
endif

%C%_be_flipping_SOURCES = %D%/be-flipping.c
%C%_be_flipping_LDADD = $(testsuite_LDADD)
%C%_be_flipping_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_be_flipping_v3_SOURCES = %D%/be-flipping-v3.c
%C%_be_flipping_v3_LDADD = $(testsuite_LDADD)
%C%_be_flipping_v3_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_frecnt_1_SOURCES = %D%/frecnt-1.c
%C%_frecnt_1_LDADD = $(testsuite_LDADD)
%C%_frecnt_1_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_frecnt_2_SOURCES = %D%/frecnt-2.c
%C%_frecnt_2_LDADD = $(testsuite_LDADD)
%C%_frecnt_2_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_frecnt_v2_SOURCES = %D%/frecnt-v2.c
%C%_frecnt_v2_LDADD = $(testsuite_LDADD)
%C%_frecnt_v2_CPPFLAGS = $(testsuite_CPPFLAGS)
