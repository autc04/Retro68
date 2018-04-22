add_application(LaunchAPPLServer CONSOLE
    main.cc
    MacSerialStream.h
    MacSerialStream.cc)

target_link_libraries(LaunchAPPLServer LaunchAPPLCommon)
