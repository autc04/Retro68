set(CMAKE_C_FLAGS "-Wno-multichar")
set(CMAKE_EXE_LINKER_FLAGS "-Wl,-gc-sections")

add_application(Launcher
    FILES Launcher.c CONSOLE)
