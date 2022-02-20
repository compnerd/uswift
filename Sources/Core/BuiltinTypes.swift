// Copyright © 2022 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public typealias BooleanLiteralType = Bool

#if arch(arm64) || arch(powerpc64)
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE128
#elseif !(os(Windows) || os(Android)) && (arch(i386) || arch(x86_64))
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE80
#else
  public typealias _MaxBuiltinFloatType = Builtin.FPIEEE64
#endif
