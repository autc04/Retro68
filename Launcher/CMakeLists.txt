cmake_minimum_required(VERSION 2.8)

set(CMAKE_C_FLAGS "-Wno-multichar")

add_application(Launcher
	FILES Launcher.c CONSOLE)
