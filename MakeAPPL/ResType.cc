#include "ResType.h"
#include <iostream>

ResType::ResType(const std::string &str)
{
	auto p = str.begin();
	auto e = str.end();

	x = 0;
	while(p != e)
	{
		x <<= 8;
		x |= (*p) & 0xFF;
		++p;
	}
}

ResType::operator std::string()
{
	char c1 = static_cast<char>(x >> 24);
	char c2 = static_cast<char>(x >> 16);
	char c3 = static_cast<char>(x >> 8);
	char c4 = static_cast<char>(x);

	return std::string{ c1, c2, c3, c4 };
}

std::ostream &operator<<(std::ostream &out, ResType t)
{
	char c1 = static_cast<char>((int)t >> 24);
	char c2 = static_cast<char>((int)t >> 16);
	char c3 = static_cast<char>((int)t >> 8);
	char c4 = static_cast<char>((int)t);

	out << "'" << c1 << c2 << c3 << c4 << "'";
	return out;
}

