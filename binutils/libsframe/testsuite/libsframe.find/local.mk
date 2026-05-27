if HAVE_COMPAT_DEJAGNU
  check_PROGRAMS += %D%/findfre-1 %D%/findfre-flex-1 %D%/findfunc-1 %D%/plt-findfre-1
  check_PROGRAMS += %D%/plt-findfre-2
endif

%C%_findfre_1_SOURCES = %D%/findfre-1.c
%C%_findfre_1_LDADD = $(testsuite_LDADD)
%C%_findfre_1_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_findfre_flex_1_SOURCES = %D%/findfre-flex-1.c
%C%_findfre_flex_1_LDADD = $(testsuite_LDADD)
%C%_findfre_flex_1_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_findfunc_1_SOURCES = %D%/findfunc-1.c
%C%_findfunc_1_LDADD = $(testsuite_LDADD)
%C%_findfunc_1_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_plt_findfre_1_SOURCES = %D%/plt-findfre-1.c
%C%_plt_findfre_1_LDADD = $(testsuite_LDADD)
%C%_plt_findfre_1_CPPFLAGS = $(testsuite_CPPFLAGS)

%C%_plt_findfre_2_SOURCES = %D%/plt-findfre-2.c
%C%_plt_findfre_2_LDADD = $(testsuite_LDADD)
%C%_plt_findfre_2_CPPFLAGS = $(testsuite_CPPFLAGS)
