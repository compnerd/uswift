
@_fixed_layout
public struct UInt32 {
  @usableFromInline
  internal var _value: Builtin.Int32
}

extension UInt32 : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_u_checked_trunc_IntLiteral_Int32(value).0
  }
}

extension UInt32 : ExpressibleByIntegerLiteral {
}

extension UInt32 : Equatable {
  @_transparent
  public static func == (lhs: UInt32, rhs: UInt32) -> Bool {
    return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
  }
}

