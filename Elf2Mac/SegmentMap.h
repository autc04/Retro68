/*
	 Copyright 2017 Wolfgang Thaller.

	 This file is part of Retro68.

	 Retro68 is free software: you can redistribute it and/or modify
	 it under the terms of the GNU General Public License as published by
	 the Free Software Foundation, either version 3 of the License, or
	 (at your option) any later version.

	 Retro68 is distributed in the hope that it will be useful,
	 but WITHOUT ANY WARRANTY; without even the implied warranty of
	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	 GNU General Public License for more details.

	 You should have received a copy of the GNU General Public License
	 along with Retro68.  If not, see <http://www.gnu.org/licenses/>.
*/

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

	void CreateLdScript(std::ostream& out, bool stripMacsbug);
	std::string GetSegmentName(int id);
};

#endif // SEGMENTMAP_H
