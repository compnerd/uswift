// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt8 {
  @usableFromInline
  internal var _value: Builtin.Int8

  @_transparent
  public init(_ _value: Builtin.Int8) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout UInt8, _ rhs: UInt8) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: UInt8, _ rhs: UInt8) -> UInt8 {
    return UInt8(Builtin.and_Int8(lhs._value, rhs._value))
  }
}

extension UInt8: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_u_checked_trunc_IntLiteral_Int8(value).0
  }
}

extension UInt8: ExpressibleByIntegerLiteral {
}

extension UInt8: Equatable {
  @_transparent
  public static func == (_ lhs: UInt8, _ rhs: UInt8) -> Bool {
    return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
  }
}
