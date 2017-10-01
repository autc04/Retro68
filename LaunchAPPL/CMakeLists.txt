find_package(Boost COMPONENTS filesystem program_options)

add_executable(LaunchAPPL LaunchAPPL.cc)
target_include_directories(LaunchAPPL PRIVATE ${CMAKE_INSTALL_PREFIX}/include ${Boost_INCLUDE_DIR})
target_link_libraries(LaunchAPPL ResourceFiles ${Boost_LIBRARIES})

install(TARGETS LaunchAPPL RUNTIME DESTINATION bin)
