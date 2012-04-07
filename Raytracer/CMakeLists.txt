cmake_minimum_required(VERSION 2.8)

if(NOT APPLE)
set(CMAKE_CXX_FLAGS "-std=c++11")
endif()

include_directories(../App2)
add_executable(Raytracer MACOSX_BUNDLE
   raytracer.cc
   )

if(APPLE)
target_link_libraries(Raytracer "-framework Carbon")
else()
target_link_libraries(Raytracer retrocrt)
add_custom_command(
   OUTPUT Raytracer.bin
   COMMAND ${MAKE_APPL} -c Raytracer -o Raytracer
   DEPENDS Raytracer)
add_custom_target(RaytracerAPPL ALL DEPENDS Raytracer.bin)
endif()

