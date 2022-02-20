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
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Int8(lhs._value, rhs._value))
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
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
  }
}

extension UInt8: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: UInt8, _ rhs: UInt8) -> UInt8 {
    let (result, overflow) =
        Builtin.uadd_with_overflow_Int8(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt8(result)
  }

  @_transparent
  public static func - (_ lhs: UInt8, _ rhs: UInt8) -> UInt8 {
    let (result, overflow) =
        Builtin.usub_with_overflow_Int8(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt8(result)
  }
}

extension UInt8: Comparable {
  @_transparent
  public static func < (_ lhs: UInt8, _ rhs: UInt8) -> Bool {
    return Bool(Builtin.cmp_ult_Int8(lhs._value, rhs._value))
  }
}
