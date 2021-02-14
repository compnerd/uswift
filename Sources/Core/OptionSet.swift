// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol OptionSet: RawRepresentable {
  associatedtype Element = Self
  init(rawValue: RawValue)
}
