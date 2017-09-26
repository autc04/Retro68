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
	segments.emplace_back(3, "libstdc++",
	                      "*/libstdc++.a:*");
	segments.emplace_back(4, "RetroConsole",
	                      "*/libRetroConsole.a:*");

	segments.emplace_back(2, "Main",
	                      "*");
}
