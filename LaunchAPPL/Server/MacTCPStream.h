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

#pragma once

#include <Stream.h>
#include <MacTCP.h>

class MacTCPStream : public Stream
{
    static const long kInputBufferSize = 8192;
    static const long kReadBufferSize = 4096;
    char inputBuffer[kInputBufferSize];
    char readBuffer[kReadBufferSize];

    short refNum;
    bool connected = false;

    StreamPtr tcpStream;
    TCPiopb readPB, writePB;

    void startListening();
    void startReading();
public:
    virtual void write(const void* p, size_t n) override;

    void idle();

    MacTCPStream();
    ~MacTCPStream();
};


