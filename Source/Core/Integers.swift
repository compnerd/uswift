
extension ExpressibleByIntegerLiteral
    where Self : _ExpressibleByBuiltinIntegerLiteral {
  @_transparent
  public init(integerLiteral value: Self) {
    self = value
  }
}

