#[[
Copyright © 2018 μSwift Authors.  All Rights Reserved.
SPDX-License-Identifier: BSD-3
#]]

add_library(swiftCore
  AdditiveArithmetic.swift
  Assert.swift
  BidirectionalCollection.swift
  BinaryInteger.swift
  Bool.swift
  Builtin.swift
  BuiltinTypes.swift
  Collection.swift
  Comparable.swift
  CompilerProtocols.swift
  CTypes.swift
  Equatable.swift
  Int.swift
  Int8.swift
  Int16.swift
  Int32.swift
  Int64.swift
  Integers.swift
  IteratorProtocol.swift
  Lifetime.swift
  Never.swift
  Numeric.swift
  OpaquePointer.swift
  Operators.swift
  Optional.swift
  OptionSet.swift
  Pointer.swift
  Range.swift
  RangeExpression.swift
  Sequence.swift
  SignedNumeric.swift
  StaticString.swift
  Strideable.swift
  Swift.swift
  UInt.swift
  UInt8.swift
  UInt16.swift
  UInt32.swift
  UInt64.swift
  UnsafeMutablePointer.swift
  UnsafeMutableRawPointer.swift
  UnsafePointer.swift
  UnsafeRawPointer.swift
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
