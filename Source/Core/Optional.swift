
@_frozen
public enum Optional<Wrapped> : ExpressibleByNilLiteral {
  case none
  case some(Wrapped)

  @_transparent
  public init(_ value: Wrapped) {
    self = .some(value)
  }


  @_transparent
  public init(nilLiteral: ()) {
    self = .none
  }
}

