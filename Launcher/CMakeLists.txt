set(CMAKE_C_FLAGS "-Wno-multichar")
add_executable(Launcher
    Launcher.c
    )

target_link_libraries(Launcher RetroConsole retrocrt)
add_custom_command(
    OUTPUT Launcher.bin
    COMMAND ${MAKE_APPL} -c Launcher -o Launcher
    DEPENDS Launcher)
add_custom_target(LauncherAPPL ALL DEPENDS Launcher.bin)
