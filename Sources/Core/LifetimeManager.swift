// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@inlinable
public func withUnsafeMutablePointer<T, Result>(
  to value: inout T,
  _ body: (UnsafeMutablePointer<T>) throws -> Result
) rethrows -> Result {
  try body(UnsafeMutablePointer<T>(Builtin.addressof(&value)))
}
