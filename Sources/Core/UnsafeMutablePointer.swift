// Copyright © 2021 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UnsafeMutablePointer<Pointee>: _Pointer {
  public let _rawValue: Builtin.RawPointer

  @_transparent
  public init(_ _rawValue: Builtin.RawPointer) {
    self._rawValue = _rawValue
  }
}
