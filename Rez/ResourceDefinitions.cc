#include "ResourceDefinitions.h"
#include <ostream>

ResourceDefinitions::ResourceDefinitions()
{
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

std::ostream &operator<<(std::ostream &out, TypeSpec ts)
{
	out << ts.getType();
	if(ts.hasID())
		out << " (" << ts.getID() << ")";
	return out;
}
