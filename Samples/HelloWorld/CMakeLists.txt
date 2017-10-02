# HOW TO BUILD USING CMAKE as a standalone project:
# mkdir build
# cd build
# cmake .. -DCMAKE_TOOLCHAIN_FILE=path/to/Retro68-build/toolchain/cmake/retro68.toolchain.cmake
# make

cmake_minimum_required(VERSION 2.8)

add_application(HelloWorld
	hello.c
	CONSOLE
   )

    # make the result as small as possible
	# by removing unused code (gc-sections)
	# and by removing macsbug function names on 68K
	# (don't do this when debugging...)
set_target_properties(HelloWorld PROPERTIES COMPILE_OPTIONS -ffunction-sections)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
	set_target_properties(HelloWorld PROPERTIES LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-strip-macsbug")

else()
	set_target_properties(HelloWorld PROPERTIES LINK_FLAGS "-Wl,-gc-sections")
endif()
