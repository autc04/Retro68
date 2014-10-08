#ifndef RESTYPE_H
#define RESTYPE_H

#include <string>
#include <iosfwd>

class ResType
{
	int x;
public:
	ResType() : x(0) {}
	ResType(int x) : x(x) {}
	ResType(const std::string& s);

	operator int() const { return x; }
	bool operator<(ResType y) const { return x < y.x; }

	operator std::string();
};

std::ostream& operator<<(std::ostream& out, ResType t);

#endif // RESTYPE_H
