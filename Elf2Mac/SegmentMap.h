#ifndef SEGMENTMAP_H
#define SEGMENTMAP_H

#include <vector>
#include <string>

class SegmentInfo
{
public:
	int id;
	std::string name;
	std::vector<std::string> filters;
	SegmentInfo();

	template<typename... Args>
	SegmentInfo(int id, std::string name, Args... args)
	    : id(id), name(name), filters { args... }
	{
	}

	void WriteFilters(std::ostream& out, std::string section);
	void WriteFiltersKeep(std::ostream& out, std::string section);
	void CreateLdScript(std::ostream& out);
};

class SegmentMap
{
	std::vector<SegmentInfo> segments;
public:
	SegmentMap();

	void CreateLdScript(std::ostream& out);
	std::string GetSegmentName(int id);
};

#endif // SEGMENTMAP_H
