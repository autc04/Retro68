file(GLOB ELF_FILES src/*.c src/*.h include/*.h)
add_library(ELF ${ELF_FILES}
	)
target_include_directories(ELF PRIVATE src)
target_include_directories(ELF PUBLIC include)
target_link_libraries(ELF -lz)
target_compile_definitions(ELF PRIVATE HAVE_CONFIG_H)
