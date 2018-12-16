
public protocol Equatable {
  static func == (lhs: Self, rhs: Self) -> Bool
}

extension Equatable {
  @_transparent
  public static func != (lhs: Self, rhs: Self) -> Bool {
    return !(lhs == rhs)
  }
}

