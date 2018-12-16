
public typealias BooleanLiteralType = Bool

#if arch(arm64) || arch(powerpc64)
public typealias _MaxBuiltinFloatType = Builtin.FPIEEE128
#elseif arch(i386) || arch(x86_64)
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

prefix operator ! : Bool

infix operator == : ComparisonPrecedence, Equatable
infix operator != : ComparisonPrecedence, Equatable

infix operator && : LogicalDisjunctionPrecedence, Bool

infix operator || : LogicalDisjunctionPrecedence, Bool

