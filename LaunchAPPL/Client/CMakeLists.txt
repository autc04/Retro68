find_package(Boost COMPONENTS filesystem program_options)
find_path(HFS_INCLUDE_DIR NAMES hfs.h)
find_library(HFS_LIBRARY NAMES hfs)

set(LAUNCHMETHODS
    Executor.h Executor.cc
    MiniVMac.h MiniVMac.cc
    SSH.h SSH.cc
    StreamBasedLauncher.h StreamBasedLauncher.cc
    Serial.h Serial.cc
    TCP.h TCP.cc
    SharedFile.h SharedFile.cc
)

if(APPLE)
    LIST(APPEND LAUNCHMETHODS
        Classic.h Classic.cc
        )
    LIST(APPEND LAUNCHMETHODS
        Carbon.h Carbon.cc)
endif()
add_definitions(-DRETRO68_PREFIX="${CMAKE_INSTALL_PREFIX}")

add_executable(LaunchAPPL
    LaunchAPPL.cc
    MakeExecutable.cc

    LaunchMethod.h LaunchMethod.cc
    Launcher.h Launcher.cc

    Utilities.h Utilities.cc

    ${LAUNCHMETHODS})

target_include_directories(LaunchAPPL PRIVATE ${CMAKE_INSTALL_PREFIX}/include ${Boost_INCLUDE_DIR} ${HFS_INCLUDE_DIR})
target_link_libraries(LaunchAPPL ResourceFiles LaunchAPPLCommon ${Boost_LIBRARIES} ${HFS_LIBRARY})

if(APPLE)
    find_library(APPLICATIONSERVICES_FW ApplicationServices)
    target_link_libraries(LaunchAPPL ${APPLICATIONSERVICES_FW})    
endif()

install(TARGETS LaunchAPPL RUNTIME DESTINATION bin)
