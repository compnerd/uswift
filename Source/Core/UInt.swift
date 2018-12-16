
// XXX(compnerd) why can `UInt` not be a typealias?
// The typealias does not inherit the Equatable conformance

@_fixed_layout
public struct UInt {
  @usableFromInline
  internal var _value: Builtin.Int32
}

extension UInt : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_u_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension UInt : ExpressibleByIntegerLiteral {
}

extension UInt : Equatable {
  @_transparent
  public static func == (lhs: UInt, rhs: UInt) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

