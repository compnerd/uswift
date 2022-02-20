// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public enum Optional<Wrapped>: ExpressibleByNilLiteral {
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

extension Optional: Equatable where Wrapped: Equatable {
  @inlinable
  public static func == (_ lhs: Wrapped?, _ rhs: Wrapped?) -> Bool {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
      return lhs == rhs
    case (nil, nil):
      return true
    default:
      return false
    }
  }

  @inlinable
  public static func != (_ lhs: Wrapped?, _ rhs: Wrapped?) -> Bool {
    return !(lhs == rhs)
  }
}
