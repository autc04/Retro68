/*
    Copyright 2019 Wolfgang Thaller.

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

#ifndef MACSERIALSTREAM_H_
#define MACSERIALSTREAM_H_

#include <Stream.h>

class MacSerialStream : public Stream
{
    static const long kInputBufferSize = 8192;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short outRefNum, inRefNum;
    int port, curBaud;
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacSerialStream(int port = 0, int baud = 19200);
    ~MacSerialStream();

    void close();
    void open();

    void setBaud(int baud);
};

#endif
