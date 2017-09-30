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

std::string SegmentMap::GetSegmentName(int id)
{
	for(auto& seg : segments)
	{
		if(seg.id == id)
			return seg.name;
	}
	return "";
}
