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

#ifndef OBJECT_H
#define OBJECT_H

#include <gelf.h>

#include <unordered_map>
#include <vector>
#include <string>
#include <memory>
#include <stdlib.h>
#include <iosfwd>

class Symtab;
class Section;
class SegmentMap;

class Object
{
public:
	Elf *elf;
	std::unique_ptr<Symtab> symtab;
	std::unordered_map<std::string, std::shared_ptr<Section>> sections;
	std::unordered_map<int, std::shared_ptr<Section>> sectionsByElfIndex;

	std::vector<std::shared_ptr<Section>> codeSections;
	std::shared_ptr<Section> dataSection, bssSection;
	size_t sectionHeaderStringTableIdx;
	size_t mainStringTableIdx;


	Object(std::string input);
	~Object();

	void FlatCode(std::ostream& out);
	void FlatCode(std::string fn);

	void SingleSegmentApp(std::string output);
	void MultiSegmentApp(std::string output, SegmentMap &segmentMap);
};


#endif // OBJECT_H
