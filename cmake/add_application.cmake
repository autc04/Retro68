include(CMakeParseArguments)

cmake_policy(PUSH)
cmake_policy(SET CMP0012 NEW)

function(add_application name)

    set(options DEBUGBREAK CONSOLE)
    set(oneValueArgs TYPE CREATOR)
    set(multiValueArgs FILES MAKEAPPL_ARGS)

    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    list(APPEND ARGS_FILES ${ARGS_UNPARSED_ARGUMENTS})

    set(REZ_FLAGS)
    if(CMAKE_SYSTEM_NAME MATCHES RetroPPC OR CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
        if(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
            set(REZ_FLAGS -DTARGET_API_MAC_CARBON=1)
        endif()
    endif()
    
    set(files)
    set(rsrc_files)
    set(rez_files)
    foreach(f ${ARGS_FILES})
        if(${f} MATCHES "\\.r$")
            add_custom_command(
                OUTPUT ${f}.rsrc.bin
                COMMAND ${REZ} ${REZ_FLAGS} ${CMAKE_CURRENT_SOURCE_DIR}/${f} -I ${REZ_INCLUDE_PATH} -o ${f}.rsrc.bin
                DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${f})
            list(APPEND rsrc_files "${CMAKE_CURRENT_BINARY_DIR}/${f}.rsrc.bin")
            list(APPEND rez_files "${f}")
        elseif(${f} MATCHES "\\.rsrc$")
            get_filename_component(abspath "${f}" ABSOLUTE)
            list(APPEND rsrc_files "${abspath}")
        elseif(${f} MATCHES "\\.rsrc.bin$")
            get_filename_component(abspath "${f}" ABSOLUTE)
            list(APPEND rsrc_files "${abspath}")
        else()
            get_filename_component(abspath "${f}" ABSOLUTE)
            list(APPEND files "${abspath}")
        endif()
    endforeach()

    add_executable(${name} ${files} ${rez_files})

    if(${ARGS_DEBUGBREAK})
        target_link_options(${name} PRIVATE "LINKER:--defsym=__break_on_entry=1")
    endif()
    if(${ARGS_CONSOLE})
        if(TARGET RetroConsole OR NOT (CMAKE_SYSTEM_NAME MATCHES RetroCarbon))    
            target_link_libraries(${name} RetroConsole)
        else()
            target_link_libraries(${name} RetroConsoleCarbon)
        endif()
        
            # RetroConsole library uses C++:
        set_target_properties(${name} PROPERTIES LINKER_LANGUAGE CXX)
    endif()

    foreach(f ${rsrc_files})
            # DO NOT add --copy here.
            # The files in rsrc_files are guaranteed to be .rsrc or .rsrc.bin, so they
            # will be recognized by Rez.
            # Currently, the --copy flag has the side effect that Rez processes all --copy inputs
            # before other inputs, so this messes up the overriding mechanics, leading to the wrong SIZE resource
            # being included. (duplicate resources shouldn't be replaced silently, and overriding should be explicit...)
        list(APPEND ARGS_MAKEAPPL_ARGS "${f}")
    endforeach()

    if(NOT ARGS_TYPE)
        set(ARGS_TYPE "APPL")
    endif()
    if(NOT ARGS_CREATOR)
        set(ARGS_CREATOR "????")
    endif()


    if(TARGET retrocrt)
        add_dependencies(${name} retrocrt)
    endif(TARGET retrocrt)

    if(CMAKE_SYSTEM_NAME MATCHES Retro68)

        set_target_properties(${name} PROPERTIES OUTPUT_NAME ${name}.code.bin)

        add_custom_command(
            OUTPUT ${name}.bin ${name}.APPL ${name}.dsk ${name}.ad "%${name}.ad"
            COMMAND ${REZ} ${REZ_FLAGS}
                    ${REZ_TEMPLATES_PATH}/Retro68APPL.r
                    -I${REZ_INCLUDE_PATH}
                    --copy "${name}.code.bin"
                    -o "${name}.bin"
                    -t "${ARGS_TYPE}" -c "${ARGS_CREATOR}"
                    --cc "${name}.dsk" --cc "${name}.APPL" --cc "%${name}.ad"
                    ${ARGS_MAKEAPPL_ARGS}
            DEPENDS ${name} ${rsrc_files})
        add_custom_target(${name}_APPL ALL DEPENDS ${name}.bin)

    elseif(CMAKE_SYSTEM_NAME MATCHES RetroPPC OR CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
        if(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
            set(REZ_TEMPLATE "${REZ_TEMPLATES_PATH}/RetroCarbonAPPL.r")
        else()
            set(REZ_TEMPLATE "${REZ_TEMPLATES_PATH}/RetroPPCAPPL.r")
        endif()
        
        set_target_properties(${name} PROPERTIES OUTPUT_NAME ${name}.xcoff)
        add_custom_command(
            OUTPUT ${name}.pef
            COMMAND ${MAKE_PEF} "${name}.xcoff" -o "${name}.pef"
            DEPENDS ${name})

        add_custom_command(
            OUTPUT ${name}.bin ${name}.APPL ${name}.dsk ${name}.ad "%${name}.ad"
            COMMAND ${REZ} 
                    ${REZ_FLAGS}
                    ${REZ_TEMPLATE}
                    -I${REZ_INCLUDE_PATH}
                    -DCFRAG_NAME="\\"${name}\\""
                    -o "${name}.bin" --cc "${name}.dsk" --cc "${name}.APPL"
                    --cc "%${name}.ad"
                    -t "${ARGS_TYPE}" -c "${ARGS_CREATOR}"
                    --data ${name}.pef
                    ${ARGS_MAKEAPPL_ARGS}
            DEPENDS ${name}.pef ${rsrc_files})
        add_custom_target(${name}_APPL ALL DEPENDS ${name}.bin)
    endif()

endfunction()

cmake_policy(POP)
