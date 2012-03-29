#include <Processes.h>
#include <Sound.h>
#include <Memory.h>

int main(int argc, char* argv[]);

struct flat_hdr {
	char magic[4];
	unsigned long rev;          /* version */
	unsigned long entry;        /* Offset of first executable instruction
	                               with text segment from beginning of file */
	unsigned long data_start;   /* Offset of data segment from beginning of
	                               file */
	unsigned long data_end;     /* Offset of end of data segment
	                               from beginning of file */
	unsigned long bss_end;      /* Offset of end of bss segment from beginning
	                               of file */

	/* (It is assumed that data_end through bss_end forms the bss segment.) */

	unsigned long stack_size;   /* Size of stack, in bytes */
	unsigned long reloc_start;  /* Offset of relocation records from
	                               beginning of file */
	unsigned long reloc_count;  /* Number of relocation records */
	unsigned long flags;       
	unsigned long filler[6];    /* Reserved, set to zero */
};

typedef void (*voidFunction)(void);
//extern voidFunction __init_array_start[];
//extern voidFunction __init_array_end[];
extern void __init_section(void);
extern void __init_section_end(void);
extern void __fini_section(void);
extern void __fini_section_end(void);



void _start()
{
   char *argv[2] = { "./a.out", NULL };


   long virtualstart, realstart;

   __asm__( "move.l #_start, %0" : "=r"(virtualstart) );
   __asm__( "lea (_start:w,%%pc), %0" : "=a"(realstart) );

   long displacement = realstart - virtualstart; 

   struct flat_hdr *header = (struct flat_hdr*) (displacement - 0x40);

   Ptr bss = NewPtrClear(header->bss_end - header->data_end);

   long n = header->reloc_count;
   long *relocs = (long*)( (char*)header + header->reloc_start );
   long i;
   long data_end = header->data_end - 0x40;
   long bss_displacement = (long)bss - data_end;

   for(i = 0; i < n; i++)
   {
      long *addr = (long*)(relocs[i] + displacement);
      *addr += (*addr >= data_end ? bss_displacement : displacement);
   }

  /* {
      voidFunction *p;
      for(p = __init_array_start; p < __init_array_end; ++p)
         (**p)();
   }*/
   //__init_section();
   {
      char *p = (char*)&__init_section;
      char *e = (char*)&__init_section_end;
      p += 2;
      while( p < e )
      {
         (*(voidFunction)(*(long*)p))();
         p += 6;
      }
   }

   main(displacement, argv);
   ExitToShell();
}
