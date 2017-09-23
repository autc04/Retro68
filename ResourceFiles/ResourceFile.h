#ifndef RESOURCEFILE_H
#define RESOURCEFILE_H

#include <memory>
#include "ResType.h"
#include "ResourceFork.h"

class ResourceFile
{
public:
	enum class Format
	{
		autodetect,
#ifdef __APPLE__
		real,
#endif
		macbin,
		diskimage,
		basilisk,
		applesingle,
		underscore_appledouble,
		percent_appledouble
	};

	ResourceFile();
	ResourceFile(std::string path, Format f = Format::autodetect);
	~ResourceFile();

	bool assign(std::string path, Format f = Format::autodetect);

	bool read();
	bool write();

	std::string pathstring;
	Format format;
	ResType type;
	ResType creator;
	Resources resources;
	std::string data;
};

#endif // RESOURCEFILE_H
