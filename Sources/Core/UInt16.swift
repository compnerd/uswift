// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt16 {
  @usableFromInline
  internal var _value: Builtin.Int16

  @_transparent
  public init(_ _value: Builtin.Int16) {
    self._value = _value
  }

  @_transparent
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Int16(lhs._value, rhs._value))
  }
}

extension UInt16: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int16(value).0
  }
}

extension UInt16: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) = 
        Builtin.sadd_with_overflow_Int16(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }

  @_transparent
  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.ssub_with_overflow_Int16(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }
}

extension UInt16: Comparable {
  @_transparent
  public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_slt_Int16(lhs._value, rhs._value))
  }
}

extension UInt16: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int16(lhs._value, rhs._value))
  }
}

extension UInt16: ExpressibleByIntegerLiteral {
}

extension UInt16: Numeric {
  @_transparent
  public static func * (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.smul_with_overflow_Int16(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Self(result)
  }
}
