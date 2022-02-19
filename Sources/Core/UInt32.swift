// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt32 {
  @usableFromInline
  internal var _value: Builtin.Int32

  @_transparent
  public init(_ _value: Builtin.Int32) {
    self._value = _value
  }

  @_transparent
  public static func &= (lhs: inout UInt32, rhs: UInt32) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (lhs: UInt32, rhs: UInt32) -> UInt32 {
    UInt32(Builtin.and_Int32(lhs._value, rhs._value))
  }
}

extension UInt32: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_u_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension UInt32: ExpressibleByIntegerLiteral {
}

extension UInt32: Equatable {
  @_transparent
  public static func == (lhs: UInt32, rhs: UInt32) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}
