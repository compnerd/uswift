// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

#include <stddef.h>

#include "Types.h"
#include "Visibility.h"

SWIFT_RUNTIME_ABI
HeapObject *swift_retain(HeapObject *object) { return NULL; }

SWIFT_RUNTIME_ABI
void *swift_slowAlloc(size_t bytes, size_t alignMask) { 
  return NULL; 
}

SWIFT_RUNTIME_ABI
void swift_slowDealloc(void *ptr, size_t bytes, size_t alignMask) {}
