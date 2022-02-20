// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UnsafeRawPointer: _Pointer {
  public typealias Pointee = UInt8

  public let _rawValue: Builtin.RawPointer

  @_transparent
  public init(_ _rawValue: Builtin.RawPointer) {
    self._rawValue = _rawValue
  }

  @_transparent
  public init<T>(@_nonEphemeral _ other: UnsafePointer<T>) {
    _rawValue = other._rawValue
  }

  @_transparent
  public init?<T>(@_nonEphemeral _ other: UnsafePointer<T>?) {
    guard let unwrapped = other else { return nil }
    _rawValue = unwrapped._rawValue
  }

  @_transparent
  public init<T>(@_nonEphemeral _ other: UnsafeMutablePointer<T>) {
    _rawValue = other._rawValue
  }

  @_transparent
  public init?<T>(@_nonEphemeral _ other: UnsafeMutablePointer<T>?) {
    guard let unwrapped = other else { return nil }
    _rawValue = unwrapped._rawValue
  }

// These functions are known to crash 5.4 and 5.5 compiler releases on Windows.
#if swift(>=5.6)

  @_transparent
  @discardableResult
  public func bindMemory<T>(to type: T.Type, capacity count: Int)
      -> UnsafePointer<T> {
    Builtin.bindMemory(_rawValue, count._value, type)
    return UnsafePointer<T>(_rawValue)
  }

  @_transparent
  public func assumingMemoryBound<T>(to: T.Type) -> UnsafePointer<T> {
    return UnsafePointer<T>(_rawValue)
  }

#endif

  @inlinable
  public func deallocate() {
    let size: Int = -1
    let alignment: Int = 0
    Builtin.deallocRaw(_rawValue, size._value, alignment._value)
  }
}
