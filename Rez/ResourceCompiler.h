#ifndef RESOURCECOMPILER_H
#define RESOURCECOMPILER_H

#include "Expression.h"

class ResourceCompiler : public Context
{
public:
	ResourceCompiler();

	void reserve(int nBits) { write(nBits, 0); }
	void write(int nBits, int value);
};

#endif // RESOURCECOMPILER_H
