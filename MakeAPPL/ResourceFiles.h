#ifndef RESOURCEFILES_H
#define RESOURCEFILES_H

#include <string>
#include <vector>

class Resource
{
	std::string type;
	int id;
	std::string name;
	std::string data;
	int attr;
public:
	Resource(std::string type, int id, std::string data, std::string name = "", int attr = 0)
		: type(type), id(id), data(data), name(name), attr(attr) {}

	const std::string& getData() const { return data; }
	inline std::string getType() const { return type; }
	inline int getID() const { return id; }
};

class Fork
{
public:
	 virtual void writeFork(std::ostream& out) const { }
	 virtual ~Fork() {}
};

class Resources : public Fork
{
	std::vector<Resource> resources;
public:
	Resources() {}
	Resources(std::istream& in);
	void writeFork(std::ostream& out) const;
	void addResource(Resource res) { resources.push_back(res); }

	void addResources(const Resources& res);
};

#endif // RESOURCEFILES_H
