set(HAVE_OPENTRANSPORT NO)
if(CMAKE_SYSTEM_NAME MATCHES RetroPPC)
    find_library(OPENTRANSPORT_LIBRARY NAMES libOpenTransportLib.a)
    if(OPENTRANSPORT_LIBRARY)
        set(HAVE_OPENTRANSPORT YES)
    endif()
elseif(CMAKE_SYSTEM_NAME MATCHES Retro68)
    find_library(OPENTRANSPORT_LIBRARY NAMES libOpenTransport.a)
    if(OPENTRANSPORT_LIBRARY)
        set(HAVE_OPENTRANSPORT YES)
    endif()
elseif(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
    set(HAVE_OPENTRANSPORT YES)
endif()

set(CONNECTION_SOURCES
        SharedFileStream.h
        SharedFileStream.cc
        SharedFileProvider.h
        SharedFileProvider.cc
    )

if(CMAKE_SYSTEM_NAME MATCHES RetroCarbon)
else()
    list(APPEND CONNECTION_SOURCES
            SerialConnectionProvider.h
            SerialConnectionProvider.cc
            MacSerialStream.h
            MacSerialStream.cc

            MacTCPStream.h
            MacTCPStream.cc
            TCPConnectionProvider.h
            TCPConnectionProvider.cc
        )
endif()        

option(LAUNCHAPPLSERVER_DEBUG_CONSOLE "Add a debug console to LaunchAPPLServer" FALSE)

set(MAYBE_CONSOLE)
if(LAUNCHAPPLSERVER_DEBUG_CONSOLE)
    set(MAYBE_CONSOLE "CONSOLE")
endif()

if(HAVE_OPENTRANSPORT)
    list(APPEND CONNECTION_SOURCES
            OpenTptStream.h
            OpenTptStream.cc
            OpenTptConnectionProvider.h
            OpenTptConnectionProvider.cc
        )
endif()

add_application(LaunchAPPLServer 
    TYPE "APPL"
    CREATOR "R68L"
    ${MAYBE_CONSOLE}

    LaunchAPPLServer.r
    LauncherIcon.r
    LaunchAPPLServer.cc
    AppLauncher.h
    AppLauncher.cc
    ToolLauncher.cc
    Window.h
    StatusDisplay.h
    StatusDisplay.cc
    AboutBox.h
    AboutBox.cc
    ConnectionProvider.h
    CarbonFileCompat.h
    Preferences.h
    Preferences.cc

    ${CONNECTION_SOURCES}
)
if(LAUNCHAPPLSERVER_DEBUG_CONSOLE)
    target_compile_definitions(LaunchAPPLServer PRIVATE DEBUG_CONSOLE)
endif()
if(HAVE_OPENTRANSPORT)
    target_compile_definitions(LaunchAPPLServer PRIVATE HAVE_OPENTRANSPORT)
endif()

target_link_libraries(LaunchAPPLServer LaunchAPPLCommon)
set_target_properties(LaunchAPPLServer PROPERTIES
        CXX_STANDARD 17
    )
target_compile_options(LaunchAPPLServer PRIVATE -ffunction-sections -Os)
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    set_target_properties(LaunchAPPLServer PROPERTIES
            LINK_FLAGS "-Wl,-gc-sections -Wl,--mac-segments -Wl,${CMAKE_CURRENT_SOURCE_DIR}/LaunchAPPLServer.segmap"
        )
else()
    set_target_properties(LaunchAPPLServer PROPERTIES
            LINK_FLAGS "-Wl,-gc-sections"
        )
endif()

if(HAVE_OPENTRANSPORT)
    if(CMAKE_SYSTEM_NAME MATCHES RetroPPC)
        target_link_libraries(LaunchAPPLServer -lOpenTransportAppPPC -lOpenTransportLib -lOpenTptInternetLib)
    endif()
    if(CMAKE_SYSTEM_NAME MATCHES Retro68)
        target_link_libraries(LaunchAPPLServer -lOpenTransport -lOpenTransportApp -lOpenTptInet)
    endif()
endif()

if(CMAKE_SYSTEM_NAME MATCHES RetroPPC)
    target_link_libraries(LaunchAPPLServer -lNavigationLib)
endif()
if(CMAKE_SYSTEM_NAME MATCHES Retro68)
    target_link_libraries(LaunchAPPLServer -lNavigation.far)
endif()

if(FALSE)
add_application(tcptest 
    CONSOLE


    tcptest.cc
)

target_link_libraries(tcptest LaunchAPPLCommon)
set_target_properties(tcptest PROPERTIES
        CXX_STANDARD 17
        LINK_FLAGS "-Wl,-gc-sections"
    )

    endif()
