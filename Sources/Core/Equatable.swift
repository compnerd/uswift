// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol Equatable {
  static func == (_ lhs: Self, _ rhs: Self) -> Bool
}

extension Equatable {
  @_transparent
  public static func != (_ lhs: Self, _ rhs: Self) -> Bool {
    return !(lhs == rhs)
  }
}
