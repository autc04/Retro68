#include "RezWorld.h"

RezWorld::RezWorld()
{
}

void RezWorld::addTypeDefinition(TypeSpec spec, TypeDefinitionPtr type)
{
	types[spec] = type;
}

TypeDefinitionPtr RezWorld::getTypeDefinition(ResType type, int id)
{
	auto p = types.find(TypeSpec(type, id));
	if(p != types.end())
		return p->second;
	p = types.find(TypeSpec(type));
	if(p != types.end())
		return p->second;

	return nullptr;
}
