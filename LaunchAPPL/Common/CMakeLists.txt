add_library(LaunchAPPLCommon
    Stream.h
    Stream.cc
    ReliableStream.h
    ReliableStream.cc
    CRC32.h
)
target_include_directories(LaunchAPPLCommon PUBLIC .)

add_executable(TestLaunchAPPLCommon Test.cc)
target_link_libraries(TestLaunchAPPLCommon LaunchAPPLCommon)
