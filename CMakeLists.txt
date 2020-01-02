cmake_minimum_required(VERSION 3.15)

project(brogue C CXX)

option(BUNDLED_THIRD_PARTY "Download and build third party dependencies." OFF)
option(BUILD_SHARED_LIBS "Enable if you'd prefer to have shared libraries for any bundled deps." OFF)
option(FORCE_STATIC_VCRT "Force /MT for static VC runtimes" ON)

if (BUNDLED_THIRD_PARTY)
  add_subdirectory(third_party)
endif ()

add_subdirectory(src)
