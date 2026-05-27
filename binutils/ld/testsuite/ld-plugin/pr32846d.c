extern void kmod_new (void);
extern void mkdir_parents (void);
void
do_lsmod (void)
{
  kmod_new ();
}
void
do_static_nodes (void)
{
  mkdir_parents();
}
