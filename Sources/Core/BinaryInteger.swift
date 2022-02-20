// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol BinaryInteger: Numeric, Strideable {
  override static func + (_ lhs: Self, _ rhs: Self) -> Self
  override static func - (_ lhs: Self, _ rhs: Self) -> Self
  override static func * (_ lhs: Self, _ rhs: Self) -> Self

  override static func += (_ lhs: inout Self, _ rhs: Self)
  override static func -= (_ lhs: inout Self, _ rhs: Self)
  override static func *= (_ lhs: inout Self, _ rhs: Self)

  var bitWidth: Int { get }
  var trailingZeroBitCount: Int { get }

  static var isSigned: Bool { get }

  init<T: BinaryInteger>(_ source: T)

  init<T: BinaryInteger>(truncatingIfNeeded source: T)

  init<T: BinaryInteger>(clamping source: T)

  static func / (_ lhs: Self, _ rhs: Self) -> Self
  static func % (_ lhs: Self, _ rhs: Self) -> Self

  static prefix func ~ (_ x: Self) -> Self
  static func & (_ lhs: Self, _ rhs: Self) -> Self
  static func | (_ lhs: Self, _ rhs: Self) -> Self
  static func ^ (_ lhs: Self, _ rhs: Self) -> Self

  static func >> <RHS: BinaryInteger>(_ lhs: Self, _ rhs: RHS) -> Self
  static func << <RHS: BinaryInteger>(_ lhs: Self, _ rhs: RHS) -> Self

  static func &= (_ lhs: inout Self, _ rhs: Self)
  static func |= (_ lhs: inout Self, _ rhs: Self)
  static func ^= (_ lhs: inout Self, _ rhs: Self)

  static func %= (_ lhs: inout Self, _ rhs: Self)
  static func /= (_ lhs: inout Self, _ rhs: Self)

  static func >>= <RHS: BinaryInteger>(_ lhs: inout Self, _ rhs: RHS)
  static func <<= <RHS: BinaryInteger>(_ lhs: inout Self, _ rhs: RHS)

  func quotientAndRemainder(dividingBy rhs: Self)
      -> (quotient: Self, remainder: Self)
  func isMultiple(of other: Self) -> Bool
  func signum() -> Self
}
