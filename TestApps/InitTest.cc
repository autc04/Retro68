/*
	 Copyright 2012 Wolfgang Thaller.

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

#include <stdio.h>
#include <stdlib.h>
#include <Events.h>

class Foo
{
public:
	Foo()
	{
		printf("Foo::Foo() was called.\n");
	}
	~Foo()
	{
		printf("Foo::~Foo() was called. (delaying 1 sec)\n");

		long start = TickCount();
		while(TickCount() < start + 60)
			;
	}

};

Foo foo;

__attribute__((constructor))
void con()
{
	printf("con() called.\n");
}
__attribute__((destructor))
void des()
{
	printf("des() called. (delaying 1 sec)\n");
	long start = TickCount();
	while(TickCount() < start + 60)
		;
}

int main(int argc, char** argv)
{
	printf("Entering main. Press Enter.\n");
	getchar();
	return 0;
}
