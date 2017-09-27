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
