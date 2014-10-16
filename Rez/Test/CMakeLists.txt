set(CMAKE_CXX_FLAGS "--std=c++11 -Wall -Wno-multichar")
find_package(Boost COMPONENTS unit_test_framework)
add_executable(RezUnitTests UnitTests.cc)
target_link_libraries(RezUnitTests RezLib ${Boost_LIBRARIES})
