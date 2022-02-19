// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol IteratorProtocol {
  associatedtype Element

  mutating func next() -> Element?
}
