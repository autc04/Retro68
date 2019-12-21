/*
    Copyright 2012-2019 Wolfgang Thaller, Davide Bucci

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "IConsole.h"
#include "MacUtils.h"
#include "Fonts.h"
#include "Processes.h"

#include <algorithm>

using namespace retro;

IConsole *IConsole::currentInstance = NULL;

Attributes::Attributes(void)
{
    reset();
}
void Attributes::reset(void)
{
    cBold=false;
    cUnderline=false;
    cItalic=false;
}

bool Attributes::isBold(void) const
{
    return cBold;
}


bool Attributes::isUnderline(void) const
{
    return cUnderline;
}

bool Attributes::isItalic(void) const
{
    return cItalic;
}

void Attributes::setBold(const bool v)
{
    cBold=v;
}

void Attributes::setItalic(const bool v)
{
    cItalic=v;
}

void Attributes::setUnderline(const bool v)
{
    cUnderline=v;
}

inline bool operator==(const Attributes& lhs, const Attributes& rhs)
{ 
    return lhs.isBold()==rhs.isBold() && lhs.isUnderline()==rhs.isUnderline() && lhs.isItalic()==rhs.isItalic();
}

inline bool operator!=(const Attributes& lhs, const Attributes& rhs)
{
    return !(lhs == rhs);
}

namespace
{
    class FontSetup
    {
        short saveFont, saveSize, saveFace;
    public:
        FontSetup()
        {
#if TARGET_API_MAC_CARBON
            GrafPtr port;
            GetPort(&port);
            saveFont = GetPortTextFont(port);
            saveSize = GetPortTextSize(port);
#else
            saveFont = qd.thePort->txFont;
            saveSize = qd.thePort->txSize;
            saveFace = qd.thePort->txFace;
#endif
            TextFont(kFontIDMonaco);
            TextSize(9);
            TextFace(normal);
        }

        ~FontSetup()
        {
            TextFont(saveFont);
            TextSize(saveSize);
            TextFace(saveFace);
        }
    };
}

IConsole::IConsole()
{
}

IConsole::IConsole(GrafPtr port, Rect r)
{
    Init(port, r);
}

IConsole::~IConsole()
{
    if(currentInstance == this)
        currentInstance = NULL;
}

void IConsole::Init(GrafPtr port, Rect r)
{
    consolePort = port;
    bounds = r;
    
    PortSetter setport(consolePort);
    FontSetup fontSetup;

    InsetRect(&bounds, 2,2);
    
    cellSizeY = 12;
    cellSizeX = CharWidth('M');
    
    rows = (bounds.bottom - bounds.top) / cellSizeY;
    cols = (bounds.right - bounds.left) / cellSizeX;

    chars = std::vector<char>(rows*cols, ' ');
    attrs = std::vector<Attributes>(rows*cols);

    onscreen = chars;

    cursorX = cursorY = 0;
    isProcessingEscSequence=false;
}

void IConsole::SetAttributes(Attributes aa)
{
    TextFace(aa.isBold()?bold:0 + aa.isUnderline()?underline:0 + aa.isItalic()?italic:0);
}

short IConsole::CalcStartX(short x, short y)
{
    Attributes a=attrs[y * cols];
    SetAttributes(a);
    short start=0;
    short widthpx=0;
    for(int i=0; i<x; ++i)
    {
        if(a!=attrs[y * cols + i])
        {
            widthpx+=TextWidth(&chars[y * cols + start], 0, i - start);
            a=attrs[y * cols + i];
            SetAttributes(a);
            start=i;
        }
    }
    widthpx+=TextWidth(&chars[y * cols + start], 0, x - start);
    return widthpx;
}

Rect IConsole::CellRect(short x, short y)
{
    short widthpx=CalcStartX(x,y);
    FontSetup fontSetup;
    SetAttributes(attrs[y * cols+x]);
    short cellSizeP=CharWidth('M');
    return { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + widthpx),
             (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + widthpx+cellSizeP) };
}
void IConsole::DrawCell(short x, short y, bool erase)
{
    Rect r = CellRect(x,y);

    if(cursorDrawn)
    {
        if(y == cursorY && x == cursorX)
        {
            erase = true;
            cursorDrawn = false;
        }
    }

    if(erase)
        EraseRect(&r);
    MoveTo(r.left, r.bottom - 2);
    DrawChar(chars[y * cols + x]);
}

void IConsole::DrawCells(short x1, short x2, short y, bool erase)
{
    Attributes a=attrs[y * cols];
    SetAttributes(a);
    int start=0;
    int xstart=0;
    int xend=0;
    for(int i=0; i<x1; ++i)
    {
        if(a!=attrs[y * cols + i])
        {
            xstart+=TextWidth(&chars[y * cols + start], 0, i - start);
            a=attrs[y * cols + i];
            SetAttributes(a);
            start=i;
        }
    }
    xstart+=TextWidth(&chars[y * cols + start], 0, x1 - start);
    xend=xstart;
    for(int i=x1; i<x2; ++i)
    {
        if(a!=attrs[y * cols + i])
        {
            xend+=TextWidth(&chars[y * cols + start], 0, i - start);
            a=attrs[y * cols + i];
            SetAttributes(a);
            start=i;
        }
    }
    xend+=TextWidth(&chars[y * cols + start], 0, x2 - start);

    Rect r = { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + xstart),
               (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + xend) };
    
    if(cursorDrawn)
    {
        if(y == cursorY && x1 <= cursorX && x2 > cursorX)
        {
            erase = true;
            cursorDrawn = false;
        }
    }
    
    if(erase)
        EraseRect(&r);
    MoveTo(r.left, r.bottom - 2);

    a=attrs[y * cols + x1];
    SetAttributes(a);
    start=x1;
    for(int i=x1; i<x2; ++i)
    {
        if(a!=attrs[y * cols + i])
        {
            DrawText(&chars[y * cols + start], 0, i - start);
            a=attrs[y * cols + i];
            SetAttributes(a);
            start=i;
        }
    }
    DrawText(&chars[y * cols + start], 0, x2 - start);
}

void IConsole::Draw(Rect r)
{
    if(!consolePort)
        return;
    PortSetter setport(consolePort);
    FontSetup fontSetup;

    SectRect(&r, &bounds, &r);

    short minRow = std::max(0, (r.top - bounds.top) / cellSizeY);
    short maxRow = std::min((int)rows, (r.bottom - bounds.top + cellSizeY - 1) / cellSizeY);
    
    short minCol = 0;// std::max(0, (r.left - bounds.left) / cellSizeX);
    
    short maxCol = cols; //;std::min((int)cols, (r.right - bounds.left + cellSizeX - 1) / cellSizeX);
    
    EraseRect(&r);
    for(short row = minRow; row < maxRow; ++row)
    {
        DrawCells(minCol, maxCol, row, false);
    }
    if(cursorDrawn)
    {
        Rect cursor = CellRect(cursorX, cursorY);
        //InvertRect(&cursor);
    }
    onscreen = chars;
}

void IConsole::ScrollUp(short n)
{
    cursorY--;
    std::copy(chars.begin() + cols, chars.end(), chars.begin());
    std::fill(chars.end() - cols, chars.end(), ' ');
    std::copy(attrs.begin() + cols, attrs.end(), attrs.begin());
    std::fill(attrs.end() - cols, attrs.end(), currentAttr);
    std::copy(onscreen.begin() + cols, onscreen.end(), onscreen.begin());
    std::fill(onscreen.end() - cols, onscreen.end(), ' ');
    RgnHandle rgn = NewRgn();
    ScrollRect(&bounds, 0, -cellSizeY, rgn);
    DisposeRgn(rgn);
    dirtyRect.top = dirtyRect.top > 0 ? dirtyRect.top - 1 : 0;
    dirtyRect.bottom = dirtyRect.bottom > 0 ? dirtyRect.bottom - 1 : 0;
}

void IConsole::ProcessEscSequence(char c)
{
    switch(sequenceStep)
    {
    case 0:
        if(c=='[')
            ++sequenceStep;
        else
            isProcessingEscSequence=false;
        break;
    case 1:
        ++sequenceStep;
        switch(c)
        {
        case '0':   // Normal character
            currentAttr.reset();
            break;
        case '1':   // Bold
            currentAttr.setBold(true);
            break;
        case '3':   // Italic
            currentAttr.setItalic(true);
            break;
        case '4':   // Underline
            currentAttr.setUnderline(true);
            break;
        default:
            isProcessingEscSequence=false;
        }
        break;
    case 2:
        if(c=='m')
            isProcessingEscSequence=false;
        else if(c==';')
            sequenceStep=1;
        else
            isProcessingEscSequence=false;
        break;
    default:
        sequenceStep=0;
    }
}

void IConsole::PutCharNoUpdate(char c)
{
    if(isProcessingEscSequence)
    {
        ProcessEscSequence(c);
        return;
    }
    InvalidateCursor();
    switch(c)
    {
    case '\033':    // Begin of an ANSI escape sequence
        isProcessingEscSequence=true;
        sequenceStep=0;
        break;
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
        attrs[cursorY * cols + cursorX] = currentAttr;

        if(dirtyRect.right == 0)
        {
            dirtyRect.right = (dirtyRect.left = cursorX) + 1;
            dirtyRect.bottom = (dirtyRect.top = cursorY) + 1;
        }
        else
        {
            dirtyRect.left = std::min(dirtyRect.left, cursorX);
            dirtyRect.top = std::min(dirtyRect.top, cursorY);
            dirtyRect.right = std::max(dirtyRect.right, short(cursorX + 1));
            dirtyRect.bottom = std::max(dirtyRect.bottom, short(cursorY + 1));
        }

        cursorX++;
        if(cursorX >= cols)
            PutCharNoUpdate('\n');
        // This is to make sure the cursor width is calculated correctly
        attrs[cursorY * cols + cursorX] = currentAttr;

    }
}

void IConsole::Update()
{
    PortSetter setport(consolePort);
    FontSetup fontSetup;

    for(short row = dirtyRect.top; row < dirtyRect.bottom; ++row)
    {
        short start = -1;
        bool needclear = false;
        for(short col = dirtyRect.left; col < dirtyRect.right; ++col)
        {
            char old = onscreen[row * cols + col];
            if(chars[row * cols + col] != old)
            {
                if(start == -1)
                    start = col;
                if(old != ' ')
                    needclear = true;
                onscreen[row * cols + col] = chars[row * cols + col];
            }
            else
            {
                if(start != -1)
                    DrawCells(start, col, row, needclear);
                start = -1;
                needclear = false;
            }
        }
        if(start != -1)
            DrawCells(start, dirtyRect.right, row, needclear);
    }
    dirtyRect = Rect();
    
    if(cursorVisible != cursorDrawn)
    {
        Rect r = CellRect(cursorX, cursorY);
        if(cursorDrawn)
            DrawCell(cursorX, cursorY, true);
        //else
        //    InvertRect(&r);
        cursorDrawn = !cursorDrawn;
    }
    
#if TARGET_API_MAC_CARBON
    QDFlushPortBuffer(consolePort,NULL);
#endif
}

void IConsole::putch(char c)
{
    if(!rows)
        return;
    PutCharNoUpdate(c);
    Update();
}

void IConsole::write(const char *p, int n)
{
    if(!rows)
        return;
    
    for(int i = 0; i < n; i++)
        IConsole::currentInstance->PutCharNoUpdate(*p++);
    Update();
}


std::string IConsole::ReadLine()
{
    if(!consolePort)
        return "";

    std::string buffer;
    char c;
    
    do
    {        
        c = WaitNextChar();
        if(!c)
        {
            eof = true;
            return "";
        }

        if(c == '\r')
            c = '\n';
        
        if(c == '\b')
        {
            if(buffer.size())
            {
                InvalidateCursor();
                cursorX--;
                PutCharNoUpdate(' ');
                cursorX--;
                Update();

                buffer.resize(buffer.size()-1);
            }

            continue;
        }
        
        putch(c);
        buffer.append(1,c);
    } while(c != '\n');
    return buffer;
}

void IConsole::InvalidateCursor()
{
    if(cursorDrawn)
    {
        PortSetter setport(consolePort);
        DrawCell(cursorX, cursorY, true);
        cursorDrawn = false;
    }
}

void IConsole::Idle()
{
    long ticks = TickCount();
    if(ticks - blinkTicks > 60)
    {
        cursorVisible = !cursorVisible;
        blinkTicks = ticks;
        Update();
    }
}

void IConsole::Reshape(Rect newBounds)
{
    if(!consolePort)
        return;

    InsetRect(&newBounds, 2,2);

    bounds = newBounds;
    short newRows = (bounds.bottom - bounds.top) / cellSizeY;
    short newCols = (bounds.right - bounds.left) / cellSizeX;

    short upshift = 0;
    if(cursorY >= newRows)
    {
        upshift = cursorY - (newRows - 1);
        
        InvalidateCursor();
        cursorY = newRows - 1;
    }

    std::vector<char> newChars(newRows*newCols, ' ');
    for(short row = 0; row < newRows && row + upshift < rows; row++)
    {
        char *src = &chars[(row+upshift) * cols];
        char *dst = &newChars[row * newCols];
        std::copy(src, src + std::min(cols, newCols), dst);
    }
    chars.swap(newChars);
    /*newChars = std::vector<char>(newRows*newCols, ' ');
    for(short row = 0; row < newRows && row < rows; row++)
    {
        char *src = &chars[row * cols];
        char *dst = &newChars[row * newCols];
        std::copy(src, src + std::min(cols, newCols), dst);
    }
    onscreen.swap(newChars);*/
    onscreen = newChars;
    
    rows = newRows;
    cols = newCols;

    if(upshift)
    {
        //dirtyRect = Rect { 0, 0, rows, cols };
        //Update();
        Draw();
    }
}

char IConsole::WaitNextChar()
{
    return 0;
}
