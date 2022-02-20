// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol BidirectionalCollection: Collection
    where SubSequence: BidirectionalCollection,
    Indices: BidirectionalCollection {
  override var indices: Indices { get }

  override subscript(_: Range<Index>) -> SubSequence { get }
  override func index(after i: Index) -> Index
  override func formIndex(after i: inout Index)

  func index(before i: Index) -> Index
  func formIndex(before i: inout Index)

  @_nonoverride
  func index(_ i: Index, offsetBy distance: Int) -> Index

  @_nonoverride
  func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index)
      -> Index?

  @_nonoverride
  func distance(from start: Index, to end: Index) -> Int
}
