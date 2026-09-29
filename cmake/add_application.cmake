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

    set(rez_include_options ${REZ_INCLUDE_PATH})
    list(TRANSFORM rez_include_options PREPEND -I)

    foreach(f ${ARGS_FILES})
        get_filename_component(abspath "${f}" ABSOLUTE)
        if(${f} MATCHES "\\.r$")
            get_filename_component(rsrc_file "${f}" NAME)
            set(rsrc_file "${CMAKE_CURRENT_BINARY_DIR}/${rsrc_file}.rsrc.bin")
            add_custom_command(
                OUTPUT ${rsrc_file}
                COMMAND ${REZ} ${REZ_FLAGS} ${abspath} ${rez_include_options} -o ${rsrc_file}
                DEPENDS ${abspath})
            list(APPEND rsrc_files "${rsrc_file}")
            list(APPEND rez_files "${abspath}")
        elseif(${f} MATCHES "\\.rsrc$")
            list(APPEND rsrc_files "${abspath}")
        elseif(${f} MATCHES "\\.rsrc.bin$")
            list(APPEND rsrc_files "${abspath}")
        else()
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
                    ${rez_include_options}
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
                    ${rez_include_options}
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

# The linker script add_ndrv() uses unless given another. Set here, where
# the path is known both in the source tree and once installed.
if(NOT RETRO68_NDRV_LINKER_SCRIPT)
    set(RETRO68_NDRV_LINKER_SCRIPT "${CMAKE_CURRENT_LIST_DIR}/ndrv.lds")
endif()

