// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct Range<Bound: Comparable> {
  public let lowerBound: Bound

  public let upperBound: Bound

  @_alwaysEmitIntoClient
  @inline(__always)
  init(_uncheckedBounds bounds: (lower: Bound, upper: Bound)) {
    lowerBound = bounds.lower
    upperBound = bounds.upper
  }

  @inlinable
  public init(uncheckedBounds bounds: (lower: Bound, upper: Bound)) {
    precondition(bounds.lower <= bounds.upper, "Range requires lowerBound <= upperBound")
    self.init(_uncheckedBounds: (lower: bounds.lower, upper: bounds.upper))
  }

  @inlinable
  public func contains(_ element: Bound) -> Bool {
    return lowerBound <= element && element < upperBound
  }

  @inlinable
  public var isEmpty: Bool {
    return lowerBound == upperBound
  }
}

extension Range: RangeExpression {
  @inlinable
  public func relative<C: Collection>(to _: C) -> Range<Bound>
      where C.Index == Bound {
    return self
  }
}
