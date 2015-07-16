include(CMakeParseArguments)

cmake_policy(PUSH)
cmake_policy(SET CMP0012 NEW)

function(add_application name)

	set(options DEBUGBREAK CONSOLE)
	set(oneValueArgs TYPE CREATOR)
	set(multiValueArgs FILES MAKEAPPL_ARGS)
	cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

	list(APPEND ARGS_FILES ${ARGS_UNPARSED_ARGUMENTS})

	set(files)
		foreach(f ${ARGS_FILES})
		list(APPEND files "${CMAKE_CURRENT_SOURCE_DIR}/${f}")
	endforeach()

	add_executable(${name} ${files})

	if(${ARGS_DEBUGBREAK})
		list(APPEND ARGS_MAKEAPPL_ARGS -b)
	endif()
	if(${ARGS_CONSOLE})
		target_link_libraries(${name} RetroConsole)
		
			# RetroConsole library uses C++:
		set_target_properties(${name} PROPERTIES LINKER_LANGUAGE CXX)
	endif()


	if(TARGET libretro)
		set_target_properties(${name} PROPERTIES LINK_DEPENDS libretro)
	endif(TARGET libretro)

	set_target_properties(${name} PROPERTIES OUTPUT_NAME ${name}.flt)

	add_custom_command(
		OUTPUT ${name}.bin ${name}.APPL ${name}.dsk
		COMMAND ${MAKE_APPL} ${ARGS_MAKEAPPL_ARGS} -c "${name}.flt" -o "${name}"
		DEPENDS ${name})
	add_custom_target(${name}_APPL ALL DEPENDS ${name}.bin)
endfunction()

cmake_policy(POP)