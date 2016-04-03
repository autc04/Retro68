set(CMAKE_CXX_FLAGS "--std=c++11 -Wall -Werror=return-type -Wno-multichar")

find_package(Boost COMPONENTS filesystem system REQUIRED)

add_executable(MakePEF MakePEF.cc rs6000.h PEF.h)

add_executable(MakeImport MakeImport.cc PEF.h)
target_link_libraries(MakeImport ResourceFiles ${Boost_LIBRARIES})

install(TARGETS MakePEF MakeImport RUNTIME DESTINATION bin)
