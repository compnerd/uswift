// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol IteratorProtocol {
  associatedtype Element

  mutating func next() -> Element?
}

public protocol Sequence {
  associatedtype Element
  associatedtype Iterator: IteratorProtocol where Iterator.Element == Element

  __consuming func makeIterator() -> Iterator

  var underestimatedCount: Int { get }
}
