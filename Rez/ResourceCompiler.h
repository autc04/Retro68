#ifndef RESOURCECOMPILER_H
#define RESOURCECOMPILER_H

#include "Expression.h"
#include "ResourceDefinitions.h"

class Field;


class Subscripts
{
	std::vector<int> subscripts;
public:
	Subscripts();
	~Subscripts();

	void addSubscript(int x);
	void popSubscript();
	bool operator<(const Subscripts& other) const;
	bool empty() const { return subscripts.empty(); }
};

class ResourceCompiler
{
	TypeDefinitionPtr typeDefinition;
	CompoundExprPtr body;
	std::map<std::pair<std::string, Subscripts>, ExprPtr> labelValues;
	std::map<std::pair<std::string, Subscripts>, int> arrayCounts;
	std::map<std::string, int> curArrayIndices;
	int currentOffset;
	Field* currentField;
	Subscripts currentSubscripts;

	void beginArrayScope(std::string& arrayName, int index);
public:
	ResourceCompiler(TypeDefinitionPtr type, CompoundExprPtr body);

	void reserve(int nBits) { write(nBits, 0); }
	void write(int nBits, int value);
	int tell() { return currentOffset; }

	ExprPtr lookupIdentifier(std::string name, const Subscripts& sub = Subscripts());

	void defineLabel(const std::string& name);
	void compile();

	int getArrayCount(const std::string& arrayName);
	int getArrayIndex(const std::string& arrayName);

	class FieldScope
	{
		ResourceCompiler *compiler;
	public:
		FieldScope(ResourceCompiler* compiler, Field *field)
			: compiler(compiler) { compiler->currentField = field; }
		~FieldScope() { compiler->currentField = nullptr; }
	};

	class ArrayScope
	{
		ResourceCompiler *compiler;
	public:
		ArrayScope(ResourceCompiler* compiler, std::string& arrayName, int index)
			: compiler(compiler) { compiler->beginArrayScope(arrayName, index); }
		~ArrayScope() { compiler->currentSubscripts.popSubscript(); }
	};
};



#endif // RESOURCECOMPILER_H
