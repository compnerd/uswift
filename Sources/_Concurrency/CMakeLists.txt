#[[
Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
All Rights Reserved.

SPDX-License-Identifier: BSD-3
#]]

add_library(swiftConcurrencyShims
  ConcurrencyShims.swift)
set_target_properties(swiftConcurrencyShims PROPERTIES
  Swift_MODULE_NAME _Concurrency)
target_compile_options(swiftConcurrencyShims PRIVATE
  -parse-stdlib
  -disallow-use-new-driver
  "SHELL:-Xfrontend -enable-resilience")
target_link_libraries(swiftConcurrencyShims PUBLIC
  swiftCore)
target_link_options(swiftConcurrencyShims PRIVATE
  "SHELL:-Xclang-linker -nostdlib")
