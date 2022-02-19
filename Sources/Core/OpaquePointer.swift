// Copyright © 2022 Max Desiatov <max@desiatov.com>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct OpaquePointer {
  @usableFromInline
  internal var _rawValue: Builtin.RawPointer

  @usableFromInline @_transparent
  internal init(_ v: Builtin.RawPointer) {
    _rawValue = v
  }

  @_transparent
  public init?(bitPattern: Int) {
    guard bitPattern != 0 else { return nil }
    _rawValue = Builtin.inttoptr_Word(bitPattern._value)
  }

  @_transparent
  public init?(bitPattern: UInt) {
    guard bitPattern != 0 else { return nil }
    _rawValue = Builtin.inttoptr_Word(bitPattern._value)
  }

  @_transparent
  public init<T>(@_nonEphemeral _ from: UnsafePointer<T>) {
    _rawValue = from._rawValue
  }

  @_transparent
  public init?<T>(@_nonEphemeral _ from: UnsafePointer<T>?) {
    guard let unwrapped = from else { return nil }
    self.init(unwrapped)
  }

  @_transparent
  public init<T>(@_nonEphemeral _ from: UnsafeMutablePointer<T>) {
    _rawValue = from._rawValue
  }

  @_transparent
  public init?<T>(@_nonEphemeral _ from: UnsafeMutablePointer<T>?) {
    guard let unwrapped = from else { return nil }
    self.init(unwrapped)
  }
}
