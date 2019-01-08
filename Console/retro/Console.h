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
#ifndef RETRO68_CONSOLE_H_
#define RETRO68_CONSOLE_H_

#include <Quickdraw.h>
#include <vector>
#include <string>

namespace retro
{
	class Console
	{
	public:
		Console();
		Console(GrafPtr port, Rect r);
		~Console();

		void Reshape(Rect newBounds);

		void Draw(Rect r);
		void Draw() { Draw(bounds); }
		void putch(char c);

		void write(const char *s, int n);
		std::string ReadLine();

		static Console *currentInstance;

		short GetRows() const { return rows; }
		short GetCols() const { return cols; }
		
		void Idle();

        bool IsEOF() const { return eof; }
	private:
		GrafPtr consolePort = nullptr;
		Rect bounds;

		std::vector<char> chars, onscreen;

		short cellSizeX;
		short cellSizeY;

		short rows = 0, cols = 0;

		short cursorX, cursorY;

		Rect dirtyRect = {};
		
		long blinkTicks = 0;
		bool cursorDrawn = false;
		bool cursorVisible = true;
        bool eof = false;

		void PutCharNoUpdate(char c);
		void Update();

		Rect CellRect(short x, short y);
		void DrawCell(short x, short y, bool erase = true);
		void DrawCells(short x1, short x2, short y, bool erase = true);
		void ScrollUp(short n = 1);
		
		void InvalidateCursor();

		virtual char WaitNextChar();
	
	protected:
		void Init(GrafPtr port, Rect r);
		
	};


}

#endif /* RETRO68_CONSOLE_H_ */
