add_library(LaunchAPPLCommon
    Stream.h
    Stream.cc
    ReliableStream.h
    ReliableStream.cc
    CRC32.h
    UnreliableStream.h
)
target_include_directories(LaunchAPPLCommon PUBLIC .)

add_executable(TestLaunchAPPLCommon Test.cc)
target_link_libraries(TestLaunchAPPLCommon LaunchAPPLCommon)

if(CMAKE_SYSTEM_NAME MATCHES Retro)
    target_compile_options(LaunchAPPLCommon PRIVATE -ffunction-sections  -Os)
endif()
