// Copyright © 2021 Zoe Carver <zoe@zoecarver.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UnsafePointer<Pointee>: _Pointer {
  public let _rawValue: Builtin.RawPointer

  @_transparent
  public init(_ _rawValue: Builtin.RawPointer) {
    self._rawValue = _rawValue
  }
}
