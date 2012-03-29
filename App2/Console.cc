#include "Console.h"

Console *Console::currentInstance = NULL;

Console::Console(GrafPtr port)
{  
   Rect r = {2,2,340,510};
   bounds = r;
   SetPort(port);
   consolePort = port;
   TextFont(9);
   TextSize(9);
   MoveTo(10,10);

   cellSizeY = 10;
   cellSizeX = CharWidth('M');

   rows = (bounds.bottom - bounds.top) / cellSizeY;
   cols = (bounds.right - bounds.left) / cellSizeX;
   chars = std::vector<char>(rows*cols, ' ');

   cursorX = cursorY = 0;

   currentInstance = this;
}

Rect Console::CellRect(short x, short y)
{
   return { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + x * cellSizeX),
            (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + (x+1) * cellSizeX) };
}
void Console::DrawCell(short x, short y)
{
   Rect r = CellRect(x,y);
   EraseRect(&r);
   MoveTo(r.left, r.bottom - 2);
   DrawChar(chars[y * cols + x]);
}

void Console::Draw()
{
   //PashortRect(&r);

   for(short row = 0; row < rows; ++row)
   {
      for(short col = 0; col < cols; ++col)
      {
         DrawCell(col, row);
      }
   }
}

void Console::ScrollUp(short n)
{
   cursorY--;
   std::copy(chars.begin() + cols, chars.end(), chars.begin());
   std::fill(chars.end() - cols, chars.end(), ' ');
   //Console::Draw();
   RgnHandle rgn = NewRgn();
   ScrollRect(&bounds, 0, -cellSizeY, rgn);
   DisposeRgn(rgn);
}

void Console::putch(char c)
{
   //Debugger();
   switch(c)
   {
      case '\r':
         cursorX = 0;
         break;
      case '\n':
         cursorY++;
         cursorX = 0;
         if(cursorY >= rows)
            ScrollUp();
         break;
      default:
         chars[cursorY * cols + cursorX] = c;
         DrawCell(cursorX, cursorY);
         cursorX++;
         if(cursorX >= cols)
            putch('\n');
   }
}

