// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct Int8 {
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

extension Int8: _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int8(value).0
  }
}

extension Int8: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.sadd_with_overflow_Int8(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }

  @_transparent
  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.ssub_with_overflow_Int8(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension Int8: Comparable {
  @_transparent
  public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_slt_Int8(lhs._value, rhs._value))
  }
}

extension Int8: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
  }
}

extension Int8: ExpressibleByIntegerLiteral {
}

extension Int8: Numeric {
  @_transparent
  public static func * (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.smul_with_overflow_Int8(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension Int8: BinaryInteger {
  @_transparent
  public static func / (_ lhs: Int8, _ rhs: Int8) -> Int8 {
    precondition(rhs != (0 as Int8), "Division by zero")

    let (result, overflow) =
        (Builtin.sdiv_Int8(lhs._value, rhs._value), false._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Int8(result)
  }  
  
  @_transparent
  public static func % (_ lhs: Int8, _ rhs: Int8) -> Int8 {
    precondition(rhs != (0 as Int8), 
                 "Division by zero in remainder operation")

    return Int8(Builtin.srem_Int8(lhs._value, rhs._value))
  }
}

extension Int8: FixedWidthInteger {
  @_transparent
  public func addingReportingOverflow(_ other: Int8)
      -> (partialValue: Int8, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.sadd_with_overflow_Int8(_value, other._value, false._value)

    return (partialValue: Int8(newStorage), overflow: Bool(overflow))
  }

  @_transparent
  public func subtractingReportingOverflow(_ other: Int8)
      -> (partialValue: Int8, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.ssub_with_overflow_Int8(_value, other._value, false._value)

    return (partialValue: Int8(newStorage), overflow: Bool(overflow))
  }
}
