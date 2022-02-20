// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct UnsafeMutableRawPointer: _Pointer {
  public typealias Pointee = UInt8

  public let _rawValue: Builtin.RawPointer

  @_transparent
  public init(_ _rawValue: Builtin.RawPointer) {
    self._rawValue = _rawValue
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

  @_transparent
  public init(@_nonEphemeral mutating other: UnsafeRawPointer) {
    _rawValue = other._rawValue
  }

  @_transparent
  public init?(@_nonEphemeral mutating other: UnsafeRawPointer?) {
    guard let unwrapped = other else { return nil }
    _rawValue = unwrapped._rawValue
  }

  @inlinable
  public static func allocate(byteCount: Int, alignment: Int)
      -> UnsafeMutableRawPointer {
    let alignment: Int =
        alignment <= minAllocationAlignment() ? 0 : alignment
    return UnsafeMutableRawPointer(Builtin.allocRaw(
      byteCount._value, alignment._value))
  }

  @inlinable
  public func deallocate() {
    let size: Int = -1
    let alignment: Int = 0
    Builtin.deallocRaw(_rawValue, size._value, alignment._value)
  }

  @_transparent
  @discardableResult
  public func bindMemory<T>(to type: T.Type, capacity count: Int)
      -> UnsafeMutablePointer<T> {
    Builtin.bindMemory(_rawValue, count._value, type)
    return UnsafeMutablePointer<T>(_rawValue)
  }

  @_transparent
  public func assumingMemoryBound<T>(to _: T.Type) -> UnsafeMutablePointer<T> {
    return UnsafeMutablePointer<T>(_rawValue)
  }
}
