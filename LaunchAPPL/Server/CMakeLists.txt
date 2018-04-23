add_application(LaunchAPPLServer 
    LaunchAPPLServer.r
    LaunchAPPLServer.cc
    MacSerialStream.h
    MacSerialStream.cc)

target_link_libraries(LaunchAPPLServer LaunchAPPLCommon)
set_target_properties(LaunchAPPLServer PROPERTIES LINK_FLAGS "-Wl,-gc-sections")
