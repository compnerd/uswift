#[[
Copyright © 2018 μSwift Authors.  All Rights Reserved.
SPDX-License-Identifier: BSD-3
#]]

cmake_minimum_required(VERSION 3.18)

project(uSwift
  LANGUAGES C Swift)

# TODO(compnerd) we should only filter out ld.bfd (ld) and support both gold and
# lld as valid options.
if(NOT CMAKE_SYSTEM_NAME MATCHES Windows AND NOT CMAKE_SYSTEM_NAME MATCHES Darwin)
  add_link_options($<$<LINK_LANGUAGE:C,CXX>:-fuse-ld=gold>)
endif()

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_Swift_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/swift)

add_subdirectory(Sources)
