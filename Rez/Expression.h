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
	XOR, OR, AND, SHIFTLEFT, SHIFTRIGHT, EQUAL, NOTEQUAL, PLUS, MINUS, MULTIPLY, DIVIDE, CONCAT
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
	virtual std::string evaluateString(ResourceCompiler *ctx);
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
public:
	std::string id;
	std::vector<ExprPtr> arguments;
	IdentifierExpr(std::string id);

	void addArgument(ExprPtr e);
	ExprPtr lookup(ResourceCompiler *ctx);
	virtual int evaluateInt(ResourceCompiler *ctx);
	virtual std::string evaluateString(ResourceCompiler *ctx);
};

class CountOfExpr : public Expression
{
	IdentifierExprPtr arg;
public:
	CountOfExpr(IdentifierExprPtr arg) : arg(arg) {}
	virtual int evaluateInt(ResourceCompiler *ctx);
};

class ArrayIndexExpr : public Expression
{
	IdentifierExprPtr arg;
public:
	ArrayIndexExpr(IdentifierExprPtr arg) : arg(arg) {}
	virtual int evaluateInt(ResourceCompiler *ctx);
};

class ReadExpr : public Expression
{
	ExprPtr arg;
public:
	ReadExpr(ExprPtr arg) : arg(arg) {}
	virtual std::string evaluateString(ResourceCompiler *ctx);
};

class UnimplementedExpr : public Expression
{
	std::string msg;
public:
	UnimplementedExpr(std::string msg) : msg(msg) {}
	virtual int evaluateInt(ResourceCompiler *ctx);
	virtual std::string evaluateString(ResourceCompiler *ctx);
};

class PeekExpr : public Expression
{
	ExprPtr addr;
	ExprPtr offset;
	ExprPtr size;
public:
	PeekExpr(ExprPtr addr, ExprPtr offset, ExprPtr size);
	PeekExpr(ExprPtr addr, int size);
	virtual int evaluateInt(ResourceCompiler *ctx);
};

#endif // EXPRESSION_H
