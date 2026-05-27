#
# These are the minimum required stubs to support newlib
# for embedded MIPS targets.  Note that although read.o and write.o
# are mentioned here, they are not used for all targets.
#
close.o: ${srcdir}/../close.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
fstat.o: ${srcdir}/../fstat.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
getpid.o: ${srcdir}/../getpid.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
isatty.o: ${srcdir}/../isatty.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
kill.o: ${srcdir}/../kill.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
lseek.o: ${srcdir}/../lseek.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
open.o: ${srcdir}/../open.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
print.o: ${srcdir}/../print.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
putnum.o: ${srcdir}/../putnum.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
read.o: ${srcdir}/../read.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
stat.o: ${srcdir}/../stat.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
unlink.o: ${srcdir}/../unlink.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
write.o: ${srcdir}/../write.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
get_ram_range.o: ${srcdir}/hal/get_ram_range.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?
link.o: $(srcdir)/hal/link.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $?

# These are the UHI implementations of semi-hosting functions

uhi_getargs.o: $(srcdir)/uhi/uhi_getargs.S
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $<
uhi_%.o: $(srcdir)/uhi/uhi_%.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $<

# These are the YAMON specific versions of semi-hosting which fall
# back to UHI for operations not supported natively on YAMON
yamon_%.o: $(srcdir)/uhi/yamon_%.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $<

# Exception and interrupt handling support
mips_excpt_handler.o: $(srcdir)/hal/mips_excpt_handler.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) -DVERBOSE_EXCEPTIONS=1 $(INCLUDES) -c $(CFLAGS) $<
mips_excpt_handler_quiet.o: $(srcdir)/hal/mips_excpt_handler.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $< -o $@
%.o: $(srcdir)/hal/%.S
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $< -o $@
%.o: $(srcdir)/hal/%.c
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $< -o $@
mips_excpt_isr_000.o:
	$(CC) $(CFLAGS_FOR_TARGET) $(HALCFLAGS) $(INCLUDES) $(CFLAGS) -c -DDEF=__isr_vec_000 -DREF=__isr_vec_000 -DISR=_mips_isr_000 -DZERO ${srcdir}/hal/mips_excpt_isr_fragment.S -o $@
mips_excpt_isr_%.o:
	$(CC) $(CFLAGS_FOR_TARGET) $(HALCFLAGS) $(INCLUDES) $(CFLAGS) -c -DDEF=__isr_vec_$* -DREF=__isr_vec_$(shell printf '%03d' `expr $* - 1`) -DISR=_mips_isr_$* ${srcdir}/hal/mips_excpt_isr_fragment.S -o $@

# Boot code
%.o: $(srcdir)/boot/%.S
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(HALCFLAGS) $(INCLUDES) -c $(CFLAGS) $<
