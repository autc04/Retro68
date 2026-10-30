# Fails if FILE is larger than MAX_BYTES.
#
# Run in CMake script mode, e.g. from an add_test():
#   ${CMAKE_COMMAND} -DFILE=<path> -DMAX_BYTES=<bytes> -P cmake/check-size.cmake
#
# The comparison uses the apparent file size (what `stat` reports), not the
# allocated disk blocks reported by `du`, so the result does not depend on the
# filesystem's block size.

if(NOT DEFINED FILE OR NOT DEFINED MAX_BYTES)
    message(FATAL_ERROR "check-size.cmake: FILE and MAX_BYTES must be defined")
endif()
if(NOT MAX_BYTES MATCHES "^[0-9]+$")
    message(FATAL_ERROR "check-size.cmake: MAX_BYTES must be a non-negative integer, got '${MAX_BYTES}'")
endif()
if(NOT EXISTS "${FILE}")
    message(FATAL_ERROR "check-size.cmake: '${FILE}' does not exist (build the target before running the tests)")
endif()

if(CMAKE_VERSION VERSION_LESS 3.14)
    # file(SIZE) does not exist yet, so probe one byte past the limit instead.
    file(READ "${FILE}" _oversize LIMIT 1 OFFSET ${MAX_BYTES})
    if(_oversize)
        message(FATAL_ERROR "size check FAILED: '${FILE}' exceeds ${MAX_BYTES} bytes")
    endif()
    message(STATUS "size check ok: '${FILE}' is at most ${MAX_BYTES} bytes")
else()
    file(SIZE "${FILE}" _size)
    math(EXPR _size_kib "${_size} / 1024")
    math(EXPR _max_kib "${MAX_BYTES} / 1024")
    if(_size GREATER MAX_BYTES)
        message(FATAL_ERROR "size check FAILED: '${FILE}' is ${_size} bytes (${_size_kib} KiB), limit is ${MAX_BYTES} bytes (${_max_kib} KiB)")
    endif()
    message(STATUS "size check ok: '${FILE}' is ${_size} bytes (${_size_kib} KiB), limit is ${_max_kib} KiB")
endif()
