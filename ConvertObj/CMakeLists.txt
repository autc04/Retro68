find_package(Boost COMPONENTS filesystem system REQUIRED)

add_executable(ConvertObj ConvertObj.cc)
target_link_libraries(ConvertObj ResourceFiles ${Boost_LIBRARIES})
target_include_directories(ConvertObj PRIVATE ${Boost_INCLUDE_DIR})

install(TARGETS ConvertObj RUNTIME DESTINATION bin)
