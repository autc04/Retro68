cmake_minimum_required(VERSION 2.8)
add_library(retrocrt_multi
   start.c
   malloc.c
   syscalls.c
   )
add_custom_command(
   OUTPUT retrocrt.o
   DEPENDS retrocrt_multi
   COMMAND ${CMAKE_LINKER} -r -o retrocrt.o --whole-archive libretrocrt_multi.a
   )
add_library(retrocrt retrocrt.o glue.c)
#add_custom_target(retrocrt_o ALL DEPENDS retrocrt.o)
install(TARGETS retrocrt  DESTINATION lib)
