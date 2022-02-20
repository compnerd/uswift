// Copyright © 2022 μSwift Authors.  // All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol SignedNumeric: Numeric {
  static prefix func - (_ operand: Self) -> Self

  mutating func negate()
}

// FIXME(MaxDesiatov): extension with default implementations of `prefix func -` and
// `negate()` are missing. This extension currently causes assertions in the
// type checker. We assume that this is caused by our iterative approach, which
// temporarily excluded certain requirements from previously added protocols.
