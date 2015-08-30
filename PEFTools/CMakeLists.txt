set(CMAKE_CXX_FLAGS "--std=c++11 -Wall -Werror=return-type -Wno-multichar")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../CIncludes)
add_executable(MakePEF MakePEF.cc xcoff.h powerpc.h external.h PEF.h)

add_executable(MakeImport MakeImport.cc PEF.h)

install(TARGETS MakePEF RUNTIME DESTINATION bin)
