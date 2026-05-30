/* Determine whether libctf/33339 is fixed, if and only if GCC PR 121411 is also
   fixed.  */

#include "config.h"
#include <ctf-api.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Determine whether the passed-in struct's member's offsets ever descend.  */
static int
offsets_ascending (ctf_dict_t *fp, ctf_id_t type)
{
  ctf_next_t *it = NULL;
  ssize_t offset, last_offset = 0;

  while ((offset = ctf_member_next (fp, type, &it, NULL, NULL, 0)) >= 0)
    {
      if (offset < last_offset)
	return 0;
      last_offset = offset;
    }
  if (ctf_errno (fp) != ECTF_NEXT_END)
    {
      fprintf (stderr, "Cannot check member offsets: %s\n",
	       ctf_errmsg (ctf_errno (fp)));
      exit (0);
    }

  return 1;
}

int
main (int argc, char *argv[])
{
  ctf_archive_t *ctf;
  ctf_dict_t *fp;
  ctf_id_t type;
  int err;

  if (argc != 3)
    {
      fprintf (stderr, "Syntax: %s PROGRAM OBJ\n", argv[0]);
      exit(1);
    }

  /* Check for bugginess of compiler.  */

  if ((ctf = ctf_open (argv[2], NULL, &err)) == NULL)
    {
      fprintf (stderr, "Cannot open compiler object file %s: %s\n",
	       argv[2], ctf_errmsg (err));
      exit (1);
    }

  /* Verify that offsets only ascend.  */

  if ((fp = ctf_arc_lookup_symbol_name (ctf, "huge_used", &type, &err)) == NULL)
    {
      fprintf (stderr, "UNSUPPORTED: compiler does not provide expected symbol.\n");
      exit (0);
    }

  if (!offsets_ascending (fp, type))
    {
      fprintf (stderr, "UNSUPPORTED: GCC bug PR121411 detected.\n");
      exit (0);
    }

  ctf_dict_close (fp);
  ctf_close (ctf);

  /* Check if test is disabled (e.g. on 32-bit).  */

  if ((ctf = ctf_open (argv[1], NULL, &err)) == NULL)
    {
      fprintf (stderr, "Cannot open linked binary test file %s: %s\n",
	       argv[1], ctf_errmsg (err));
      exit (1);
    }

  if ((fp = ctf_arc_lookup_symbol_name (ctf, "test_disabled", &type, &err)) != NULL)
    {
      fprintf (stderr, "UNSUPPORTED: test not necessary on 32-bit targets.\n");
      exit (0);
    }

  if ((fp = ctf_arc_lookup_symbol_name (ctf, "big_used", &type, &err)) == NULL)
    {
      fprintf (stderr, "big struct symbol not found.\n");
      exit (1);
    }

  if (!offsets_ascending (fp, type))
    {
      fprintf (stderr, "large struct offsets incorrect.\n");
      exit (1);
    }
  ctf_dict_close (fp);

  if ((fp = ctf_arc_lookup_symbol_name (ctf, "huge_used", &type, &err)) == NULL)
    {
      fprintf (stderr, "huge struct symbol not found.\n");
      exit (1);
    }

  if (!offsets_ascending (fp, type))
    {
      fprintf (stderr, "huge struct offsets incorrect.\n");
      exit (1);
    }

  ctf_dict_close (fp);
  ctf_close (ctf);

  fprintf (stderr, "Large and huge structs working fine.\n");
  exit (0);
}
