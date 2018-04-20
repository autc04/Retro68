#ifndef UTILITIES_H
#define UTILITIES_H

#include <string>
#include <vector>

int ChildProcess(std::string program, std::vector<std::string> args, int timeout);


/**
 * @brief CheckExecutable
 * @param program
 * @return true if "program" exists in the $PATH and is executable.
 */
bool CheckExecutable(std::string program);


std::vector<std::string> SplitArguments(std::string str);
std::vector<std::string> SplitArguments(std::vector<std::string> strs);

#endif // UTILITIES_H
