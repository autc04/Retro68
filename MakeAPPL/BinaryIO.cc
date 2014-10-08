#include "BinaryIO.h"
#include <iostream>
#include <cassert>

void byte(std::ostream& out, int byte)
{
	out.put((unsigned char)byte);
}
void word(std::ostream& out, int word)
{
	byte(out,(word >> 8) & 0xFF);
	byte(out,word & 0xFF);
}
void ostype(std::ostream& out, std::string type)
{
	assert(type.size() == 4);
	out << type;
}
void longword(std::ostream& out, int longword)
{
	byte(out,(longword >> 24) & 0xFF);
	byte(out,(longword >> 16) & 0xFF);
	byte(out,(longword >> 8) & 0xFF);
	byte(out,longword & 0xFF);
}

int byte(std::istream& in)
{
	return in.get() & 0xFF;
}
int word(std::istream& in)
{
	int a = byte(in);
	int b = byte(in);
	return (a << 8) | b;
}
std::string ostype(std::istream& in)
{
	char s[5];
	in.read(s,4);
	s[4] = 0;
	return s;
}
int longword(std::istream& in)
{
	int a = byte(in);
	int b = byte(in);
	int c = byte(in);
	int d = byte(in);
	return (a << 24) | (b << 16) | (c << 8) | d;
}

