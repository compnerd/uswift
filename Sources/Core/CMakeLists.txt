#[[
Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
All Rights Reserved.

SPDX-License-Identifier: BSD-3
#]]

add_library(swiftCore
  Bool.swift
  Builtin.swift
  CompilerProtocols.swift
  CTypes.swift
  Equatable.swift
  Int.swift
  Int8.swift
  Int32.swift
  Integers.swift
  Never.swift
  OpaquePointer.swift
  Optional.swift
  OptionSet.swift
  Pointer.swift
  Policy.swift
  Swift.swift
  UInt.swift
  UInt8.swift
  UInt32.swift
  UnsafeMutablePointer.swift
  UnsafePointer.swift
  Void.swift)
set_target_properties(swiftCore PROPERTIES
  Swift_MODULE_NAME Swift)
target_compile_options(swiftCore PRIVATE
  -parse-stdlib
  -disallow-use-new-driver
  "SHELL:-Xfrontend -enable-resilience")
target_link_libraries(swiftCore PRIVATE
  swiftRuntime)
target_link_options(swiftCore PRIVATE
  "SHELL:-Xclang-linker -nostdlib")
