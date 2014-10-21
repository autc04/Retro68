#include "RezWorld.h"
#include "ResourceCompiler.h"
#include "ResourceFork.h"

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

void RezWorld::addResource(ResSpec spec, CompoundExprPtr body)
{
	if(verboseFlag)
		std::cout << "RESOURCE " << spec.type() << "(" << spec.id() << ", " << "\"" << spec.name() << "\"" << spec.attr() << ")" << std::endl;
	TypeDefinitionPtr def = getTypeDefinition(spec.type(), spec.id());
	ResourceCompiler compiler(def, body, verboseFlag);
	compiler.compile();

	resources.addResource(Resource(spec.type(), spec.id(), compiler.resourceData(), spec.name(), spec.attr()));
}

void RezWorld::addData(ResSpec spec, const std::string &data)
{
	if(verboseFlag)
		std::cout << "DATA " << spec.type() << "(" << spec.id() << ", " << "\"" << spec.name() << "\"" << spec.attr() << ")" << std::endl;
	resources.addResource(Resource(spec.type(), spec.id(), data, spec.name(), spec.attr()));
}
