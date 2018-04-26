add_application(LaunchAPPLServer 
    LaunchAPPLServer.r
    LaunchAPPLServer.cc
    MacSerialStream.h
    MacSerialStream.cc)

target_link_libraries(LaunchAPPLServer LaunchAPPLCommon)
set_target_properties(LaunchAPPLServer PROPERTIES
        CXX_STANDARD 17
        LINK_FLAGS "-Wl,-gc-sections"
    )
