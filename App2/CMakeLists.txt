cmake_minimum_required(VERSION 2.8)
set(CMAKE_CXX_FLAGS "-std=c++11") # -fomit-frame-pointer")
add_executable(Test
   test.cc
   Console.cc
   Console.h
   MacUtils.h
   )
#target_link_libraries(Test :retrocrt.o)

target_link_libraries(Test retrocrt)
add_custom_command(
   OUTPUT Test.dsk Test.bin
   COMMAND ${MAKE_APPL} -b -c Test
   DEPENDS Test)
add_custom_target(TestAPPL ALL DEPENDS Test.dsk)

set(UPLOAD_URL "" CACHE STRING "ftp url to upload to")
if(UPLOAD_URL)
add_custom_target(upload
		DEPENDS Test.bin
		COMMAND wput -u Test.bin ${UPLOAD_URL}
	)
endif()
