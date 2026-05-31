#if defined (__SIZEOF_PTRDIFF_T__) && __SIZEOF_PTRDIFF_T__ > 4

#define CONCAT_(a,b) a ## b
#define CONCAT(a,b) CONCAT_(a, b)
#define COUNT(name) CONCAT(name, __COUNTER__)
#define MEMBNAME const char COUNT(memb)[1024 * 1024]
#define MEMB10					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;					\
  MEMBNAME;

#define MEMB100					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10					\
  MEMB10

#define MEMB1000				\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100					\
  MEMB100

#define MEMB10000				\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000					\
  MEMB1000

struct big
{
  MEMB1000;
};

struct huge
{
  MEMB10000;
};

struct big big_used;
struct huge huge_used;

#else

int test_disabled;

#endif
