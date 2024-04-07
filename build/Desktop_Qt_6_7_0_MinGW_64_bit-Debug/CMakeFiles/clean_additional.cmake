# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appallcom_2_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appallcom_2_autogen.dir\\ParseCache.txt"
  "appallcom_2_autogen"
  )
endif()
