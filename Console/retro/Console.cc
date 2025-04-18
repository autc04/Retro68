/*
    Copyright 2012-2020 Wolfgang Thaller, Davide Bucci

    This file is part of Retro68.

    Retro68 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Retro68 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Under Section 7 of GPL version 3, you are granted additional
    permissions described in the GCC Runtime Library Exception, version
    3.1, as published by the Free Software Foundation.

    You should have received a copy of the GNU General Public License
    along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "Console.h"
#include "MacUtils.h"
#include "Fonts.h"
#include "Processes.h"
#include <cctype>
#include <algorithm>
#include <stack>
#include <sstream>

using namespace retro;

const char BEL = 7;
const char MAX_LEN = 250;

Console *Console::currentInstance = NULL;

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

inline bool operator==(const AttributedChar& lhs, const AttributedChar& rhs)
{
    return lhs.c==rhs.c && lhs.attrs==rhs.attrs;
}

inline bool operator!=(const AttributedChar& lhs, const AttributedChar& rhs)
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

Console::Console()
{
    InitEscapeSequenceMap();
}

Console::Console(GrafPtr port, Rect r)
{
    Init(port, r);
    InitEscapeSequenceMap();
}

Console::~Console()
{
    if(currentInstance == this)
        currentInstance = NULL;
}

void Console::Init(GrafPtr port, Rect r)
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

    chars = std::vector<AttributedChar>(rows*cols, AttributedChar(' ',currentAttr));

    onscreen = chars;

    cursorX = cursorY = 0;
    sequenceState=State::noSequence;
}

void Console::SetAttributes(Attributes aa)
{
    TextFace(aa.isBold()?bold+condense:0 + aa.isUnderline()?underline:0 + aa.isItalic()?italic:0);
}

Rect Console::CellRect(short x, short y)
{
    return { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + x * cellSizeX),
             (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + (x+1) * cellSizeX) };
}
void Console::DrawCell(short x, short y, bool erase)
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
    DrawChar(chars[y * cols + x].c);
}

void Console::DrawCells(short x1, short x2, short y, bool erase)
{
    Rect r = { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + x1 * cellSizeX),
           (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + x2 * cellSizeX) };
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

    Attributes a=chars[y * cols + x1].attrs;
    SetAttributes(a);
    for(int i=x1; i<x2; ++i)
    {
        if(a!=chars[y * cols + i].attrs) {
            a=chars[y * cols + i].attrs;
            SetAttributes(a);
        }
        DrawChar(chars[y * cols + i].c);
    }
}

void Console::Draw(Rect r)
{
    if(!consolePort)
        return;
    PortSetter setport(consolePort);
    FontSetup fontSetup;

    SectRect(&r, &bounds, &r);

    short minRow = std::max(0, (r.top - bounds.top) / cellSizeY);
    short maxRow = std::min((int)rows, (r.bottom - bounds.top + cellSizeY - 1) / cellSizeY);

    short minCol = std::max(0, (r.left - bounds.left) / cellSizeX);
    short maxCol = std::min((int)cols, (r.right - bounds.left + cellSizeX - 1) / cellSizeX);

    EraseRect(&r);
    for(short row = minRow; row < maxRow; ++row)
    {
        DrawCells(minCol, maxCol, row, false);
    }
    if(cursorDrawn)
    {
        Rect cursor = CellRect(cursorX, cursorY);
        InvertRect(&cursor);
    }
    onscreen = chars;
}

void Console::ScrollUp(short n)
{
    cursorY--;
    std::copy(chars.begin() + cols, chars.end(), chars.begin());
    std::fill(chars.end() - cols, chars.end(), AttributedChar(' ', currentAttr));
    std::copy(onscreen.begin() + cols, onscreen.end(), onscreen.begin());
    std::fill(onscreen.end() - cols, onscreen.end(), AttributedChar(' ', currentAttr));
    RgnHandle rgn = NewRgn();
    ScrollRect(&bounds, 0, -cellSizeY, rgn);
    DisposeRgn(rgn);
    dirtyRect.top = dirtyRect.top > 0 ? dirtyRect.top - 1 : 0;
    dirtyRect.bottom = dirtyRect.bottom > 0 ? dirtyRect.bottom - 1 : 0;
}

bool Console::ProcessEscSequence(char c)
{
    switch(sequenceState)
    {
    case State::noSequence:
        return false;                       // Break is not needed there.
    case State::waitingForSequenceStart:
        if(c=='[')
            sequenceState=State::waitingForControlSequence;
        else if(c==']')
            sequenceState=State::waitingForOSCStart;
        else
            sequenceState=State::noSequence;   // Unrecognized sequence
        break;
    case State::waitingForControlSequence:
        HandleControlSequence(c);
        break;
    case State::waitingForOSCStart:
        if(c=='0')
            sequenceState=State::waitingForSemicolon;
        else
            sequenceState=State::noSequence;   // Normal end of sequence
        break;
    case State::waitingForSemicolon:
        if(c==';')
        {
            sequenceState=State::inWindowName;
            argument = "";
        }
        else
            sequenceState=State::noSequence;   // Normal end of sequence
        break;
    case State::inWindowName:
        if(c==BEL)
        {
            setWindowName(std::move(argument));
            sequenceState=State::noSequence;   // Normal end of sequence
        }
        else
        {
            if(argument.size() < MAX_LEN)    // Ignore subsequent characters
                argument+=c;
        }
        break;
    default:
        sequenceState=State::noSequence;
        break;
    }
    return true;
}

void Console::PutCharNoUpdate(char c)
{
    if(ProcessEscSequence(c))
        return;

    InvalidateCursor();
    switch(c)
    {
    case '\033':    // Begin of an ANSI escape sequence
        sequenceState=State::waitingForSequenceStart;
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
        chars[cursorY * cols + cursorX].c = c;
        chars[cursorY * cols + cursorX].attrs = currentAttr;

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
    }
}

void Console::Update()
{
    PortSetter setport(consolePort);
    FontSetup fontSetup;

    for(short row = dirtyRect.top; row < dirtyRect.bottom; ++row)
    {
        short start = -1;
        bool needclear = false;
        for(short col = dirtyRect.left; col < dirtyRect.right; ++col)
        {
            AttributedChar old = onscreen[row * cols + col];
            if(chars[row * cols + col] != old)
            {
                if(start == -1)
                    start = col;
                if(old.c != ' ')
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
        else
            InvertRect(&r);
        cursorDrawn = !cursorDrawn;
    }

#if TARGET_API_MAC_CARBON
    QDFlushPortBuffer(consolePort,NULL);
#endif
}

void Console::putch(char c)
{
    if(!rows)
        return;
    PutCharNoUpdate(c);
    Update();
}

void Console::write(const char *p, int n)
{
    if(!rows)
        return;

    for(int i = 0; i < n; i++)
        Console::currentInstance->PutCharNoUpdate(*p++);
    Update();
}


std::string Console::ReadLine()
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

void Console::InvalidateCursor()
{
    if(cursorDrawn)
    {
        PortSetter setport(consolePort);
        DrawCell(cursorX, cursorY, true);
        cursorDrawn = false;
    }
}

void Console::Idle()
{
    long ticks = TickCount();
    if(ticks - blinkTicks > 60)
    {
        cursorVisible = !cursorVisible;
        blinkTicks = ticks;
        Update();
    }
}

void Console::Reshape(Rect newBounds)
{
    if(!consolePort)
        return;


    bounds = newBounds;
    InsetRect(&bounds, 2,2);

    short newRows = (bounds.bottom - bounds.top) / cellSizeY;
    short newCols = (bounds.right - bounds.left) / cellSizeX;

    short upshift = 0;
    if(cursorY >= newRows)
    {
        upshift = cursorY - (newRows - 1);

        InvalidateCursor();
        cursorY = std::max(newRows - 1, 0) ;
    }

    std::vector<AttributedChar> newChars(newRows*newCols, AttributedChar(' ', currentAttr));
    for(short row = 0; row < newRows && row + upshift < rows; row++)
    {
        AttributedChar *src = &chars[(row+upshift) * cols];
        AttributedChar *dst = &newChars[row * newCols];
        std::copy(src, src + std::min(cols, newCols), dst);
    }
    chars.swap(newChars);

    onscreen = newChars;

    rows = newRows;
    cols = newCols;


    dirtyRect = Rect { 0, 0, rows, cols };
    EraseRect(&newBounds);
    Update();
    Draw(newBounds);
}

char Console::WaitNextChar()
{
    return 0;
}

// Map a letter to a function
void Console::InitEscapeSequenceMap()
{
    escapeSequenceMap.insert({'H', [&](std::string args) { Console::SetCursorPosition(args); } });
    escapeSequenceMap.insert({'J', [&](std::string args) { EraseInDisplay(args); } });
    escapeSequenceMap.insert({'m', [&](std::string args) { SetDisplayAttributes(args); } });
}

// turns an argument string into numbers
// example: "12;13" would return a vector with numbers 12 and 13
static std::vector<int> parseArguments(std::string str) {
    std::istringstream iss(str);
    std::string token;
    std::vector<int> numberVector;
    while (getline(iss, token, ';'))
    {
        if(token == "") 
        {
            numberVector.push_back(1);
        }
        else
        {
            numberVector.push_back(atoi(token.c_str()));
        }
    }

    while (numberVector.size() < 2)
       numberVector.push_back(1);

    return numberVector;
}

// Bound to ANSI escape code H
// Page: https://en.wikipedia.org/wiki/ANSI_escape_code
// Section: Control Sequence Introducer commands
// Name: Cursor Position
void Console::SetCursorPosition(std::string args)
{
    // possible formats the arguments can be in:
    // n          -> (1,n)
    // n;m.     -> (m,n)
    // n;m;     -> (m,n)
    // n;         -> (1,n)
    // ;m        -> (m,1)
    //             -> (1,1)
    
    auto numberVector = parseArguments(args);
    cursorX = numberVector.at(1);
    cursorY = numberVector.at(0);
    Update();
}

// Bound to ANSI escape code J
// Page: https://en.wikipedia.org/wiki/ANSI_escape_code
// Section: Control Sequence Introducer commands
// Name: Erase in Display
void Console::EraseInDisplay(std::string args)
{
    int n;
    if (args == "")
        n = 0;
    else
        n = atoi(args.c_str());

    switch(n) {
        case 0:     // clear from cursor to end of window
            ClearFromCursorToEndOfWindow();
            break;
        
        case 1:     // clear from cursor to beginning of the window
            ClearFromTopOfWindowToCursor();
            break;
    
        case 2:     // clear entire screen
            ClearWindow();
            break;
            
        case 3:     // clear entire screen and delete all lines saved in the scrollback buffer
            ClearWindow();
            break;
    }
}

// Sets attributes of characters
// Note: only a few attributes are currently implemented
// Bound to ANSI escape code m
// Page: https://en.wikipedia.org/wiki/ANSI_escape_code
// Section: Select Graphic Rendition parameters
void Console::SetDisplayAttributes(std::string args)
{
    char c = args.c_str()[0];
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
    }
}

// Clears the window of all text
void Console::ClearWindow()
{
    // Fill the buffer with blank spaces
    std::fill(chars.begin(), chars.end(), AttributedChar(' ', currentAttr));
    std::fill(onscreen.begin(), onscreen.end(), AttributedChar(' ', currentAttr));
    
    // Erase the window
    EraseRect(&bounds);
    Update();
    Draw(bounds);
}

// Clears the window of text from the current cursor position to the bottom of the window
void Console::ClearFromCursorToEndOfWindow()
{
    int newPosition = cursorY * cols + cursorX;
    
    // Fill the buffer with blank spaces
    std::fill(chars.begin() + newPosition, chars.end(), AttributedChar(' ', currentAttr));
    std::fill(onscreen.begin() + newPosition, onscreen.end(), AttributedChar(' ', currentAttr));
    
    // Erase the window
    EraseRect(&bounds);
    Update();
    Draw(bounds);
}

// Clears the window from the top to the current cursor position
void Console::ClearFromTopOfWindowToCursor()
{
    int newPosition = cursorY * cols + cursorX;
    
    // Fill the buffer with blank spaces
    std::fill(chars.begin(), chars.begin() + newPosition, AttributedChar(' ', currentAttr));
    std::fill(onscreen.begin(), onscreen.begin() + newPosition, AttributedChar(' ', currentAttr));
    
    // Erase the window
    EraseRect(&bounds);
    Update();
    Draw(bounds);
}

// handles the waitingForControlSequence state
void Console::HandleControlSequence(char c)
{
    if (isalpha(c))
    {
        auto escFunc = escapeSequenceMap.at(c);
        escFunc(argument);
        sequenceState=State::noSequence;
        argument = "";
    } 

    else
    {
        argument = argument + c;
    }
}
