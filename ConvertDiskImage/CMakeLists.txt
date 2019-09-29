add_executable(ConvertDiskImage ConvertDiskImage.cc)
target_link_libraries(ConvertDiskImage ResourceFiles)

install(TARGETS ConvertDiskImage RUNTIME DESTINATION bin)
