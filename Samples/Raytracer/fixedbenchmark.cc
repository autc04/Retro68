/*
	Copyright 2014 Wolfgang Thaller.

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

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <vector>

#include <Events.h>

#include "fixed.h"
#include <cmath>

using std::sqrt;

class timer
{
	long t;
public:
	timer() : t(TickCount()) {}
	float elapsed() { return (TickCount() - t) / 60.15f; }
};

template<class number>
void runTests(std::string type, std::vector<number>& numbers)
{
	std::cout << "***********************************\n";
	std::cout << "Running tests on type " << type << ":\n";
	std::cout << "***********************************\n";

	int n = numbers.size();
	std::vector<number> outputs(n);

	std::cout << "Testing Multiplication..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = numbers[i] * numbers[n - i - 1];
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}

	std::cout << "Testing Division..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = numbers[i] / numbers[n - i - 1];
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}

	std::cout << "Testing Square Root..." << std::flush;
	{
		timer t;
		for(int i = 0; i < n; i++)
		{
			outputs[i] = sqrt(numbers[i]);
		}
		std::cout << 1000 * t.elapsed() / n << "ms\n";
	}
	std::cout << std::endl;
}

int main(int argc, char** argv)
{
	std::cout << "Hello, world.\n";
	
	std::cout << "Generating numbers..." << std::flush;
	
	const size_t n = 1000;
	std::vector<fixed> numbers(n);
	std::vector<float> floats(n);
	std::vector<double> doubles(n);

	for(size_t i = 0; i < numbers.size(); i++)
	{
		numbers[i] = fixed(std::rand(), fixed::raw());
		floats[i] = float(std::rand()) / RAND_MAX;
		doubles[i] = double(std::rand()) / RAND_MAX;
	}
	std::vector<fixed> outputs(n);
	std::cout << "done.\n\n";
	
	runTests("float", floats);
	runTests("double", doubles);
	runTests("fixed", numbers);

	std::cout << "Press Enter to Exit ;-)\n";
	
	std::cin.get();
	
	return 0;
}
