// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol FixedWidthInteger: BinaryInteger {
  func addingReportingOverflow(_ rhs: Self)
      -> (partialValue: Self, overflow: Bool)
  func subtractingReportingOverflow(_ rhs: Self)
      -> (partialValue: Self, overflow: Bool)
}

extension FixedWidthInteger {
  @_transparent
  public static func &+ (lhs: Self, rhs: Self) -> Self {
    return lhs.addingReportingOverflow(rhs).partialValue
  }

  @_transparent
  public static func &+= (lhs: inout Self, rhs: Self) {
    lhs = lhs &+ rhs
  }

  @_transparent
  public static func &- (lhs: Self, rhs: Self) -> Self {
    return lhs.subtractingReportingOverflow(rhs).partialValue
  }

  @_transparent
  public static func &-= (lhs: inout Self, rhs: Self) {
    lhs = lhs &- rhs
  }
}
