// Copyright © 2018 μSwift Authors.  All Rights Reserved.
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

extension Int: AdditiveArithmetic {
  @_transparent
  public static func + (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.sadd_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }

  @_transparent
  public static func - (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.ssub_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension Int: Comparable {
  @_transparent
  public static func < (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_slt_Word(lhs._value, rhs._value))
  }
}

extension Int: Equatable {
  @_transparent
  public static func == (_ lhs: Self, _ rhs: Self) -> Bool {
    return Bool(Builtin.cmp_eq_Word(lhs._value, rhs._value))
  }
}

extension Int: ExpressibleByIntegerLiteral {
}

extension Int: Numeric {
  @_transparent
  public static func * (_ lhs: Self, _ rhs: Self) -> Self {
    let (result, overflow) =
        Builtin.smul_with_overflow_Word(lhs._value, rhs._value, true._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                               .unsafeRawPointer)
    return Self(result)
  }
}

extension Int: BinaryInteger {
  @_transparent
  public static func / (_ lhs: Int, _ rhs: Int) -> Int {
    precondition(rhs != (0 as Int), "Division by zero")

    let (result, overflow) =
        (Builtin.sdiv_Word(lhs._value, rhs._value), false._value)
    Builtin.condfail_message(overflow,
                             StaticString("arithmetic overflow")
                                .unsafeRawPointer)
    return Int(result)
  }  
  
  @_transparent
  public static func % (_ lhs: Int, _ rhs: Int) -> Int {
    precondition(rhs != (0 as Int), 
                 "Division by zero in remainder operation")

    return Int(Builtin.srem_Word(lhs._value, rhs._value))
  }
}

extension Int: FixedWidthInteger {
  @_transparent
  public func addingReportingOverflow(_ other: Int)
      -> (partialValue: Int, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.sadd_with_overflow_Word(_value, other._value, false._value)

    return (partialValue: Int(newStorage), overflow: Bool(overflow))
  }

  @_transparent
  public func subtractingReportingOverflow(_ other: Int)
      -> (partialValue: Int, overflow: Bool) {
    let (newStorage, overflow) =
        Builtin.ssub_with_overflow_Word(_value, other._value, false._value)

    return (partialValue: Int(newStorage), overflow: Bool(overflow))
  }
}
