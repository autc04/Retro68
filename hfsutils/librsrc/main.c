# include <stdio.h>
# include <unistd.h>
# include <fcntl.h>

# include "hfs.h"
# include "rsrc.h"

static
void die(const char *msg)
{
  perror(msg);
  exit(2);
}

long rseek(void *file, long where, int whence)
{
  printf("SEEK %lu\n", where);
  return hfs_seek(file, where, whence);
}

long rread(void *file, void *block, unsigned long howmuch)
{
  printf("READ %lu\n", howmuch);
  return hfs_read(file, block, howmuch);
}

struct rsrcprocs fileprocs = {
  (rsrcseekfunc)  rseek,
  (rsrcreadfunc)  rread,
  (rsrcwritefunc) hfs_write
};

int main(int argc, char *argv[])
{
  hfsvol *vol;
  hfsfile *file;
  rsrcfile *rfile;
  int i;

  if (argc < 3)
    {
      fprintf(stderr, "Args: vol file\n");
      exit(1);
    }

  vol = hfs_mount(argv[1], 1, HFS_MODE_ANY);
  if (vol == 0)
    die(hfs_error);

  file = hfs_open(vol, argv[2]);
  if (file == 0 || hfs_setfork(file, 1) == -1)
    die(hfs_error);

  rfile = rsrc_init(file, &fileprocs);
  if (rfile == 0)
    die(rsrc_error);

  /* ... */

  for (i = rsrc_counttypes(rfile); i > 0; --i)
    {
      char type[5];
      int count;

      rsrc_gettype(rfile, i, type);
      count = rsrc_count(rfile, type);

      while (count > 0)
	{
	  unsigned char *data;
	  unsigned long len;
	  FILE *hex;

	  data = rsrc_getind(rfile, type, count);
	  if (data)
	    {
	      len = rsrc_size(data);

	      printf("'%s' %d: %lu byte%s\n", type, count, len,
		     len == 1 ? "" : "s");
	      fflush(stdout);

	      hex = popen("hex", "w");
	      if (hex == 0)
		die("error forking `hex'");

	      fwrite(data, len, 1, hex);
	      fclose(hex);

	      rsrc_release(data);
	    }
	  else
	    {
	      printf("%5d: %s\n", count, rsrc_error);
	      fflush(stdout);
	    }

	  --count;
	}
    }

  /* ... */

  if (rsrc_finish(rfile) == -1)
    die(rsrc_error);

  if (hfs_close(file) == -1 ||
      hfs_umount(vol) == -1)
    die(hfs_error);

  return 0;
}
