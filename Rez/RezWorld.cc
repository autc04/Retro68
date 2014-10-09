#include "RezWorld.h"
#include "ResourceCompiler.h"
#include "ResourceFiles.h"

#include <iostream>

RezWorld::RezWorld()
	: verboseFlag(false)
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

void RezWorld::addResource(ResType type, int id, CompoundExprPtr body)
{
	if(verboseFlag)
		std::cout << "RESOURCE " << type << "(" << id << ")" << std::endl;
	TypeDefinitionPtr def = getTypeDefinition(type, id);
	ResourceCompiler compiler(def, body, verboseFlag);
	compiler.compile();

	resources.addResource(Resource(type, id, compiler.resourceData()));
}
