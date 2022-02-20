// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol SignedNumeric: Numeric {
  static prefix func - (_ operand: Self) -> Self

  mutating func negate()
}
