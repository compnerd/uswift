
// XXX(compnerd) why can `Int` not be a typealias?
// The typealias does not inherit the Equatable conformance

@_fixed_layout
public struct Int {
  @usableFromInline
  internal var _value: Builtin.Int32
}

extension Int : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension Int : ExpressibleByIntegerLiteral {
}

extension Int : Equatable {
  @_transparent
  public static func == (lhs: Int, rhs: Int) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

