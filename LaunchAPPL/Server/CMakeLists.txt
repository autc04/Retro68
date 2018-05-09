add_application(LaunchAPPLServer 
    TYPE "APPL"
    CREATOR "R68L"


    LaunchAPPLServer.r
    LauncherIcon.r
    LaunchAPPLServer.cc
    MacSerialStream.h
    MacSerialStream.cc
    AppLauncher.h
    AppLauncher.cc
    ToolLauncher.cc
    StatusDisplay.h
    StatusDisplay.cc
    ConnectionProvider.h
    SerialConnectionProvider.h
    SerialConnectionProvider.cc

    MacTCPStream.h
    MacTCPStream.cc
    TCPConnectionProvider.h
    TCPConnectionProvider.cc
)

target_link_libraries(LaunchAPPLServer LaunchAPPLCommon)
set_target_properties(LaunchAPPLServer PROPERTIES
        CXX_STANDARD 17
    )
target_compile_options(LaunchAPPLServer PRIVATE -ffunction-sections -fno-exceptions -Os)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    set_target_properties(LaunchAPPLServer PROPERTIES
            LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-segments -Wl,${CMAKE_CURRENT_SOURCE_DIR}/LaunchAPPLServer.segmap"
        )
else()
    set_target_properties(LaunchAPPLServer PROPERTIES
            LINK_FLAGS "-Wl,-gc-sections"
        )
endif()
