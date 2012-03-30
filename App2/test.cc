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
   Rect r;
   unsigned char buf[256];
   //foo = bar;
   r.top = r.left = 0;
   r.bottom = 342;
   r.right = 512;
   //= { 0, 0, 342, 512 };
   //Debugger();
   GrafPort port;
   InitGraf(&qd.thePort);
   InitFonts();
   OpenPort(&port);
   EraseRect(&r);
#if 0
   MoveTo(100,100);
   /*buf[0] = 2;
   buf[1] = 'H';
   buf[2] = 'W';*/

#if 0
   sprintf((char*)&buf[1], "Hello, world: %d", 6*7);//6.0 * 7.0);
   buf[0] = strlen((char*)&buf[1]);
#else
   std::ostringstream out;
   out << "Hello, world: " << 6*7;
   std::string str = out.str();
   buf[0] = str.size();
   std::copy(str.begin(), str.end(), &buf[1]);
#endif
   DrawString(buf);

   /*try
   {
   foobar();
   }
   catch(...)
   {
      PaintRect(&r);
   }*/
   //SysBeep(20);
#endif
   /*try
   {
      FillRect(&r,&qd.gray);
      foobar();
      PaintRect(&r);
   }
   catch(...)
   {
      EraseRect(&r);
   }*/
   //
   //if(!std::malloc(32))
   //   PaintRect(&r);
   new char[32];
   Console console(&port);
   __write_hook = &consolewrite;
  // console.putch('a');
  // console.putch('b'); 
   console.putch('x');
   console.putch('a');
   console.putch('b');
   //new char[42];
   console.putch('c');
   console.putch('a');
   console.putch('a');
   Console::currentInstance->putch('Y');
   printf("Hello...\n");
   console.putch('b');
   console.putch('\n');

   std::cout << "Hello, world.\n";
   //printf("Hello, world.\n");
   console.putch('a');
   Console::currentInstance->putch('Y');
   std::cout << "X\n";
   for(int i = 1; i <= 100; i++)
      std::cout << "Hello, world: "  << i  << std::endl;
   std::cout << std::flush;

   std::cout << "Say something: " << std::flush;
   console.ReadLine();

   for(int i = 0; i < 5; i++)
   {
      std::cout << "Exception speed test: " << std::flush;
      long start = TickCount();
      try { foobar(); } catch(...) {}
      long end = TickCount();
      std::cout << (end-start)*1000 / 60.0 << " ms\n";
   }
   std::cout << "Click mouse 10 times...\n";
   //console.Draw();
   for(int i = 0; i < 10; i++)
   {
      //InvertRect(&qd.screenBits.bounds);
      while(!Button())
         ;
      while(Button())
         ;
      std::cout << "Click #" << i + 1 << std::endl;
      //console.Draw();
   }
  // something *= 7.0;
   return 0;
}
