// Copyright © 2022 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

public protocol FixedWidthInteger {
  func addingReportingOverflow(_ rhs: Self)
      -> (partialValue: Self, overflow: Bool)
  func subtractingReportingOverflow(_ rhs: Self)
      -> (partialValue: Self, overflow: Bool)
}
