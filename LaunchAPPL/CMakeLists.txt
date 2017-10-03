find_package(Boost COMPONENTS filesystem program_options)

set(LAUNCHMETHODS
	Executor.h Executor.cc
	MiniVMac.h MiniVMac.cc
)

if(APPLE)
	LIST(APPEND LAUNCHMETHODS
		Classic.h Classic.cc
		)
	find_program(LAUNCHCFMAPP LaunchCFMApp)
	if(LAUNCHCFMAPP)
		add_definitions(-DHAS_LAUNCHCFMAPP)
		LIST(APPEND LAUNCHMETHODS
			Carbon.h Carbon.cc)
	endif()
endif()
add_definitions(-DRETRO68_PREFIX="${CMAKE_INSTALL_PREFIX}")

add_executable(LaunchAPPL
	LaunchAPPL.cc

	LaunchMethod.h LaunchMethod.cc
	Launcher.h Launcher.cc

	${LAUNCHMETHODS})
	

target_include_directories(LaunchAPPL PRIVATE ${CMAKE_INSTALL_PREFIX}/include ${Boost_INCLUDE_DIR})
target_link_libraries(LaunchAPPL ResourceFiles ${Boost_LIBRARIES})

if(APPLE)
	find_library(APPLICATIONSERVICES_FW ApplicationServices)
	target_link_libraries(LaunchAPPL ${APPLICATIONSERVICES_FW})	
endif()

install(TARGETS LaunchAPPL RUNTIME DESTINATION bin)
