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
	set(rsrc_files)
	set(rez_files)
	foreach(f ${ARGS_FILES})
		if(${f} MATCHES "\\.r$")
			add_custom_command(
				OUTPUT ${f}.rsrc.bin
				COMMAND ${REZ} ${CMAKE_CURRENT_SOURCE_DIR}/${f} -I ${REZ_INCLUDE_PATH} -o ${f}.rsrc.bin
				DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${f})
			list(APPEND rsrc_files "${CMAKE_CURRENT_BINARY_DIR}/${f}.rsrc.bin")
			list(APPEND rez_files "${f}")
		elseif(${f} MATCHES "\\.rsrc$")
			list(APPEND rsrc_files "${f}")
		elseif(${f} MATCHES "\\.rsrc.bin$")
			list(APPEND rsrc_files "${f}")
		else()
			list(APPEND files "${CMAKE_CURRENT_SOURCE_DIR}/${f}")
		endif()
	endforeach()

	add_executable(${name} ${files} ${rez_files})

	if(${ARGS_DEBUGBREAK})
		list(APPEND ARGS_MAKEAPPL_ARGS -b)
	endif()
	if(${ARGS_CONSOLE})
		target_link_libraries(${name} RetroConsole)
		
			# RetroConsole library uses C++:
		set_target_properties(${name} PROPERTIES LINKER_LANGUAGE CXX)
	endif()

	foreach(f ${rsrc_files})
		list(APPEND ARGS_MAKEAPPL_ARGS --copy "${f}")
	endforeach()



	if(TARGET libretro)
		set_target_properties(${name} PROPERTIES LINK_DEPENDS libretro)
	endif(TARGET libretro)

	set_target_properties(${name} PROPERTIES OUTPUT_NAME ${name}.flt)

	add_custom_command(
		OUTPUT ${name}.bin ${name}.APPL ${name}.dsk
		COMMAND ${MAKE_APPL} ${ARGS_MAKEAPPL_ARGS} -c "${name}.flt" -o "${name}"
		DEPENDS ${name} ${rsrc_files})
	add_custom_target(${name}_APPL ALL DEPENDS ${name}.bin)
endfunction()

cmake_policy(POP)
