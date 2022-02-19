// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt {
  @usableFromInline
  internal var _value: Builtin.Word
}

extension UInt: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_u_checked_trunc_IntLiteral_Word(value).0
  }
}

extension UInt: ExpressibleByIntegerLiteral {
}

extension UInt: Equatable {
  @_transparent
  public static func == (lhs: UInt, rhs: UInt) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}
