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
  public static func &= (_ lhs: inout Self, _ rhs: Self) {
    lhs = lhs & rhs
  }

  @_transparent
  public static func & (_ lhs: Self, _ rhs: Self) -> Self {
    return Self(Builtin.and_Int32(lhs._value, rhs._value))
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
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

extension UInt32: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: UInt32, _ rhs: UInt32) -> UInt32 {
    let (result, overflow) =
        Builtin.uadd_with_overflow_Int32(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt32(result)
  }

  @_transparent
  public static func - (_ lhs: UInt32, _ rhs: UInt32) -> UInt32 {
    let (result, overflow) =
        Builtin.usub_with_overflow_Int32(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt32(result)
  }
}

extension UInt32: Numeric {
  @_transparent
  public static func * (_ lhs: UInt32, _ rhs: UInt32) -> UInt32 {
    let (result, overflow) =
        Builtin.umul_with_overflow_Int32(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt32(result)
  }
}

extension UInt32: Comparable {
  @_transparent
  public static func < (_ lhs: UInt32, _ rhs: UInt32) -> Bool {
    return Bool(Builtin.cmp_ult_Int32(lhs._value, rhs._value))
  }
}
