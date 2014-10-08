#include "ResourceCompiler.h"
#include <iostream>
#include "ResourceDefinitions.h"

ResourceCompiler::ResourceCompiler(TypeDefinitionPtr type, CompoundExprPtr body)
	: typeDefinition(type), body(body), currentOffset(0), currentField(nullptr)
{

}

std::string ResourceCompiler::resourceData()
{
	return std::string(data.begin(), data.end());
}

void ResourceCompiler::write(int nBits, int value)
{
	std::cout << "[" << nBits << " bits] = " << std::hex << value << std::dec << std::endl;

	unsigned mask = 1 << (nBits-1);

	for(int i = 0; i < nBits; i++)
	{
		bool bit = (value & mask) != 0;

		if(currentOffset % 8 == 0)
			data.push_back(bit ? 0x80 : 0);
		else if(bit)
			data.back() |= (0x80 >> (currentOffset % 8));
		++currentOffset;

		mask >>= 1;
	}

	//currentOffset += nBits;
}

ExprPtr ResourceCompiler::lookupIdentifier(std::string name, const Subscripts &sub)
{
	if(currentField)
	{
		if(ExprPtr val = currentField->lookupNamedValue(name))
		{
			std::cout << "current field: " << name << " found.";
			return val;
		}
	}

	auto p = labelValues.find(std::make_pair(name, sub));
	if(p != labelValues.end())
		return p->second;

	std::cout << "ID lookup failed: " << name << std::endl;

	return nullptr;
}

void ResourceCompiler::defineLabel(const std::string &name)
{
	labelValues[std::make_pair(name,currentSubscripts)] = std::make_shared<IntExpr>(currentOffset);
}

void ResourceCompiler::compile()
{
	std::cout << "(first pass)\n";
	currentOffset = 0;
	data.clear();
	typeDefinition->compile(body, this, true);
	std::cout << "(second pass)\n";
	currentOffset = 0;
	data.clear();
	typeDefinition->compile(body, this, false);
	std::cout << "(done)\n";

}

int ResourceCompiler::getArrayCount(const std::string &name)
{
	Subscripts sub = currentSubscripts;
	for(;;)
	{
		auto p = arrayCounts.find(std::make_pair(name, sub));
		if(p != arrayCounts.end())
			return p->second;


		if(sub.empty())
			return 0; /* ### */
		sub.popSubscript();
	}
}

int ResourceCompiler::getArrayIndex(const std::string &arrayName)
{
	return curArrayIndices[arrayName];
}

void ResourceCompiler::beginArrayScope(std::string &arrayName, int index)
{
	if(arrayName != "")
	{
		curArrayIndices[arrayName] = index;
		int& count = arrayCounts[std::make_pair(arrayName, currentSubscripts)];
		if(count < index)
			count = index;
		arrayCounts[std::make_pair(arrayName, Subscripts())] = count;
		//std::cout << "count for " << arrayName << " is " << count << std::endl;
	}
	currentSubscripts.addSubscript(index);
}

Subscripts::Subscripts()
{
}

Subscripts::~Subscripts()
{
}

void Subscripts::addSubscript(int x)
{
	subscripts.push_back(x);
}

void Subscripts::popSubscript()
{
	subscripts.pop_back();
}

bool Subscripts::operator<(const Subscripts &other) const
{
	if(subscripts.size() < other.subscripts.size())
		return true;
	if(other.subscripts.size() < subscripts.size())
		return false;
	for(int i = 0, n = subscripts.size(); i < n; i++)
	{
		if(subscripts[i] < other.subscripts[i])
			return true;
		else if(subscripts[i] > other.subscripts[i])
			return false;
	}
	return false;
}
