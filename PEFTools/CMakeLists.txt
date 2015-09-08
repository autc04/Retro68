set(CMAKE_CXX_FLAGS "--std=c++11 -Wall -Werror=return-type -Wno-multichar")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../CIncludes)
add_executable(MakePEF MakePEF.cc rs6000.h PEF.h)

add_executable(MakeImport MakeImport.cc PEF.h)
target_link_libraries(MakeImport ResourceFiles)

install(TARGETS MakePEF MakeImport RUNTIME DESTINATION bin)
