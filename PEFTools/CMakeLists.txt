find_package(Boost CONFIG COMPONENTS filesystem REQUIRED)

add_executable(MakePEF MakePEF.cc rs6000.h PEF.h)

add_executable(MakeImport MakeImport.cc PEF.h)
target_link_libraries(MakeImport ResourceFiles Boost::filesystem)

install(TARGETS MakePEF MakeImport RUNTIME DESTINATION bin)
