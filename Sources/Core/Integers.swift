// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

extension ExpressibleByIntegerLiteral
where Self: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(integerLiteral value: Self) {
    self = value
  }
}
