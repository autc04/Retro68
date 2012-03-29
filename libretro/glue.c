#include <MacMemory.h>

Size GetPtrSize(Ptr ptr)
{
   long tmp;
   __asm__ __volatile__(
      "move.l %1, %%a0\n\t"
      "dc.w 0xA021\n\t"
      "move.l %%d0, %1"
      : "=g"(tmp) : "g"(ptr) : "%%a0", "%%d0");
   if(tmp > 0)
      return (Size) tmp;
   else
      return 0;
}
