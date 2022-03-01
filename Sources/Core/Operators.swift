// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

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
prefix operator -
prefix operator ~

infix operator ==: ComparisonPrecedence
infix operator !=: ComparisonPrecedence
infix operator <: ComparisonPrecedence
infix operator <=: ComparisonPrecedence
infix operator >: ComparisonPrecedence
infix operator >=: ComparisonPrecedence
infix operator ~=: ComparisonPrecedence

infix operator &&: LogicalConjunctionPrecedence

infix operator ||: LogicalDisjunctionPrecedence

infix operator +: AdditionPrecedence
infix operator -: AdditionPrecedence
infix operator |: AdditionPrecedence
infix operator ^: AdditionPrecedence
infix operator &+: AdditionPrecedence
infix operator &-: AdditionPrecedence

infix operator &: MultiplicationPrecedence
infix operator *: MultiplicationPrecedence
infix operator /: MultiplicationPrecedence
infix operator %: MultiplicationPrecedence

infix operator &=: AssignmentPrecedence
infix operator +=: AssignmentPrecedence
infix operator -=: AssignmentPrecedence
infix operator *=: AssignmentPrecedence
infix operator /=: AssignmentPrecedence
infix operator %=: AssignmentPrecedence
infix operator |=: AssignmentPrecedence
infix operator ^=: AssignmentPrecedence

infix operator &+=: AssignmentPrecedence
infix operator &-=: AssignmentPrecedence

infix operator <<=: AssignmentPrecedence
infix operator >>=: AssignmentPrecedence

infix operator &<<=: AssignmentPrecedence
infix operator &>>=: AssignmentPrecedence

infix operator <<: BitwiseShiftPrecedence
infix operator >>: BitwiseShiftPrecedence

infix operator &<<: BitwiseShiftPrecedence
infix operator &>>: BitwiseShiftPrecedence
