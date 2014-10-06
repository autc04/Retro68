#ifndef RESOURCEDEFINITIONS_H
#define RESOURCEDEFINITIONS_H

#include <iosfwd>
#include <memory>
#include <map>

class ResType
{
	int x;
public:
	ResType() : x(0) {}
	ResType(int x) : x(x) {}
	operator int() const { return x; }
};

std::ostream& operator<<(std::ostream& out, ResType t);

class TypeSpec
{
	ResType type;
	int id;
public:
	static const int noID = 65536;

	TypeSpec() : id(noID) {}
	TypeSpec(ResType type) : type(type), id(noID) {}
	TypeSpec(ResType type, int id) : type(type), id(id) {}

	ResType getType() const { return type; }
	int getID() const { return id; }

	bool hasID() const { return id != noID; }
};

std::ostream& operator<<(std::ostream& out, TypeSpec ts);

class Context
{

};

class Expression
{
public:
	//virtual int evaluateInt(Context *ctx);

};

class StringExpr : public Expression
{
	std::string str;
public:
	StringExpr(const std::string& str) : str(str) {}
};

class IntExpr : public Expression
{
	int val;
public:
	IntExpr(int val) : val(val) {}
};

typedef std::shared_ptr<Expression> ExprPtr;

class Field
{
public:
	virtual bool needsValue() { return true; }
};
typedef std::shared_ptr<Field> FieldPtr;

class SimpleField : public Field
{
public:
	enum class Type
	{
		boolean, byte, integer, longint, rect, point, char_,
		pstring, wstring, string, bitstring
	};

	enum class Attrs
	{
		none = 0, hex = 1, key = 2, unsigned_ = 4, literal = 8
	};

	Type type;
	Attrs attrs = Attrs::none;
	ExprPtr arrayCount;

	ExprPtr	value;
	std::map<std::string, ExprPtr> namedValues;

	void addNamedValue(std::string n) {}
	void addNamedValue(std::string n, ExprPtr val) {}
};
typedef std::shared_ptr<SimpleField> SimpleFieldPtr;


inline SimpleField::Attrs operator|(SimpleField::Attrs a, SimpleField::Attrs b)
{
	return SimpleField::Attrs( int(a) | int(b) );
}


class ResourceDefinitions
{
public:
	ResourceDefinitions();
};

#endif // RESOURCEDEFINITIONS_H
