#ifndef EXPRESSION_H
#define EXPRESSION_H

#include <memory>
#include <vector>

class ResourceCompiler;

class Expression;
class CompoundExpr;
class IdentifierExpr;
class CaseExpr;
typedef std::shared_ptr<Expression> ExprPtr;
typedef std::shared_ptr<CompoundExpr> CompoundExprPtr;
typedef std::shared_ptr<IdentifierExpr> IdentifierExprPtr;
typedef std::shared_ptr<CaseExpr> CaseExprPtr;


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
	virtual int evaluateInt(ResourceCompiler *ctx);
	virtual std::string evaluateString(ResourceCompiler *ctx);
	virtual ~Expression();
};

class StringExpr : public Expression
{
	std::string str;
public:
	StringExpr(const std::string& str) : str(str) {}
	~StringExpr();
	virtual std::string evaluateString(ResourceCompiler *ctx);
};

class IntExpr : public Expression
{
	int val;
public:
	IntExpr(int val) : val(val) {}
	~IntExpr();

	virtual int evaluateInt(ResourceCompiler *ctx);
};

class CompoundExpr : public Expression
{
	std::vector<ExprPtr> items;
public:
	void addItem(ExprPtr item);
	ExprPtr getItem(int i) const { return items[i]; }
	int size() const { return items.size(); }

	~CompoundExpr();
};

class CaseExpr : public Expression
{
	std::string tag;
	CompoundExprPtr expr;
	friend class SwitchField;
public:
	CaseExpr(const std::string& tag, CompoundExprPtr expr);
};

class BinaryExpr : public Expression
{
	BinaryOp op;
	ExprPtr a, b;
public:
	BinaryExpr(BinaryOp op, ExprPtr a, ExprPtr b)
		: op(op), a(a), b(b) {}
	~BinaryExpr();

	virtual int evaluateInt(ResourceCompiler *ctx);
};

class UnaryExpr : public Expression
{
	UnaryOp op;
	ExprPtr a;
public:
	UnaryExpr(UnaryOp op, ExprPtr a)
		: op(op), a(a) {}
	~UnaryExpr();

	virtual int evaluateInt(ResourceCompiler *ctx);
};

class IdentifierExpr : public Expression
{
	std::string id;
	std::vector<ExprPtr> arguments;
	bool isFunction;
public:
	IdentifierExpr(std::string id, bool isFunction = false);

	void addArgument(ExprPtr e);
	virtual int evaluateInt(ResourceCompiler *ctx);
};

#endif // EXPRESSION_H
