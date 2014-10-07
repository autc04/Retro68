#ifndef EXPRESSION_H
#define EXPRESSION_H

#include <memory>
#include <vector>

class Context
{

};



class Expression;
class CompoundExpr;
typedef std::shared_ptr<Expression> ExprPtr;
typedef std::shared_ptr<CompoundExpr> CompoundExprPtr;


enum class BinaryOp
{
	XOR, OR, AND, SHIFTLEFT, SHIFTRIGHT, EQUAL, NOTEQUAL, PLUS, MINUS, MULTIPLY, DIVIDE
};

enum class UnaryOp
{
	MINUS, COMPLEMENT
};

class TypeError
{
};

class Expression
{
public:
	virtual int evaluateInt(Context *ctx);
	virtual ~Expression();
};

class StringExpr : public Expression
{
	std::string str;
public:
	StringExpr(const std::string& str) : str(str) {}
	~StringExpr();
};

class IntExpr : public Expression
{
	int val;
public:
	IntExpr(int val) : val(val) {}
	~IntExpr();

	virtual int evaluateInt(Context *ctx);
};

class CompoundExpr : public Expression
{
	std::vector<ExprPtr> items;
public:
	void addItem(ExprPtr item);
	ExprPtr getItem(int i) { return items[i]; }
	~CompoundExpr();
};

class BinaryExpr : public Expression
{
	BinaryOp op;
	ExprPtr a, b;
public:
	BinaryExpr(BinaryOp op, ExprPtr a, ExprPtr b)
		: op(op), a(a), b(b) {}
	~BinaryExpr();

	virtual int evaluateInt(Context *ctx);
};

class UnaryExpr : public Expression
{
	UnaryOp op;
	ExprPtr a;
public:
	UnaryExpr(UnaryOp op, ExprPtr a)
		: op(op), a(a) {}
	~UnaryExpr();

	virtual int evaluateInt(Context *ctx);
};



#endif // EXPRESSION_H
