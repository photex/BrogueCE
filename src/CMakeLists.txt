
add_definitions(-DBROGUE_TCOD -DBROGUE_SDL)

set(BROGUE_SRC
  brogue/Architect.c
  brogue/Buttons.c
  brogue/Combat.c
  brogue/Dijkstra.c
  brogue/Globals.c
  brogue/Grid.c
  brogue/IncludeGlobals.h
  brogue/IO.c
  brogue/Items.c
  brogue/Light.c
  brogue/MainMenu.c
  brogue/Math.c
  brogue/Monsters.c
  brogue/Movement.c
  brogue/PowerTables.c
  brogue/Recordings.c
  brogue/Rogue.h
  brogue/RogueMain.c
  brogue/Time.c)

set(PLATFORM_SRC
  ${PROJECT_SOURCE_DIR}/icon.ico
  ${PROJECT_SOURCE_DIR}/icon.rc
  platform/curses-platform.c
  platform/main.c
  platform/platform.h
  platform/PlatformDefines.h
  platform/platformdependent.c
  platform/sdl2-platform.c
  platform/term.c
  platform/term.h)

add_executable(brogue
  WIN32 MACOSX_BUNDLE
  ${PLATFORM_SRC}
  ${BROGUE_SRC})

target_include_directories(brogue PRIVATE brogue PRIVATE platform)

target_link_libraries(brogue libtcod stb_image SDL2-static SDL2main)

# TODO: Setup MacOS bundle properties
# https://cmake.org/cmake/help/latest/prop_tgt/MACOSX_BUNDLE_INFO_PLIST.html#prop_tgt:MACOSX_BUNDLE_INFO_PLIST
