find_program(LAUNCH_APPL LaunchAPPL PATH "${CMAKE_INSTALL_PREFIX}/../bin/")
execute_process(COMMAND ${LAUNCH_APPL} --list-emulators
    OUTPUT_VARIABLE EMULATOR_LIST)
string(REPLACE "\n" ";" EMULATOR_LIST "${EMULATOR_LIST}")

if(CMAKE_SYSTEM_NAME MATCHES "RetroCarbon")
    if("carbon" IN_LIST EMULATOR_LIST)
        set(RETRO68_LAUNCH_METHOD carbon CACHE STRING "How to launch Mac applications (for automated testing)")
    else()
        set(RETRO68_LAUNCH_METHOD NONE CACHE STRING "How to launch Mac applications (for automated testing)")
    endif()
else()
    if("classic" IN_LIST EMULATOR_LIST)
        set(RETRO68_LAUNCH_METHOD classic CACHE STRING "How to launch Mac applications (for automated testing)")
    else()
        set(RETRO68_LAUNCH_METHOD NONE CACHE STRING "How to launch Mac applications (for automated testing)")
    endif()
endif()

if(CMAKE_SYSTEM_NAME MATCHES "RetroCarbon")
    set(TESTCASE_PREFIX "Carbon.")
elseif(CMAKE_SYSTEM_NAME MATCHES "Retro68")
    set(TESTCASE_PREFIX "M68K.")
elseif(CMAKE_SYSTEM_NAME MATCHES "RetroPPC")
    set(TESTCASE_PREFIX "PPC.")
else()
    set(TESTCASE_PREFIX)
endif()

set(RETRO68_TEST_CONFIG "--timeout=10" CACHE STRING "Options to pass to LaunchAPPL when running tests")

set(LAUNCH_METHOD_FLAG)
if(RETRO68_LAUNCH_METHOD MATCHES "NONE")
else()
set(LAUNCH_METHOD_FLAG "-e${RETRO68_LAUNCH_METHOD}")
endif()    # RETRO68_LAUNCH_METHOD

enable_testing()



function(test FILE)
    get_filename_component(NAME ${FILE} NAME_WE)
    add_application(${NAME} ${FILE} Test.h Test.c)
    target_include_directories(${NAME} PRIVATE .)
    add_test(NAME ${TESTCASE_PREFIX}${NAME} COMMAND ${LAUNCH_APPL}
        ${LAUNCH_METHOD_FLAG} ${RETRO68_TEST_CONFIG} ${NAME}.bin)
    if(ARGN)
        set_tests_properties(${TESTCASE_PREFIX}${NAME} ${ARGN})
    endif()
endfunction()

if(CMAKE_SYSTEM_NAME MATCHES "Retro68")
    test(ReallyEmpty.c)
    set_target_properties(ReallyEmpty PROPERTIES LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-single")
endif()

test(Empty.c)

test(File.c PROPERTIES PASS_REGULAR_EXPRESSION "OK")

#test(Timeout.c PROPERTIES PASS_REGULAR_EXPRESSION "One" DISABLED TRUE)

test(Log.c PROPERTIES PASS_REGULAR_EXPRESSION "One\nTwo\nThree")

test(ZeroInitialized.c)

test(Init.cc PROPERTIES PASS_REGULAR_EXPRESSION "constructor\nmain\ndestructor")

test(StdIO.c PROPERTIES PASS_REGULAR_EXPRESSION "OK")

if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    add_application(Segments Segment1.c Segment2.c Segments.segmap Test.h Test.c)
    set_target_properties(Segments PROPERTIES
        LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-segments -Wl,${CMAKE_CURRENT_SOURCE_DIR}/Segments.segmap")
    add_test(NAME ${TESTCASE_PREFIX}Segments COMMAND ${LAUNCH_APPL}
        ${LAUNCH_METHOD_FLAG} ${RETRO68_TEST_CONFIG} Segments.bin)


    test(PCRel32.c PROPERTIES PASS_REGULAR_EXPRESSION "OK")
    target_compile_options(PCRel32 PRIVATE -march=68020)
endif()

test(Exceptions.cc PROPERTIES PASS_REGULAR_EXPRESSION "OK")

configure_file(PascalTrap.c PascalTrapCPP.cc)
test(PascalTrap.c PROPERTIES PASS_REGULAR_EXPRESSION "OK")
test(${CMAKE_CURRENT_BINARY_DIR}/PascalTrapCPP.cc PROPERTIES PASS_REGULAR_EXPRESSION "OK")
