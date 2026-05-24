find_package(Boost CONFIG COMPONENTS unit_test_framework REQUIRED)
add_executable(RezUnitTests UnitTests.cc)
target_link_libraries(RezUnitTests RezLib Boost::unit_test_framework)
add_test(NAME RezUnitTests COMMAND RezUnitTests)
