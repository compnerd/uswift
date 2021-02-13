
@frozen
public struct Int32 {
  @usableFromInline
  internal var _value: Builtin.Int32
}

extension Int32 : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension Int32 : ExpressibleByIntegerLiteral {
}

extension Int32 : Equatable {
  @_transparent
  public static func == (lhs: Int32, rhs: Int32) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

