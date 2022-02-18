// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public typealias BooleanLiteralType = Bool

#if arch(arm64) || arch(powerpc64)
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE128
#elseif !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE80
#else
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE64
#endif

precedencegroup AssignmentPrecedence {
  assignment: true
  associativity: right
}

precedencegroup FunctionArrowPrecedence {
  associativity: right
  higherThan: AssignmentPrecedence
}

precedencegroup TernaryPrecedence {
  associativity: right
  higherThan: FunctionArrowPrecedence
}

precedencegroup DefaultPrecedence {
  higherThan: TernaryPrecedence
}

precedencegroup LogicalDisjunctionPrecedence {
  associativity: left
  higherThan: TernaryPrecedence
}

precedencegroup LogicalConjunctionPrecedence {
  associativity: right
  higherThan: LogicalDisjunctionPrecedence
}

precedencegroup ComparisonPrecedence {
  higherThan: LogicalConjunctionPrecedence
}

precedencegroup NilCoalescingPrecedence {
  associativity: right
  higherThan: ComparisonPrecedence
}

precedencegroup CastingPrecedence {
  higherThan: NilCoalescingPrecedence
}

precedencegroup AdditionPrecedence {
  associativity: left
  higherThan: NilCoalescingPrecedence
}

precedencegroup MultiplicationPrecedence {
  associativity: left
  higherThan: AdditionPrecedence
}

precedencegroup BitwiseShiftPrecedence {
  higherThan: MultiplicationPrecedence
}

prefix operator !

infix operator ==: ComparisonPrecedence
infix operator !=: ComparisonPrecedence

infix operator &&: LogicalConjunctionPrecedence

infix operator ||: LogicalDisjunctionPrecedence

infix operator &: MultiplicationPrecedence

infix operator &=: AssignmentPrecedence
