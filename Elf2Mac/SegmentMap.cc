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

#include "SegmentMap.h"
#include <fstream>
#include <cctype>
#include <algorithm>
#include <iostream>

SegmentInfo::SegmentInfo()
{
}

SegmentMap::SegmentMap()
{
	segments.emplace_back(1, "Runtime",
	                      "*/libretrocrt.a:start.c.obj",
	                      "*/libretrocrt.a:relocate.c.obj",
	                      "*/libretrocrt.a:MultiSegApp.c.obj",
	                      "*/libretrocrt.a:LoadSeg.s.obj",
	                      "*/libretrocrt.a:*",
                          "*/libInterface.a:*",
        	              "*/libgcc.a:*",
	                      "*/libc.a:*"
	                      );
	segments.emplace_back(5, "libstdc++ locale",
	                      "*/libstdc++.a:locale.o",
	                      "*/libstdc++.a:locale_faces.o",
	                      "*/libstdc++.a:locale_init.o");
	segments.emplace_back(7, "libstdc++ locale-inst",
	                      "*/libstdc++.a:locale-inst.o");
	segments.emplace_back(8, "libstdc++ wlocale-inst",
	                      "*/libstdc++.a:wlocale-inst.o");
	segments.emplace_back(6, "libstdc++ cp-demangle",
	                      "*/libstdc++.a:cp-demangle.o");
	segments.emplace_back(3, "libstdc++",
	                      "*/libstdc++.a:*");
	segments.emplace_back(4, "RetroConsole",
	                      "*/libRetroConsole.a:*");

	segments.emplace_back(2, "Main",
	                      "*");
}

SegmentMap::SegmentMap(std::string filename)
{
	segments.emplace_back(1, "Runtime",
	                      "*/libretrocrt.a:start.c.obj",
	                      "*/libretrocrt.a:relocate.c.obj",
	                      "*/libretrocrt.a:MultiSegApp.c.obj",
	                      "*/libretrocrt.a:LoadSeg.s.obj",
	                      "*/libretrocrt.a:*",
                          "*/libInterface.a:*",
	                      "*/libgcc.a:*",
	                      "*/libc.a:*"
	                      );

	std::ifstream in(filename);
	int id = -1;
	int nextID = 3;
	while(in)
	{
		std::string s;
		in >> std::ws;
		std::getline(in, s);
		std::cout << "segs: " << s << std::endl;
		if(!in)
			break;

		std::string upper;
		std::transform(s.begin(), s.end(), std::back_inserter(upper), [](char c) { return std::toupper(c); });

		if(s[0] == '#')
			continue;
		else if(upper == "SEGMENT" || (upper.substr(0,7) == "SEGMENT" && std::isspace(upper[7])))
		{
			std::string name;

			auto p = s.begin() + 7;
			while(p != s.end() && std::isspace(*p))
				++p;
			name = std::string(p, s.end());
			id = nextID++;

			segments.emplace_back(id, name);
		}
		else
		{
			if(id < 0)
			{
				throw std::runtime_error("missing SEGMENT directive.\n");
			}

			segments.back().filters.push_back(s);
		}
	}

	segments.emplace_back(2, "Main",
	                      "*");
}

std::string SegmentMap::GetSegmentName(int id)
{
	for(auto& seg : segments)
	{
		if(seg.id == id)
			return seg.name;
	}
	return "";
}
