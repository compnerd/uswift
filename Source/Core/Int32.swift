
@_fixed_layout
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

