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

#include <Quickdraw.h>
#include <vector>
#include <string>

class Console
{
public:
	Console(GrafPtr port, Rect r);
	~Console();
	void Draw();
	void putch(char c);

	void write(const char *s, int n);
	std::string ReadLine();

	static Console *currentInstance;
private:
	GrafPtr consolePort;
	Rect bounds;

	std::vector<char> chars, onscreen;

	short cellSizeX;
	short cellSizeY;

	short rows, cols;

	short cursorX, cursorY;

	Rect dirtyRect;

	void PutCharNoUpdate(char c);
	void Update();

	Rect CellRect(short x, short y);
	void DrawCell(short x, short y, bool erase = true);
	void DrawCells(short x1, short x2, short y, bool erase = true);
	void ScrollUp(short n = 1);
};

