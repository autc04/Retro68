cmake_minimum_required(VERSION 3.3)


find_program(LAUNCH_APPL LaunchAPPL PATH "${CMAKE_INSTALL_PREFIX}/../bin/")
execute_process(COMMAND ${LAUNCH_APPL} --list-emulators
	OUTPUT_VARIABLE EMULATOR_LIST)
separate_arguments(EMULATOR_LIST)

if(CMAKE_SYSTEM_NAME MATCHES "RetroCarbon")
	if("carbon" IN_LIST EMULATOR_LIST)
		set(RETRO68_LAUNCH_METHOD carbon CACHE String "How to launch Mac applications (for automated testing)")
	else()
		set(RETRO68_LAUNCH_METHOD NONE CACHE String "How to launch Mac applications (for automated testing)")
	endif()
else()
	if("classic" IN_LIST EMULATOR_LIST)
		set(RETRO68_LAUNCH_METHOD classic CACHE String "How to launch Mac applications (for automated testing)")
	else()
		set(RETRO68_LAUNCH_METHOD NONE CACHE String "How to launch Mac applications (for automated testing)")
	endif()
endif()
set(RETRO68_TEST_CONFIG "--timeout=10" CACHE String "Options to pass to LaunchAPPL when running tests")

if(RETRO68_LAUNCH_METHOD MATCHES "NONE")
else() # extends to end of file

enable_testing()



function(test FILE)
	get_filename_component(NAME ${FILE} NAME_WE)
	add_application(${NAME} ${FILE} Test.h Test.c)
	add_test(NAME ${NAME} COMMAND ${LAUNCH_APPL}
		-e ${RETRO68_LAUNCH_METHOD} ${RETRO68_TEST_CONFIG} ${ARGN} ${NAME}.bin)
endfunction()

if(CMAKE_SYSTEM_NAME MATCHES "Retro68")
	test(ReallyEmpty.c)
	set_target_properties(ReallyEmpty PROPERTIES LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-single")
endif()

test(Empty.c)

test(File.c)
set_tests_properties(File PROPERTIES PASS_REGULAR_EXPRESSION "OK")

test(Timeout.c)
set_tests_properties(Timeout PROPERTIES PASS_REGULAR_EXPRESSION "One")

test(Log.c)
set_tests_properties(Log PROPERTIES PASS_REGULAR_EXPRESSION "One\nTwo\nThree")

test(ZeroInitialized.c)
set_tests_properties(Log PROPERTIES PASS_REGULAR_EXPRESSION "One\nTwo\nThree")


test(Init.cc)
set_tests_properties(Init PROPERTIES PASS_REGULAR_EXPRESSION "constructor\nmain\ndestructor")

endif()	# RETRO68_LAUNCH_METHOD
