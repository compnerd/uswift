// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

@_transparent
public func precondition(_ condition: @autoclosure () -> Bool, _: StaticString,
                         file _: StaticString = #file, line _: UInt = #line) {
  let error = !condition()
  Builtin.condfail_message(error._value,
                           StaticString("precondition failure")
                              .unsafeRawPointer)
}
