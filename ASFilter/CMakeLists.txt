cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "--std=c++0x")
find_package(Boost COMPONENTS regex)

add_executable(asfilter asfilter.cc)
target_link_libraries(asfilter ${Boost_LIBRARIES})

install(TARGETS asfilter RUNTIME DESTINATION bin)
