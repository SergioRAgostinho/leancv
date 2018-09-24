cmake_minimum_required(VERSION 3.0.0)

if(POLICY CMP0048)
  cmake_policy(SET CMP0048 NEW) # CMake 3.0.0
endif()

project(cv VERSION 0.1 LANGUAGES NONE)

# Include paths to UseLATEX
# list(APPEND CMAKE_MODULE_PATH "${UseLATEX_DIR}")
include(UseLATEX)

add_latex_document(cv.tex IMAGE_DIRS .)
