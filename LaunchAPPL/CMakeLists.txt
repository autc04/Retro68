find_package(Boost COMPONENTS filesystem program_options)

add_executable(LaunchAPPL
	LaunchAPPL.cc bootblock.c

	LaunchMethod.h LaunchMethod.cc
	Launcher.h Launcher.cc

	Executor.h Executor.cc
	MiniVMac.h MiniVMac.cc)
target_include_directories(LaunchAPPL PRIVATE ${CMAKE_INSTALL_PREFIX}/include ${Boost_INCLUDE_DIR})
target_link_libraries(LaunchAPPL ResourceFiles ${Boost_LIBRARIES})

install(TARGETS LaunchAPPL RUNTIME DESTINATION bin)
