enable_testing()

add_application(ReallyEmpty ReallyEmpty.c)
add_test(NAME ReallyEmpty COMMAND LaunchAPPL -e ReallyEmpty.bin)

add_application(Empty Empty.c)
add_test(NAME Empty COMMAND LaunchAPPL -e Empty.bin)

add_application(File File.c)
add_test(NAME File
	COMMAND LaunchAPPL -e File.bin --logfile=out -t5
	)
set_tests_properties(File PROPERTIES PASS_REGULAR_EXPRESSION "OK")

add_application(Timeout Timeout.c)
add_test(NAME Timeout
	COMMAND sh -c "! LaunchAPPL -e Timeout.bin --logfile=out -t2"
	)
set_tests_properties(Timeout PROPERTIES PASS_REGULAR_EXPRESSION "One;Two"
	                         FAIL_REGULAR_EXPRESSION "Three")
