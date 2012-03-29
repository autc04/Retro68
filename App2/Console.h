#include <Quickdraw.h>
#include <vector>

class Console
{
public:
   Console(GrafPtr port);
   void Draw();
   void putch(char c);

   static Console *currentInstance;
private:
   GrafPtr consolePort;
   Rect bounds;

   std::vector<char> chars;

   short cellSizeX;
   short cellSizeY;
 
   short rows, cols;

   short cursorX, cursorY;
   
   Rect CellRect(short x, short y);
   void DrawCell(short x, short y);
   void ScrollUp(short n = 1);
};

