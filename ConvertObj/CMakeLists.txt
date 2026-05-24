add_executable(ConvertObj ConvertObj.cc)
target_link_libraries(ConvertObj ResourceFiles)

install(TARGETS ConvertObj RUNTIME DESTINATION bin)

