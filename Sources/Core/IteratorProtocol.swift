// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol IteratorProtocol {
  associatedtype Element

  mutating func next() -> Element?
}
