cmake_minimum_required(VERSION 2.8)

add_definitions(-std=c++0x)
add_executable(MakeAPPL main.cc)

install(TARGETS MakeAPPL RUNTIME DESTINATION bin)
