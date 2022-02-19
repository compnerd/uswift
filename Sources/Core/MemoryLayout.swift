// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public enum MemoryLayout<T> {
  @_transparent
  public static var size: Int {
    Int(Builtin.sizeof(T.self))
  }

  @_transparent
  public static var stride: Int {
    Int(Builtin.strideof(T.self))
  }

  @_transparent
  public static var alignment: Int {
    Int(Builtin.alignof(T.self))
  }
}

public extension MemoryLayout {
  @_transparent
  static func size(ofValue _: T) -> Int {
    MemoryLayout.size
  }

  @_transparent
  static func stride(ofValue _: T) -> Int {
    MemoryLayout.stride
  }

  @_transparent
  static func alignment(ofValue _: T) -> Int {
    MemoryLayout.alignment
  }
}
