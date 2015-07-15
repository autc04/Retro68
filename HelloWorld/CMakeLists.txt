# cmake \
#	-DCMAKE_TOOLCHAIN_FILE=$SRC/retro68.toolchain.cmake \
#	-DRETRO68_ROOT=$PREFIX \
#	-DCMAKE_BUILD_TYPE=Release

cmake_minimum_required(VERSION 2.8)

add_application(HelloWorld
	hello.c
	CONSOLE
   )
