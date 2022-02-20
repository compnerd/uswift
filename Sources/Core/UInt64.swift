// Copyright © 2022 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt64 {
  @usableFromInline
  internal var _value: Builtin.Int64

  @_transparent
  public init(_ _value: Builtin.Int64) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Int64(lhs._value, rhs._value))
  }
}

extension UInt64: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int64(value).0
  }
}

extension UInt64: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) = 
        Builtin.sadd_with_overflow_Int64(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }

  @_transparent
  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.ssub_with_overflow_Int64(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }
}

extension UInt64: Comparable {
  @_transparent
  public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_slt_Int64(lhs._value, rhs._value))
  }
}

extension UInt64: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int64(lhs._value, rhs._value))
  }
}

extension UInt64: ExpressibleByIntegerLiteral {
}

extension UInt64: Numeric {
  @_transparent
  public static func * (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.smul_with_overflow_Int64(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }
}