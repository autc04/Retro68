/*
	Copyright (C) 2025 Mikael Hildenborg
	SPDX-License-Identifier: BSD-2-Clause
*/

#include "atari-gem_basepage.h"

/*
	The functions:
		void setup_env_and_args(void *mem_ptr)
		int estimate_env_and_args_memory(void)
	are called from atari-crti.S and should be handled with care.
*/

extern char **environ;		// setup_env_and_args will set this up.

// Atari TOS do not supply any method of finding out the name of the application that is running.
// So we default a name here to have a proper arg1.
const char _proc_name[] = "_undefin.ed_";

extern const char* _atari_4be_at_prg_start;	// Global environment
const char **_atari_argv;
int _atari_argc;

// If storage_list is 0, then vars is only counted.
// If argv_arg is not 0, then the value of ARGV= is stored there if found.
int extract_env_vars(const char* env, const char** storage_list, const char** argv_arg)
{
	int num = 0;
	if (env != 0)
	{
		// If we find a double null without a previous '=', then the string from the last var
		// up to the double null must be discarded (aes bug).
		while (env[0] != 0)		// loop until double null (string beginning with null)
		{
			const char* cvar = env;
			short found_equal = 0;
			short len_since_equal = 0;
			while (env[0] != 0)
			{
				if (found_equal != 0) {++len_since_equal;}
				if (env[0] == '=') {found_equal = 1;}
				++env;
			}
			++env;
			if (found_equal == 0 || len_since_equal == 0)
			{
				// This string is not valid, we should ignore it.
				if (env[0] == 0)
				{
					// Double null after invalid string, ignore it.
					++env;
				}
			}
			else
			{
				if (argv_arg != 0 && (env - cvar) > 5 && 
					(cvar[0] == 'A' && cvar[1] == 'R' && cvar[2] == 'G' && cvar[3] == 'V' && cvar[4] == '='))
				{
					*argv_arg = cvar + 5;
					// We do not count ARGV as it is a part of command line.
				}
				else
				{
					if (storage_list != 0)
					{
						storage_list[num] = cvar;
					}
					++num;
				}
			}
		}
	}
	return num;
}

int extract_cmd_args(const char* prg_cmd_line, const char* argv_arg, int* cmd_line_chars, const char** storage_list, char* cmd_line_out)
{
	int num = 0;
	if (storage_list != 0)
	{
		storage_list[num] = _proc_name; 
	}
	++num;

	int cmd_line_len = ((const unsigned char*)prg_cmd_line)[0];
	cmd_line_chars[0] = 0;
	if (cmd_line_len == 0)
	{
		return num;
	}
	if (cmd_line_len != 127)
	{
		// Only use ARGV if length is 127
		argv_arg = 0;
	}

	const char* cmdline = prg_cmd_line + 1;
	char expect = 0;
	char *arg_start = cmd_line_out;
	int arglen = 0;
	while (cmdline != 0)
	{
		char c;
		while ((c = *cmdline++) != 0)
		{
			if (c == '\\' && expect == 0)
			{
				// Next char will be escaped.
				expect = '\\';
			}
			else if ((c == '\'' || c == '\"') && (expect == c || expect == 0))
			{
				// chars between "" or '' should not be escaped nor spaces split into args.
				expect ^= c;
			}
			else if (c == ' ' && expect == 0)
			{
				if (arglen != 0)
				{
					// found one arg
					if (cmd_line_out != 0) {*cmd_line_out++ = 0;}
					cmd_line_chars[0]++;
					if (storage_list != 0)
					{
						storage_list[num] = arg_start; 
					}
					++num;
					arglen = 0;	// Next arg
					arg_start = cmd_line_out;
				}
			}
			else
			{
				if (expect == '\\')
				{
					// Only escape one char.
					expect = 0;
				}
				if (cmd_line_out != 0) {*cmd_line_out++ = c;}
				cmd_line_chars[0]++;
				++arglen;
			}
		}

		// Continue with extended command line if we have one.
		cmdline = argv_arg;
		argv_arg = 0;	// To end loop
	}
	if (arglen != 0)
	{
		if (cmd_line_out != 0) {*cmd_line_out++ = 0;}
		cmd_line_chars[0]++;
		if (storage_list != 0)
		{
			storage_list[num] = arg_start; 
		}
		++num;
	}
	return num;
}

