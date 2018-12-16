
@_fixed_layout
public struct Int8 {
  @usableFromInline
  internal var _value: Builtin.Int8
}

extension Int8 : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(_builtinIntegerLiteral value: Builtin.IntLiteral) {
    _value = Builtin.s_to_s_checked_trunc_IntLiteral_Int8(value).0
  }
}

extension Int8 : ExpressibleByIntegerLiteral {
}

