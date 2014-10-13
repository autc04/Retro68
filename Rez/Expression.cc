#include "Expression.h"
#include "ResourceCompiler.h"
#include <cassert>
#include <iostream>
#include <fstream>

int Expression::evaluateInt(ResourceCompiler *ctx)
{
	throw TypeError();
}

std::string Expression::evaluateString(ResourceCompiler *ctx)
{
	throw TypeError();
}

Expression::~Expression()
{
}


StringExpr::~StringExpr()
{
}

std::string StringExpr::evaluateString(ResourceCompiler *ctx)
{
	return str;
}


IntExpr::~IntExpr()
{
}

int IntExpr::evaluateInt(ResourceCompiler *ctx)
{
	return val;
}


void CompoundExpr::addItem(ExprPtr item)
{
	items.push_back(item);
}

CompoundExpr::~CompoundExpr()
{
}


BinaryExpr::~BinaryExpr()
{
}

int BinaryExpr::evaluateInt(ResourceCompiler *ctx)
{
	switch(op)
	{
		case BinaryOp::XOR:
			return a->evaluateInt(ctx) ^ b->evaluateInt(ctx);
		case BinaryOp::OR:
			return a->evaluateInt(ctx) | b->evaluateInt(ctx);
		case BinaryOp::AND:
			return a->evaluateInt(ctx) & b->evaluateInt(ctx);
		case BinaryOp::SHIFTLEFT:
			return a->evaluateInt(ctx) << b->evaluateInt(ctx);
		case BinaryOp::SHIFTRIGHT:
			return a->evaluateInt(ctx) >> b->evaluateInt(ctx);
		case BinaryOp::EQUAL:
			return a->evaluateInt(ctx) == b->evaluateInt(ctx);
		case BinaryOp::NOTEQUAL:
			return a->evaluateInt(ctx) != b->evaluateInt(ctx);
		case BinaryOp::PLUS:
			return a->evaluateInt(ctx) + b->evaluateInt(ctx);
		case BinaryOp::MINUS:
			return a->evaluateInt(ctx) - b->evaluateInt(ctx);
		case BinaryOp::MULTIPLY:
			return a->evaluateInt(ctx) * b->evaluateInt(ctx);
		case BinaryOp::DIVIDE:
			return a->evaluateInt(ctx) / b->evaluateInt(ctx);
		default:
			throw TypeError();
			break;
	}
}

std::string BinaryExpr::evaluateString(ResourceCompiler *ctx)
{
	switch(op)
	{
		case BinaryOp::CONCAT:
			return a->evaluateString(ctx) + b->evaluateString(ctx);
		default:
			throw TypeError();
			break;
	}
}


UnaryExpr::~UnaryExpr()
{
}

int UnaryExpr::evaluateInt(ResourceCompiler *ctx)
{
	switch(op)
	{
		case UnaryOp::MINUS:
			return -a->evaluateInt(ctx);
		case UnaryOp::COMPLEMENT:
			return ~a->evaluateInt(ctx);
	}
}


IdentifierExpr::IdentifierExpr(std::string id)
	: id(id)
{
}

void IdentifierExpr::addArgument(ExprPtr e)
{
	arguments.push_back(e);
}

ExprPtr IdentifierExpr::lookup(ResourceCompiler *ctx)
{
	Subscripts sub;
	for(auto arg : arguments)
		sub.addSubscript(arg->evaluateInt(ctx));
	ExprPtr val = ctx->lookupIdentifier(id, sub);
	assert(val);
	return val;
}

int IdentifierExpr::evaluateInt(ResourceCompiler *ctx)
{
	if(ctx->isPrePass())
		return 0;
	return lookup(ctx)->evaluateInt(ctx);
}

std::string IdentifierExpr::evaluateString(ResourceCompiler *ctx)
{
	return lookup(ctx)->evaluateString(ctx);
}


CaseExpr::CaseExpr(const std::string &tag, CompoundExprPtr expr)
	: tag(tag), expr(expr)
{
}


int CountOfExpr::evaluateInt(ResourceCompiler *ctx)
{
	assert(arg->arguments.size() == 0);
	return ctx->getArrayCount(arg->id);
}


int ArrayIndexExpr::evaluateInt(ResourceCompiler *ctx)
{
	assert(arg->arguments.size() == 0);
	return ctx->getArrayIndex(arg->id);
}


std::string ReadExpr::evaluateString(ResourceCompiler *ctx)
{
	std::string filename = arg->evaluateString(ctx);
	std::ifstream instream(filename);
	// ### TODO: check error
	return std::string(std::istreambuf_iterator<char>(instream.rdbuf()),
					   std::istreambuf_iterator<char>());
}


int UnimplementedExpr::evaluateInt(ResourceCompiler *ctx)
{
	std::cerr << msg << std::endl;
	return 0;
}

std::string UnimplementedExpr::evaluateString(ResourceCompiler *ctx)
{
	std::cerr << msg << std::endl;
	return "";
}


PeekExpr::PeekExpr(ExprPtr addr, ExprPtr offset, ExprPtr size)
	: addr(addr), offset(offset), size(size)
{
}

PeekExpr::PeekExpr(ExprPtr addr, int size)
	: addr(addr),
	  offset(std::make_shared<IntExpr>(0)),
	  size(std::make_shared<IntExpr>(size))
{
}

int PeekExpr::evaluateInt(ResourceCompiler *ctx)
{
	int p = addr->evaluateInt(ctx) + offset->evaluateInt(ctx);
	int s = size->evaluateInt(ctx);

	return ctx->peek(p, s);
}
