find_package(Boost CONFIG COMPONENTS filesystem program_options REQUIRED)

# Retro68's own hfsutils, built with --enable-devlibs, is installed into the
# toolchain prefix. Prefer it over any libhfs found in system locations (e.g.
# the one shipped with cdrtools), which is incompatible and lacks the
# hfs_* symbols Retro68 needs. HINTS are searched before the default paths, so
# an hfsutils provided elsewhere (e.g. as a Nix buildInput) is still found.
find_path(HFS_INCLUDE_DIR NAMES hfs.h HINTS ${CMAKE_INSTALL_PREFIX}/include)
find_library(HFS_LIBRARY NAMES hfs HINTS ${CMAKE_INSTALL_PREFIX}/lib)

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

target_include_directories(LaunchAPPL PRIVATE ${CMAKE_INSTALL_PREFIX}/include ${HFS_INCLUDE_DIR})
target_link_libraries(LaunchAPPL ResourceFiles LaunchAPPLCommon Boost::filesystem Boost::program_options ${HFS_LIBRARY})

if(APPLE)
    find_library(APPLICATIONSERVICES_FW ApplicationServices)
    target_link_libraries(LaunchAPPL ${APPLICATIONSERVICES_FW})    
endif()

install(TARGETS LaunchAPPL RUNTIME DESTINATION bin)
