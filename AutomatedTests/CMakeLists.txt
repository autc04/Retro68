enable_testing()

set(RETRO68_TEST_CONFIG "-eminivmac" "-t4" "--minivmac-dir=/home/wolfgang/Emulators"
	            "--system-image=/home/wolfgang/Emulators/baresystem.dsk"
				"--autoquit-image=/home/wolfgang/Emulators/vmac extras/autoquit-1.1.1.dsk")

find_program(LAUNCH_APPL LaunchAPPL PATH "${CMAKE_INSTALL_PREFIX}/../bin/")

function(test name)
	add_application(${name} ${name}.c Test.h Test.c)
	add_test(NAME ${name} COMMAND ${LAUNCH_APPL} ${RETRO68_TEST_CONFIG} ${name}.bin)
endfunction()


test(ReallyEmpty)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
	set_target_properties(ReallyEmpty PROPERTIES LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-single")
endif()

test(Empty)

test(File)
set_tests_properties(File PROPERTIES PASS_REGULAR_EXPRESSION "OK")

test(Log)
set_tests_properties(Log PROPERTIES PASS_REGULAR_EXPRESSION "One\nTwo\nThree")
