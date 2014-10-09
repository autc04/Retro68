#ifndef REZWORLD_H
#define REZWORLD_H

#include <map>
#include <stack>
#include "ResourceDefinitions.h"
#include "Expression.h"
#include "ResourceFiles.h"

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

	void addResource(ResType type, int id, CompoundExprPtr body);

	Resources& getResources() { return resources; }

	bool verboseFlag;
};


#endif // REZWORLD_H
