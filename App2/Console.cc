/*
    Copyright 2012 Wolfgang Thaller.

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

#include "Console.h"
#include "MacUtils.h"
#include "Events.h"

Console *Console::currentInstance = NULL;

Console::Console(GrafPtr port, Rect r)
    : consolePort(port), bounds(r)
{  
	PortSetter setport(consolePort);
	
	InsetRect(&bounds, 2,2);
	TextFont(9);
	TextSize(9);
	
	cellSizeY = 10;
	cellSizeX = CharWidth('M');
	
	rows = (bounds.bottom - bounds.top) / cellSizeY;
	cols = (bounds.right - bounds.left) / cellSizeX;
	chars = std::vector<char>(rows*cols, ' ');
	
	cursorX = cursorY = 0;
	
	currentInstance = this;
}
Console::~Console()
{
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
	PortSetter setport(consolePort);
	
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
	PortSetter setport(consolePort);
	
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


std::string Console::ReadLine()
{
	std::string buffer;
	EventRecord event;
	char c;
	
	do
	{
		do
		{
			while(!GetOSEvent(everyEvent, &event))
				;
		} while(event.what != keyDown && event.what != autoKey);
		
		c = event.message & charCodeMask;
		
		if(c == '\r')
			c = '\n';
		
		if(c == '\b')
		{
			cursorX--;
			putch(' ');
			cursorX--;
			
			buffer.substr(0,buffer.size()-1);
			
			continue;
			//c = 'X';
		}
		if(c == 127)
		{
			c = 'Y';
		}
		
		putch(c);
		buffer += std::string(1,c);
	} while(c != '\n');
	return buffer;
}

