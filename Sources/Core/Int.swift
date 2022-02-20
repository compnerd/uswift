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
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Word(lhs._value, rhs._value))
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
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}

extension Int: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Int, _ rhs: Int) -> Int {
    let (result, overflow) = Builtin.sadd_with_overflow_Word(lhs._value,
                                                             rhs._value,
                                                             true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Int(result)
  }

  @_transparent
  public static func - (_ lhs: Int, _ rhs: Int) -> Int {
    let (result, overflow) = Builtin.ssub_with_overflow_Word(lhs._value,
                                                             rhs._value,
                                                             true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Int(result)
  }
}

extension Int: Comparable {
  @_transparent
  public static func < (_ lhs: Int, _ rhs: Int) -> Bool {
    return Bool(Builtin.cmp_slt_Word(lhs._value, rhs._value))
  }
}
