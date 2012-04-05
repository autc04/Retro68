#include <stdio.h>
#include <string.h>
#include <string>
#include <sstream>
#include <cstdlib>
#include <iostream>

#include <Quickdraw.h>
#include <MacMemory.h>
#include <Sound.h>
#include <Events.h>
#include <Fonts.h>

#include "Console.h"

QDGlobals qd;
__attribute((constructor))
void cons()
{
   SysBeep(20);
}

//float something = 6.0;

class Foo
{
};

void foobar()
{
   throw Foo();
}

void foobaz()
{
}

extern ssize_t (*__write_hook)(int fd, const void*buf, size_t count);

extern "C" ssize_t consolewrite(int fd, const void *buf, size_t count)
{
   const char *p = (const char*)buf;
   for(int i = 0; i < count; i++)
      Console::currentInstance->putch(*p++);
   return count;
}

int main(int argc, char** argv)
{
   //GrafPort port;
   WindowPtr win;
   InitGraf(&qd.thePort);
   InitFonts();
   InitWindows();
   InitMenus();
   
   Rect r;
   SetRect(&r, qd.screenBits.bounds.left + 5, qd.screenBits.bounds.top + 45, qd.screenBits.bounds.right - 5, qd.screenBits.bounds.bottom -5);
   win = NewWindow(NULL, &r, (unsigned char*)"", true, 0, (WindowPtr)-1, false, 0);
   
   SetPort(win);
   EraseRect(&win->portRect);
   new char[32];
   Console console(win, win->portRect);
   __write_hook = &consolewrite;
   console.putch('x');
   console.putch('a');
   console.putch('b');
   console.putch('c');
   console.putch('a');
   console.putch('a');
   Console::currentInstance->putch('Y');
   printf("Hello...\n");
   console.putch('b');
   console.putch('\n');

   std::cout << "Hello, world.\n";
   printf("Hello, world.\n");
   console.putch('a');
   Console::currentInstance->putch('Y');
   
   /*std::cout << "X\n";
   for(int i = 1; i <= 100; i++)
      std::cout << "Hello, world: "  << i  << std::endl;
   std::cout << std::flush;

   std::cout << "Say something: " << std::flush;*/
   printf("Say something: ");
   fflush(stdout);
   printf("You said: %s\n", console.ReadLine().c_str());

   for(int i = 0; i < 5; i++)
   {
      //std::cout << "Exception speed test: " << std::flush;
      printf("Exception speed test: "); fflush(stdout);
      long start = TickCount();
      try { foobar(); } catch(...) {}
      long end = TickCount();
      //std::cout << (end-start)*1000 / 60.0 << " ms\n";
      printf("%g\n",(end-start)*1000 / 60.0); 
   }
   //std::cout << "Click mouse 10 times...\n";
   const int n = 3;
   printf("Click mouse %d times...\n", n);
   for(int i = 0; i < n; i++)
   {
      while(!Button())
         ;
      while(Button())
         ;
      //std::cout << "Click #" << i + 1 << std::endl;
      printf("Click #%d\n", i+1);
   }
   FlushEvents(everyEvent, 0);
   return 0;
}
