// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct Int8 {
  @usableFromInline
  internal var _value: Builtin.Int8

  @_transparent
  public init(_ _value: Builtin.Int8) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout Int8, _ rhs: Int8) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Int8, _ rhs: Int8) -> Int8 {
    return Int8(Builtin.and_Int8(lhs._value, rhs._value))
  }
}

extension Int8: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int8(value).0
  }
}

extension Int8: ExpressibleByIntegerLiteral {
}

extension Int8: Equatable {
  @_transparent
  public static func == (_ lhs: Int8, _ rhs: Int8) -> Bool {
    return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
  }
}
