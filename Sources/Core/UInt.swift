// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UInt {
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
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}

extension UInt: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: UInt, _ rhs: UInt) -> UInt {
    let (result, overflow) =
        Builtin.uadd_with_overflow_Word(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt(result)
  }

  @_transparent
  public static func - (_ lhs: UInt, _ rhs: UInt) -> UInt {
    let (result, overflow) =
        Builtin.usub_with_overflow_Word(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt(result)
  }
}

extension UInt: Numeric {
  @_transparent
  public static func * (_ lhs: UInt, _ rhs: UInt) -> UInt {
    let (result, overflow) =
        Builtin.umul_with_overflow_Word(lhs._value, rhs._value, true._value)

    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return UInt(result)
  }
}

extension UInt: Comparable {
  @_transparent
  public static func < (_ lhs: UInt, _ rhs: UInt) -> Bool {
    return Bool(Builtin.cmp_ult_Word(lhs._value, rhs._value))
  }
}
