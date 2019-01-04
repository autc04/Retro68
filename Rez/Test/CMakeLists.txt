find_package(Boost COMPONENTS unit_test_framework)
add_executable(RezUnitTests UnitTests.cc)
target_link_libraries(RezUnitTests RezLib ${Boost_LIBRARIES})
target_include_directories(RezUnitTests PRIVATE ${Boost_INCLUDE_DIR})
