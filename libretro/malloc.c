#include <stdlib.h>
#include <errno.h>
#include <reent.h>
#include <string.h>
#include <MacMemory.h>

void referenceMyMalloc() {}

void *_malloc_r(struct _reent *reent_ptr, size_t sz)
{
   return NewPtr(sz); // TODO: set errno
}
void *_calloc_r(struct _reent *reent_ptr, size_t sz, size_t sz2)
{
   return NewPtrClear(sz*sz2); // TODO: set errno
}

void _free_r(struct _reent *reent_ptr, void *ptr)
{
   if(ptr != NULL)
      DisposePtr(ptr);
}

void *_realloc_r(struct _reent *reent_ptr, void *ptr, size_t sz)
{
   if(ptr == NULL)
   {
      return NewPtr(sz);
   }
   else
   {
      MemError();
      SetPtrSize(ptr, sz);
      if(MemError())
      {
         size_t oldSz = GetPtrSize(ptr);
         if(sz > oldSz)
         {
            void *newPtr = NewPtr(sz);
            if(!newPtr)
            {
               errno = ENOMEM;
               return NULL;
            }
            memcpy(newPtr, ptr, oldSz);
            return newPtr;
         }
         else
         {
            errno = ENOMEM;
            return NULL;
         }
      }
   }
}

void *malloc(size_t sz)
{
   return _malloc_r(_REENT, sz);
}

void free(void *p)
{
   _free_r(_REENT, p);
}

void *realloc(void *ptr, size_t sz)
{
   return _realloc_r(_REENT, ptr, sz);
}

void *calloc(size_t sz1, size_t sz2)
{
   return _calloc_r(_REENT, sz1, sz2);
}
