#[[
Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
All Rights Reserved.

SPDX-License-Identifier: BSD-3
#]]

add_library(swiftRuntime STATIC
  Enum.c
  HeapObject.c
  Metadata.c
  KnownMetadata.c)
