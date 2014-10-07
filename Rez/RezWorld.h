#ifndef REZWORLD_H
#define REZWORLD_H

#include <map>
#include <stack>
#include "ResourceDefinitions.h"
#include "Expression.h"

class RezWorld
{
	friend class RezParser;

	std::map<TypeSpec, TypeDefinitionPtr>	types;
	std::stack<FieldListPtr> fieldLists;
public:
	RezWorld();
	void addTypeDefinition(TypeSpec spec, TypeDefinitionPtr type);

	TypeDefinitionPtr getTypeDefinition(ResType type, int id);
};


#endif // REZWORLD_H
