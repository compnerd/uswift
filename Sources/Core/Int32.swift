// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct Int32 {
  @usableFromInline
  internal var _value: Builtin.Int32

  @_transparent
  public init(_ _value: Builtin.Int32) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Int32(lhs._value, rhs._value))
  }
}

extension Int32: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension Int32: ExpressibleByIntegerLiteral {
}

extension Int32: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

extension Int32: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Int32, _ rhs: Int32) -> Int32 {
    let (result, overflow) =
        Builtin.sadd_with_overflow_Int32(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Int32(result)
  }

  @_transparent
  public static func - (_ lhs: Int32, _ rhs: Int32) -> Int32 {
    let (result, overflow) =
        Builtin.ssub_with_overflow_Int32(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Int32(result)
  }
}

extension Int32: Comparable {
  @_transparent
  public static func < (_ lhs: Int32, _ rhs: Int32) -> Bool {
    return Bool(Builtin.cmp_slt_Int32(lhs._value, rhs._value))
  }
}
