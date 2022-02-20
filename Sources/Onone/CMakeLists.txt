#[[
Copyright © 2018 μSwift Authors.  All Rights Reserved.
SPDX-License-Identifier: BSD-3
#]]

add_library(swiftOnoneSupport
  SwiftOnoneSupport.swift)
set_target_properties(swiftOnoneSupport PROPERTIES
  Swift_MODULE_NAME SwiftOnoneSupport)
target_compile_options(swiftOnoneSupport PRIVATE
  -parse-stdlib
  -disallow-use-new-driver
  "SHELL:-Xfrontend -enable-resilience")
target_link_libraries(swiftOnoneSupport PUBLIC
  swiftCore)
target_link_options(swiftOnoneSupport PRIVATE
  "SHELL:-Xclang-linker -nostdlib")
