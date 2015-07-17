add_executable(SystemExtension
	SystemExtension.c
	SystemExtension.r
	ShowInitIcon.c
	ShowInitIcon.h)

set_target_properties(SystemExtension PROPERTIES OUTPUT_NAME SystemExtension.flt)

add_custom_command(
	OUTPUT SystemExtension.dsk
	COMMAND ${REZ} ${CMAKE_CURRENT_SOURCE_DIR}/SystemExtension.r
					--copy ${CMAKE_CURRENT_SOURCE_DIR}/Icons.rsrc.bin
					-o SystemExtension.dsk
					-t INIT
	DEPENDS SystemExtension SystemExtension.r Icons.rsrc.bin)
add_custom_target(SystemExtension_INIT ALL DEPENDS SystemExtension.dsk)
