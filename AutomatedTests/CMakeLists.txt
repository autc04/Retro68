enable_testing()

set(RETRO68_TEST_CONFIG "-eminivmac" "-t4" "--minivmac-dir=/home/wolfgang/Emulators"
	            "--system-image=/home/wolfgang/Emulators/baresystem.dsk"
				"--autoquit-image=/home/wolfgang/Emulators/vmac extras/autoquit-1.1.1.dsk")


add_application(ReallyEmpty ReallyEmpty.c)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
	set_target_properties(ReallyEmpty PROPERTIES LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-single")
endif()
add_test(NAME ReallyEmpty COMMAND LaunchAPPL ${RETRO68_TEST_CONFIG} ReallyEmpty.bin)

add_application(Empty Empty.c)
add_test(NAME Empty COMMAND LaunchAPPL  ${RETRO68_TEST_CONFIG} Empty.bin)

add_application(File File.c)
add_test(NAME File
	COMMAND LaunchAPPL  ${RETRO68_TEST_CONFIG} File.bin
	)
set_tests_properties(File PROPERTIES PASS_REGULAR_EXPRESSION "OK")

 add_application(Log Log.c)
 add_test(NAME Log
	 COMMAND LaunchAPPL ${RETRO68_TEST_CONFIG} Log.bin
	 )
 set_tests_properties(Log PROPERTIES PASS_REGULAR_EXPRESSION "One\nTwo\nThree")
