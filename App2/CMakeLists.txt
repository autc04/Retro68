set(CMAKE_CXX_FLAGS "-std=c++11")
add_executable(Test
   test.cc
   Console.cc
   Console.h
   MacUtils.h)
add_custom_command(
   OUTPUT Test.dsk
   COMMAND ${MAKE_APPL} -c Test
   DEPENDS Test)
add_custom_target(TestAPPL ALL DEPENDS Test.dsk)
