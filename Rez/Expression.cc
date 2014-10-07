#include "Expression.h"
#include "ResourceCompiler.h"
#include <cassert>
#include <iostream>

int Expression::evaluateInt(ResourceCompiler *ctx)
{
	throw TypeError();
}

Expression::~Expression()
{
}


StringExpr::~StringExpr()
{
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


IdentifierExpr::IdentifierExpr(std::string id, bool isFunction)
	: id(id), isFunction(isFunction)
{
}

void IdentifierExpr::addArgument(ExprPtr e)
{
	arguments.push_back(e);
}

int IdentifierExpr::evaluateInt(ResourceCompiler *ctx)
{
	if(isFunction)
	{
		if(id == "$$countof" || id == "$$arrayindex")
		{
			assert(arguments.size() == 1);
			IdentifierExprPtr arr = std::dynamic_pointer_cast<IdentifierExpr>(arguments[0]);
			assert(arr);
			if(id == "$$countof")
				return ctx->getArrayCount(arr->id);
			else
				return ctx->getArrayIndex(arr->id);
		}
		else
		{
			std::cout << id << std::endl;
			assert(false);
		}
	}
	else
	{
		ExprPtr val = ctx->lookupIdentifier(id);
		assert(val);
		return val->evaluateInt(ctx);
	}
}
