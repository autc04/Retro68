#include "ResourceDefinitions.h"
#include <ostream>
#include <cassert>

#include "ResourceCompiler.h"

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


FieldList::~FieldList()
{

}

void FieldList::addField(FieldPtr field)
{
	fields.push_back(field);
}

void FieldList::addLabel(std::string name)
{
	// ### TODO
}

void FieldList::compile(ExprPtr expr, ResourceCompiler *compiler, bool prePass)
{
	CompoundExprPtr compound = std::dynamic_pointer_cast<CompoundExpr>(expr);
	assert(compound);

	int i = 0;
	for(FieldPtr f : fields)
	{
		if(f->needsValue())
			f->compile(compound->getItem(i++), compiler, prePass);
		else
			f->compile(nullptr, compiler, prePass);
	}
}




bool SimpleField::needsValue()
{
	return !value;
}

void SimpleField::compile(ExprPtr expr, ResourceCompiler *compiler, bool prePass)
{
	int bitSize;

	switch(type)
	{
		case Type::bitstring:
			bitSize = arrayCount->evaluateInt(compiler);
			break;
		case Type::boolean:
			bitSize = 1;
			break;
		case Type::byte:
			bitSize = 8;
			break;
		case Type::integer:
			bitSize = 16;
			break;
		case Type::longint:
			bitSize = 32;
			break;
	}

	int actualValue = 0;
	if(!prePass)
	{
		if(value)
		{
			actualValue = value->evaluateInt(compiler);
		}
		else
		{
			// TODO: add alternatives to context
			actualValue = expr->evaluateInt(compiler);
		}
	}

	compiler->write(bitSize, actualValue);
}
