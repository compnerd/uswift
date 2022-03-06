// Copyright © 2018 μSwift AUthors.  All Rights Reserved.
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

extension UInt: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.uadd_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }

  @_transparent
  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.usub_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension UInt: Comparable {
  @_transparent
  public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_ult_Word(lhs._value, rhs._value))
  }
}

extension UInt: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}

extension UInt: ExpressibleByIntegerLiteral {
}

extension UInt: Numeric {
  @_transparent
  public static func * (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.umul_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension UInt: BinaryInteger {
  @_transparent
  public static func / (_ lhs: UInt, _ rhs: UInt) -> UInt {
    precondition(rhs != (0 as UInt), "Division by zero")

    let (result, overflow) =
        (Builtin.udiv_Word(lhs._value, rhs._value), false._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return UInt(result)
  }  
  
  @_transparent
  public static func % (_ lhs: UInt, _ rhs: UInt) -> UInt {
    precondition(rhs != (0 as UInt), 
                 "Division by zero in remainder operation")

    return UInt(Builtin.urem_Word(lhs._value, rhs._value))
  }
}

extension UInt: FixedWidthInteger {
  @_transparent
  public func addingReportingOverflow(_ other: UInt)
      -> (partialValue: UInt, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.uadd_with_overflow_Word(_value, other._value, false._value)

    return (partialValue: UInt(newStorage), overflow: Bool(overflow))
  }

  @_transparent
  public func subtractingReportingOverflow(_ other: UInt)
      -> (partialValue: UInt, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.usub_with_overflow_Word(_value, other._value, false._value)

    return (partialValue: UInt(newStorage), overflow: Bool(overflow))
  }
}
