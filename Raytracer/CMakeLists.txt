cmake_minimum_required(VERSION 2.8)

if(NOT APPLE)
set(CMAKE_CXX_FLAGS "-std=c++11 -fno-threadsafe-statics -g") #  -fomit-frame-pointer -g -mcpu=68040
endif()

include_directories(../App2)
add_executable(Raytracer MACOSX_BUNDLE
   raytracer.cc
   )
add_executable(Raytracer2 MACOSX_BUNDLE
	raytracer2.cc
	fixed.h
	fixed.cc
   )


if(APPLE)
target_link_libraries(Raytracer "-framework Carbon")
target_link_libraries(Raytracer2 "-framework Carbon")
else()
target_link_libraries(Raytracer retrocrt)
add_custom_command(
   OUTPUT Raytracer.bin
   COMMAND ${MAKE_APPL} -c Raytracer -o Raytracer
   DEPENDS Raytracer)
add_custom_target(RaytracerAPPL ALL DEPENDS Raytracer.bin)

target_link_libraries(Raytracer2 retrocrt)
add_custom_command(
   OUTPUT Raytracer2.bin
   COMMAND ${MAKE_APPL} -c Raytracer2 -o Raytracer2
   DEPENDS Raytracer2)
add_custom_target(Raytracer2APPL ALL DEPENDS Raytracer2.bin)
endif()

