// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@frozen
public struct StaticString {
  /// `StaticString` stores either a pointer to null-terminated string data, or
  /// a single unicode scalar if possible.
  @usableFromInline
  internal var _startPtrOrData: Builtin.Word

  @usableFromInline
  internal var _utf8CodeUnitCount: Builtin.Word

  /// Flags indicating how `StaticString` storage is used.
  ///
  /// Bit 0 indicates if `_startPtrOrData` contains a Unicode scalar.
  /// Bit 1 indicates if `_startPtrOrData` is a pointer to an ASCII string.
  /// Bits 2-7 are reserved.
  @usableFromInline
  internal var _flags: Builtin.Int8

  @_transparent
  public init() {
    self = ""
  }

  @usableFromInline
  @_transparent
  internal init(_start: Builtin.RawPointer, utf8CodeUnitCount: Builtin.Word,
                isASCII: Builtin.Int1) {
    let pointerRepresentationFlag = (0x0 as UInt8)._value
    let asciiFlag = (0x2 as UInt8)._value

    _startPtrOrData = Builtin.ptrtoint_Word(_start)
    _utf8CodeUnitCount = utf8CodeUnitCount
    _flags = Bool(isASCII) ? asciiFlag : pointerRepresentationFlag
  }

  @_alwaysEmitIntoClient
  @_transparent
  internal var unsafeRawPointer: Builtin.RawPointer {
    return Builtin.inttoptr_Word(_startPtrOrData)
  }

  @_transparent
  public var hasPointerRepresentation: Bool {
    return (UInt8(_flags) & 0x1) == 0
  }

  @_transparent
  public var isASCII: Bool {
    return (UInt8(_flags) & 0x2) != 0
  }
}

extension StaticString: _ExpressibleByBuiltinStringLiteral {
  @_effects(readonly)
  @_transparent
  public init(_builtinStringLiteral start: Builtin.RawPointer,
              utf8CodeUnitCount: Builtin.Word, isASCII: Builtin.Int1) {
    self = StaticString(_start: start, utf8CodeUnitCount: utf8CodeUnitCount,
                        isASCII: isASCII)
  }
}

extension StaticString: ExpressibleByStringLiteral {
  @_effects(readonly)
  @_transparent
  public init(stringLiteral value: StaticString) {
    self = value
  }
}
