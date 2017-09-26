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
#include <exception>

#include <Events.h>

class Foo
{
};

void foobar()
{
	throw Foo();
}

void UnexpectedExceptionOccurred()
{
	printf("std::unexpected called.\n");
	printf("Press Enter...\n");
	getchar();
	exit(1);
}

void UncaughtExceptionOccurred()
{
	printf("std::terminate called.\n");
	printf("Press Enter...\n");
	getchar();
	exit(1);
}

int main(int argc, char** argv)
{
	std::set_unexpected(&UnexpectedExceptionOccurred);
	std::set_terminate(&UncaughtExceptionOccurred);
	bool throwFail = false;
	bool catchFail = true;
	for(int i = 0; i < 5; i++)
	{
		int n = i == 0 ? 1 : 100;
		printf("Exception speed test (%3d iterations): ", n); fflush(stdout);
		long start = TickCount();
		for(int j = 0; j < n; j++)
		{
			try { foobar(); throwFail = true; } catch(...) { catchFail = false; }
		}
		long end = TickCount();

		printf("%g ms per throw/catch\n",(end-start)*1000 / 60.0 / n);
	}

	if(throwFail)
		printf("******** FAILURE: throw didn't really throw\n");
	if(catchFail)
		printf("******** FAILURE: catch block never entered\n");

	printf("Press Enter...\n");
	getchar();
	return 0;
}
