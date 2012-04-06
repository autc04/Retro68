cmake_minimum_required(VERSION 2.8)
project(Retro)

if(CMAKE_SYSTEM_NAME MATCHES Retro68)
add_subdirectory(libretro)
add_subdirectory(App2)
else()
add_subdirectory(MakeAPPL)
endif()