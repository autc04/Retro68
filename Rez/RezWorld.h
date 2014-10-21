#ifndef REZWORLD_H
#define REZWORLD_H

#include <map>
#include <stack>
#include <string>
#include "ResourceDefinitions.h"
#include "Expression.h"
#include "ResourceFork.h"
#include "ResSpec.h"

class RezWorld
{
	friend class RezParser;

	std::map<TypeSpec, TypeDefinitionPtr>	types;
	std::stack<FieldListPtr> fieldLists;
	std::stack<IdentifierExprPtr> functionCalls;
	std::stack<SwitchFieldPtr> switches;

	Resources resources;
public:
	RezWorld();
	void addTypeDefinition(TypeSpec spec, TypeDefinitionPtr type);

	TypeDefinitionPtr getTypeDefinition(ResType type, int id);

	void addResource(ResSpec spec, CompoundExprPtr body);
	void addData(ResSpec spec, const std::string& data);

	Resources& getResources() { return resources; }

	bool verboseFlag;
};


#endif // REZWORLD_H
