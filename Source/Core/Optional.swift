// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@_frozen
public enum Optional<Wrapped> : ExpressibleByNilLiteral {
  case none
  case some(Wrapped)

  @_transparent
  public init(_ value: Wrapped) {
    self = .some(value)
  }


  @_transparent
  public init(nilLiteral: ()) {
    self = .none
  }
}

