# NOTE: This is mostly based on the libtcod conan build. (O.o)

include(CheckIPOSupported)
check_ipo_supported(RESULT IPO_SUPPORTED)

set(TCOD_SRC libtcod-1.15.1/src/libtcod_c.c libtcod-1.15.1/src/libtcod.cpp)
file(GLOB ZLIB_SRC libtcod-1.15.1/src/vendor/zlib/*.c)
set(VENDOR_SRC ${ZLIB_SRC}
  libtcod-1.15.1/src/vendor/glad.c
  libtcod-1.15.1/src/vendor/lodepng.cpp
  libtcod-1.15.1/src/vendor/utf8proc/utf8proc.c)

add_library(libtcod ${TCOD_SRC} ${VENDOR_SRC})
target_compile_features(libtcod PUBLIC cxx_std_14)
target_link_libraries(libtcod PUBLIC SDL2-static)

target_include_directories(libtcod PUBLIC libtcod-1.15.1/src/)
target_include_directories(libtcod PRIVATE libtcod-1.15.1/src/vendor)
target_include_directories(libtcod PRIVATE libtcod-1.15.1/src/vendor/zlib)

if(BUILD_SHARED_LIBS)
    target_compile_definitions(libtcod PRIVATE LIBTCOD_EXPORTS)
else()
    target_compile_definitions(libtcod PUBLIC LIBTCOD_STATIC)
endif()

if(MSVC)
    target_compile_definitions(libtcod PRIVATE _CRT_SECURE_NO_WARNINGS)
endif()

target_compile_definitions(libtcod PRIVATE TCOD_IGNORE_DEPRECATED)

if(IPO_SUPPORTED)
    set_property(TARGET libtcod PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
    set_property(TARGET libtcod PROPERTY INTERPROCEDURAL_OPTIMIZATION_DEBUG FALSE)
endif()

if(MSVC)
    set_property(TARGET libtcod PROPERTY OUTPUT_NAME libtcod)
else()
    set_property(TARGET libtcod PROPERTY OUTPUT_NAME tcod)
endif()
