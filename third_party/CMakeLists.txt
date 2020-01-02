
add_library(stb_image STATIC stb/stb_image.h stb/stb_image.c)
target_include_directories(stb_image INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/stb)

# TODO: It should be possible to just download binaries instead of building all the things.
set(LIBTCOD_MSVC_RELEASE_URL https://github.com/libtcod/libtcod/releases/download/1.15.1/libtcod-1.15.1-x86_64-msvc.zip)
set(LIBTCOD_MACOS_RELEASE_URL https://github.com/libtcod/libtcod/releases/download/1.15.1/libtcod-1.15.1-x86.x86_64-macos.tar.gz)

set(TCOD_ARCHIVE_NAME libtcod-1.15.1.tar.gz)
set(TCOD_SRC_URL https://github.com/libtcod/libtcod/archive/1.15.1.tar.gz)
set(TCOD_ARCHIVE ${CMAKE_CURRENT_SOURCE_DIR}/${TCOD_ARCHIVE_NAME})

set(SDL2_ARCHIVE_NAME SDL2-2.0.10.tar.gz)
set(SDL2_SRC_URL http://libsdl.org/release/${SDL2_ARCHIVE_NAME})
set(SDL2_ARCHIVE ${CMAKE_CURRENT_SOURCE_DIR}/${SDL2_ARCHIVE_NAME})

#set(SDL2_image_ARCHIVE_NAME SDL2_image-2.0.5.tar.gz)
#set(SDL2_image_SRC_URL https://www.libsdl.org/projects/SDL_image/release/SDL2_image-2.0.5.tar.gz)
#set(SDL2_image_ARCHIVE ${CMAKE_CURRENT_SOURCE_DIR}/${SDL2_image_ARCHIVE_NAME})

message(STATUS "Downloading SDL2")
file(DOWNLOAD ${SDL2_SRC_URL} ${SDL2_ARCHIVE})
#message(STATUS "Downloading SDL2_image")
#file(DOWNLOAD ${SDL2_image_SRC_URL} ${SDL2_image_ARCHIVE})
message(STATUS "Downloading libtcod")
file(DOWNLOAD ${TCOD_SRC_URL} ${TCOD_ARCHIVE})

message(STATUS "Unpacking libtcod")
execute_process(
  COMMAND ${CMAKE_COMMAND} -E tar xf ${TCOD_ARCHIVE}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

message(STATUS "Unpacking SDL2")
execute_process(
  COMMAND ${CMAKE_COMMAND} -E tar xf ${SDL2_ARCHIVE}
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

#message(STATUS "Unpacking SDL2_image")
#execute_process(
#  COMMAND ${CMAKE_COMMAND} -E tar xf ${SDL2_image_ARCHIVE}
#  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

add_subdirectory(SDL2-2.0.10)
#include(sdl2_image.cmake)
include(libtcod.cmake)
