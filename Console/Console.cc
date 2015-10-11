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
#include "Fonts.h"
#include "Processes.h"

#include <algorithm>

using namespace Retro;

Console *Console::currentInstance = NULL;

Console::Console(GrafPtr port, Rect r)
	: consolePort(port), bounds(r), dirtyRect()
{
	if(currentInstance == NULL)
		currentInstance = (Console*) -1;
	PortSetter setport(consolePort);
	
	InsetRect(&bounds, 2,2);
	TextFont(kFontIDMonaco);
	TextSize(9);
	
	cellSizeY = 12;
	cellSizeX = CharWidth('M');
	
	rows = (bounds.bottom - bounds.top) / cellSizeY;
	cols = (bounds.right - bounds.left) / cellSizeX;

	chars = std::vector<char>(rows*cols, ' ');

	onscreen = chars;

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
void Console::DrawCell(short x, short y, bool erase)
{
	Rect r = CellRect(x,y);
	if(erase)
		EraseRect(&r);
	MoveTo(r.left, r.bottom - 2);
	DrawChar(chars[y * cols + x]);
}

void Console::DrawCells(short x1, short x2, short y, bool erase)
{
	Rect r = { (short) (bounds.top + y * cellSizeY),      (short) (bounds.left + x1 * cellSizeX),
			   (short) (bounds.top + (y+1) * cellSizeY),  (short) (bounds.left + x2 * cellSizeX) };
	if(erase)
		EraseRect(&r);
	MoveTo(r.left, r.bottom - 2);
	DrawText(&chars[y * cols + x1], 0, x2 - x1);
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
	onscreen = chars;
}

void Console::ScrollUp(short n)
{
	cursorY--;
	std::copy(chars.begin() + cols, chars.end(), chars.begin());
	std::fill(chars.end() - cols, chars.end(), ' ');
	std::copy(onscreen.begin() + cols, onscreen.end(), onscreen.begin());
	std::fill(onscreen.end() - cols, onscreen.end(), ' ');
	RgnHandle rgn = NewRgn();
	ScrollRect(&bounds, 0, -cellSizeY, rgn);
	DisposeRgn(rgn);
	dirtyRect.top = dirtyRect.top > 0 ? dirtyRect.top - 1 : 0;
	dirtyRect.bottom = dirtyRect.bottom > 0 ? dirtyRect.bottom - 1 : 0;
}


void Console::PutCharNoUpdate(char c)
{
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
}

void Console::putch(char c)
{
	PutCharNoUpdate(c);
	Update();
}

void Console::write(const char *p, int n)
{
	for(int i = 0; i < n; i++)
		Console::currentInstance->PutCharNoUpdate(*p++);
	Update();
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
			while(!GetNextEvent(everyEvent, &event))
				;
		} while(event.what != keyDown && event.what != autoKey);
		
		c = event.message & charCodeMask;
		
		if(c == '\r')
			c = '\n';
		
		if(c == '\b')
		{
			if(buffer.size())
			{
				cursorX--;
				putch(' ');
				cursorX--;

				buffer.resize(buffer.size()-1);
			}

			continue;
		}
		
		putch(c);
		buffer.append(1,c);
	} while(c != '\n');
	return buffer;
}
