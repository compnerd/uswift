// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol _ExpressibleByBuiltinBooleanLiteral {
  init(_builtinBooleanLiteral value: Builtin.Int1)
}

public protocol ExpressibleByBooleanLiteral {
  associatedtype BooleanLiteralType: _ExpressibleByBuiltinBooleanLiteral
  init(booleanLiteral value: BooleanLiteralType)
}

public protocol _ExpressibleByBuiltinFloatLiteral {
  init(_builtinFloatLiteral value: _MaxBuiltinFloatType)
}

public protocol ExpressibleByFloatLiteral {
  associatedtype FloatLiteralType: _ExpressibleByBuiltinFloatLiteral
  init(floatLiteral value: FloatLiteralType)
}

public protocol _ExpressibleByBuiltinIntegerLiteral {
  init(_builtinIntegerLiteral value: Builtin.IntLiteral)
}

public protocol ExpressibleByIntegerLiteral {
  associatedtype IntegerLiteralType = _ExpressibleByBuiltinIntegerLiteral
  init(integerLiteral value: IntegerLiteralType)
}

public protocol ExpressibleByNilLiteral {
  init(nilLiteral: ())
}

public protocol RawRepresentable {
  associatedtype RawValue
  var rawValue: RawValue { get }
  init?(rawValue: RawValue)
}
