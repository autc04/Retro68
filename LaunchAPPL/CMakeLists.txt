add_subdirectory(Common)

if(CMAKE_SYSTEM_NAME MATCHES Retro.*)
    add_subdirectory(Server)
else()
    add_subdirectory(Client)
endif()