/*
prg_cmd_line:
	First byte = length of prg_cmd_line.
	If length == 127 then "ARGV=" in prg_env contains a string that should be appended to prg_cmd_line.
prg_env:
	Contains a set of null terminated strings.
	Double null ends set.
global_env:
	Contains a set of null terminated strings.
	Double null ends set.
	AES versions >= 1.4 may multi-args (PATH) with ',', before it was only ';'
	A bug in AES can cause strings like: "PATH=[nul]A:\[nul][nul]". They should be ignored.

Due to how existing software sets up environment variables on Atari, global_env and prg_env can
contain duplicates.
So duplicates will be discarded with prg_env having higher priority than global_env.
*/
void setup_env_and_args(void *mem_ptr)
{
	/*
		mem_ptr is guaranteed have the number of bytes reserved that function
		estimate_env_and_args_memory calculates.
	*/
	const char* argv_arg = 0;
	const char* prg_cmd_line = _BasePage->p_cmdlin;
	const char* prg_env = _BasePage->p_env;
	const char* global_env = _atari_4be_at_prg_start;

	// Collect all environment variables.
	environ = (char**)mem_ptr;
	int num_env_args = extract_env_vars(prg_env, (const char**)environ, &argv_arg);
	num_env_args += extract_env_vars(global_env, (const char**)environ, 0);
	/*
		Remove duplicates.
		Not fun as we cannot use any library functions here.
	*/
	for (int i = 0; i < num_env_args; ++i)
	{
		char* vari = environ[i];
		if (vari != 0)
		{
			for (int j = i + 1; j < num_env_args; ++j)
			{
				char* varj = environ[j];
				if (varj != 0)
				{
					char* tvari = vari;
					while (*tvari == *varj && *tvari != 0 && *tvari != '=')
					{
						++tvari;
						++varj;
					}
					if (*tvari == '=' && *varj == '=')
					{
						// Found duplicate, clear it with a null pointer.
						environ[j] = 0;
					}
				}
			}
		}
	}
	// Remove all null variables.
	int new_num_env_args = 0;
	for (int i = 0; i < num_env_args; ++i)
	{
		if (environ[i] != 0)
		{
			environ[new_num_env_args++] = environ[i];
		}	
	}
	environ[new_num_env_args++] = 0;

	// Count command line args
	int cmd_line_chars = 0;
	int num_cmd_args = extract_cmd_args(prg_cmd_line, argv_arg, &cmd_line_chars, 0, 0);

	_atari_argv = (const char**)environ + new_num_env_args;
	char* cmd_line_out = (char*)(_atari_argv + num_cmd_args + 1); 
	// Collect all command line args.
	_atari_argc = extract_cmd_args(prg_cmd_line, argv_arg, &cmd_line_chars, _atari_argv, cmd_line_out);
	_atari_argv[_atari_argc] = 0;
}

int estimate_env_and_args_memory(void)
{
	/*
		Stack and heap are not properly set up when this function is called.
		NO memory allocations or large stack usage allowed!
	*/
	const char* argv_arg = 0;
	const char* prg_cmd_line = _BasePage->p_cmdlin;
	const char* prg_env = _BasePage->p_env;
	const char* global_env = _atari_4be_at_prg_start;

	int num_env_args = extract_env_vars(prg_env, 0, &argv_arg);
	num_env_args += extract_env_vars(global_env, 0, 0);
	int cmd_line_chars = 0;
	int num_cmd_args = extract_cmd_args(prg_cmd_line, argv_arg, &cmd_line_chars, 0, 0);

	int bytes_to_reserve = (num_env_args + 1) * 4;
	bytes_to_reserve += (num_cmd_args + 1) * 4;
	bytes_to_reserve += cmd_line_chars;

	// This is the number of bytes of heap space that will be reserved before
	// stack and heap is initialized. 
	return bytes_to_reserve;
}