# add_ndrv(<name> KIND AIM|SIM|GENERIC <source>...)
#
# Builds a PowerPC native driver: a PEF code fragment of type 'ndrv' that
# the Driver Loader loads from the Extensions folder, rather than an
# application. Makes <name>.bin (MacBinary) and <name>.dsk; the PEF is
# the data fork, and the resource fork holds the 'cfrg' Mac OS needs to
# find it. Copy the .bin to the Mac so that the resource fork survives.
#
# Every native driver exports TheDriverDescription; KIND names the driver
# family, which decides the other export:
#   GENERIC  DoDriverIO              (Device Manager: 'ndrv', 'disp', 'blok' ...)
#   AIM      ThePluginDispatchTable  (ATA Manager's ATA Interface Module)
#   SIM      LoadSIM                 (SCSI Manager 4.3's SCSI Interface Module)
#
# Options:
#   EXPORTS <file>         an export list, instead of KIND
#   LINKER_SCRIPT <file>   instead of Retro68's ndrv.lds
#   CFRAG_NAME <name>      the fragment's name; default <name>
#   TYPE, CREATOR          default 'ndrv', '????'
# .r, .rsrc and .rsrc.bin files among the sources go into the resource
# fork, as with add_application().
function(add_ndrv name)

    set(oneValueArgs KIND EXPORTS LINKER_SCRIPT CFRAG_NAME TYPE CREATOR)
    set(multiValueArgs FILES)

    cmake_parse_arguments(ARGS "" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    list(APPEND ARGS_FILES ${ARGS_UNPARSED_ARGUMENTS})

    if(NOT CMAKE_SYSTEM_NAME MATCHES RetroPPC)
        message(FATAL_ERROR "add_ndrv(${name}): native drivers need the classic PowerPC toolchain")
    endif()

    set(exports_GENERIC DoDriverIO)
    set(exports_AIM ThePluginDispatchTable)
    set(exports_SIM LoadSIM)
    if(ARGS_KIND AND ARGS_EXPORTS)
        message(FATAL_ERROR "add_ndrv(${name}): give KIND or EXPORTS, not both")
    elseif(ARGS_KIND)
        string(TOUPPER ${ARGS_KIND} kind)
        if(NOT DEFINED exports_${kind})
            message(FATAL_ERROR "add_ndrv(${name}): KIND is GENERIC, AIM or SIM, not ${ARGS_KIND}")
        endif()
            # configure_file rewrites the list only when it changes,
            # so that reconfiguring does not force a relink.
        set(exports "${CMAKE_CURRENT_BINARY_DIR}/${name}.exp")
        file(WRITE "${exports}.in" "TheDriverDescription\n${exports_${kind}}\n")
        configure_file("${exports}.in" "${exports}" COPYONLY)
    elseif(ARGS_EXPORTS)
        get_filename_component(exports "${ARGS_EXPORTS}" ABSOLUTE)
    else()
        message(FATAL_ERROR "add_ndrv(${name}): KIND or EXPORTS is required")
    endif()

    if(ARGS_LINKER_SCRIPT)
        get_filename_component(linker_script "${ARGS_LINKER_SCRIPT}" ABSOLUTE)
    else()
        set(linker_script "${RETRO68_NDRV_LINKER_SCRIPT}")
    endif()
    if(NOT ARGS_CFRAG_NAME)
        set(ARGS_CFRAG_NAME "${name}")
    endif()
    if(NOT ARGS_TYPE)
        set(ARGS_TYPE "ndrv")
    endif()
    if(NOT ARGS_CREATOR)
        set(ARGS_CREATOR "????")
    endif()

    set(files)
    set(rsrc_files)
    set(rez_files)

    set(rez_include_options ${REZ_INCLUDE_PATH})
    list(TRANSFORM rez_include_options PREPEND -I)

    foreach(f ${ARGS_FILES})
        get_filename_component(abspath "${f}" ABSOLUTE)
        if(${f} MATCHES "\\.r$")
            get_filename_component(rsrc_file "${f}" NAME)
            set(rsrc_file "${CMAKE_CURRENT_BINARY_DIR}/${rsrc_file}.rsrc.bin")
            add_custom_command(
                OUTPUT ${rsrc_file}
                COMMAND ${REZ} ${abspath} ${rez_include_options} -o ${rsrc_file}
                DEPENDS ${abspath})
            list(APPEND rsrc_files "${rsrc_file}")
            list(APPEND rez_files "${abspath}")
        elseif(${f} MATCHES "\\.rsrc$")
            list(APPEND rsrc_files "${abspath}")
        elseif(${f} MATCHES "\\.rsrc.bin$")
            list(APPEND rsrc_files "${abspath}")
        else()
            list(APPEND files "${abspath}")
        endif()
    endforeach()

    add_executable(${name} ${files} ${rez_files})

    if(TARGET retrocrt)
        add_dependencies(${name} retrocrt)
    endif(TARGET retrocrt)

        # A driver is only ever entered through its exports, so they are
        # the roots for discarding unused code and data.
    target_compile_options(${name} PRIVATE -ffunction-sections -fdata-sections)
    target_link_options(${name} PRIVATE
        -T "${linker_script}"
        "LINKER:-bE:${exports}"
        "LINKER:--gc-sections"
        "LINKER:--gc-keep-exported")
    set_target_properties(${name} PROPERTIES
        OUTPUT_NAME ${name}.xcoff
        LINK_DEPENDS "${linker_script};${exports}")

    add_custom_command(
        OUTPUT ${name}.pef
        COMMAND ${MAKE_PEF} "${name}.xcoff" -o "${name}.pef"
        DEPENDS ${name})

    add_custom_command(
        OUTPUT ${name}.bin ${name}.dsk ${name}.ad "%${name}.ad"
        COMMAND ${REZ}
                ${REZ_TEMPLATES_PATH}/RetroPPCndrv.r
                ${rez_include_options}
                -DCFRAG_NAME="\\"${ARGS_CFRAG_NAME}\\""
                -o "${name}.bin" --cc "${name}.dsk" --cc "%${name}.ad"
                -t "${ARGS_TYPE}" -c "${ARGS_CREATOR}"
                --data ${name}.pef
                ${rsrc_files}
        DEPENDS ${name}.pef ${rsrc_files})
    add_custom_target(${name}_NDRV ALL DEPENDS ${name}.bin)

endfunction()

cmake_policy(POP)
