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
	addField(std::make_shared<LabelField>(name));
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




void SimpleField::addNamedValue(std::string n)
{
	if(lastNamedValue)
		addNamedValue(n, std::make_shared<BinaryExpr>(
			BinaryOp::PLUS, lastNamedValue, std::make_shared<IntExpr>(1)));
	else
		addNamedValue(n, std::make_shared<IntExpr>(0));
}

void SimpleField::addNamedValue(std::string n, ExprPtr val)
{
	namedValues[n] = val;
	lastNamedValue = val;
}

ExprPtr SimpleField::lookupNamedValue(std::string n)
{
	auto p = namedValues.find(n);
	if(p != namedValues.end())
		return p->second;
	else
		return nullptr;
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
		ResourceCompiler::FieldScope scope(compiler, this);
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


ArrayField::ArrayField(std::string name, ExprPtr count)
	: name(name), arrayCount(count)
{
}

void ArrayField::compile(ExprPtr expr, ResourceCompiler *compiler, bool prePass)
{
	CompoundExprPtr compound = std::dynamic_pointer_cast<CompoundExpr>(expr);
	assert(compound);


	int i = 0;
	int n = compound->size();

	int iterations = 0;
	while(i < n)
	{
		++iterations;
		ResourceCompiler::ArrayScope scope(compiler, name, iterations);
		for(FieldPtr f : fields)
		{
			if(f->needsValue())
			{
				assert(i < n);
				f->compile(compound->getItem(i++), compiler, prePass);
			}
			else
				f->compile(nullptr, compiler, prePass);
		}
	}

	if(!prePass && arrayCount)
	{
		int expected = arrayCount->evaluateInt(compiler);
		assert(expected == iterations);
	}
}


LabelField::LabelField(std::string name)
	: name(name)
{
}

bool LabelField::needsValue()
{
	return false;
}

void LabelField::compile(ExprPtr expr, ResourceCompiler *compiler, bool prePass)
{
	compiler->defineLabel(name);
}
