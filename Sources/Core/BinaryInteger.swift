// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol BinaryInteger: Numeric {
  override static func + (_ lhs: Self, _ rhs: Self) -> Self
  override static func - (_ lhs: Self, _ rhs: Self) -> Self
  override static func * (_ lhs: Self, _ rhs: Self) -> Self

  override static func += (_ lhs: inout Self, _ rhs: Self)
  override static func -= (_ lhs: inout Self, _ rhs: Self)
  override static func *= (_ lhs: inout Self, _ rhs: Self)

  static func / (_ lhs: Self, _ rhs: Self) -> Self
  static func % (_ lhs: Self, _ rhs: Self) -> Self

  static func /= (_ lhs: inout Self, _ rhs: Self)
  static func %= (_ lhs: inout Self, _ rhs: Self)
}

extension BinaryInteger {
  @_transparent
  public static func /= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs / rhs
  }
}

extension BinaryInteger {
  @_transparent
  public static func %= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs % rhs
  }
}
