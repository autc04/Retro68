/* { dg-do compile } */
/* { dg-options "-O2 -w" } */
typedef unsigned int hashval_t;
enum ETYPE
{
  ETYPE_ARRAY, ETYPE_STRUCT, ETYPE_UNION,
};
struct entry
{
  enum ETYPE etype:8;
  unsigned short len;
  const char *attrib;
};
hashval_t iterative_hash (const struct entry *, __SIZE_TYPE__, hashval_t);
hashval_t
e_hash (const void *a)
{
  const struct entry *e = a;
  hashval_t ret = 0;
  int i;
  if (e[0].etype != ETYPE_STRUCT && e[0].etype != ETYPE_UNION)
    __builtin_abort ();
  for (i = 0; i <= e[0].len; ++i)
    {
      ret = iterative_hash (&e[i], __builtin_offsetof (struct entry, attrib), ret);
    }
  return ret;
}
