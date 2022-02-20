// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol Numeric: AdditiveArithmetic, ExpressibleByIntegerLiteral {
  static func * (_ lhs: Self, _ rhs: Self) -> Self
  static func *= (_ lhs: inout Self, _ rhs: Self)
}

public extension Numeric {
  @_alwaysEmitIntoClient
  static func *= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs * rhs
  }
}
