#include "Expression.h"



int Expression::evaluateInt(Context *ctx)
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

int IntExpr::evaluateInt(Context *ctx)
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

int BinaryExpr::evaluateInt(Context *ctx)
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

int UnaryExpr::evaluateInt(Context *ctx)
{
	switch(op)
	{
		case UnaryOp::MINUS:
			return -a->evaluateInt(ctx);
		case UnaryOp::COMPLEMENT:
			return ~a->evaluateInt(ctx);
	}
}
