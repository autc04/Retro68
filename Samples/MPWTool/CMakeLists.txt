
# An MPW tool is an application with a special
# file type.
add_application(MPWTool
    TYPE "MPST"
    CREATOR "MPS "
    main.c
)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    # On 68K, the application must be single-segment.
    
    # The trap patches required for Retro68's multi-segment
    # support are incompatible with MPW.

    # As always, -gc-sections removes unused code.

    set_target_properties(MPWTool PROPERTIES
        LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-single")
else()
    set_target_properties(MPWTool PROPERTIES
        LINK_FLAGS "-Wl,-gc-sections")
endif()
