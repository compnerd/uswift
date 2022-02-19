// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct Int {
  @usableFromInline
  internal var _value: Builtin.Word

  @_transparent
  public init(_ _value: Builtin.Word) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout Int, _ rhs: Int) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Int, _ rhs: Int) -> Int {
    Int(Builtin.and_Word(lhs._value, rhs._value))
  }
}

extension Int: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Word(value).0
  }
}

extension Int: ExpressibleByIntegerLiteral {
}

extension Int: Equatable {
  @_transparent
  public static func == (_ lhs: Int, _ rhs: Int) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}
