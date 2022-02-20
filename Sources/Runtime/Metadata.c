// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

#include "Types.h"
#include "Visibility.h"
#include <stddef.h>
#include <stdint.h>

SWIFT_RUNTIME_ABI
void swift_addNewDSOImage() {}

SWIFT_RUNTIME_ABI
ValueMetadata *swift_allocateGenericValueMetadata(
    const ValueTypeDescriptor *descriptor, const void *arguments,
    const GenericValueMetadataPattern *pattern, size_t extra) {
  return NULL;
}

SWIFT_RUNTIME_ABI
MetadataResponse swift_checkMetadataState(MetadataRequest request,
                                          const Metadata *metdata) {
  return (MetadataResponse){};
};

SWIFT_RUNTIME_ABI
MetadataResponse
swift_getGenericMetadata(MetadataRequest request, const void *const *arguments,
                         const TypeContextDescriptor *descriptor) {
  return (MetadataResponse){};
}

SWIFT_RUNTIME_ABI
MetadataResponse
swift_getTupleTypeMetadata2(MetadataRequest request, const Metadata *element0,
                            const Metadata *element1, const char *labels,
                            const ValueWitnessTable *witnesses) {
  return (MetadataResponse){};
}

SWIFT_RUNTIME_ABI
void swift_initStructMetadata(StructMetadata *self, StructLayoutFlags flags,
                              size_t numFields,
                              const TypeLayout * const *fieldTypes,
                              uint32_t *fieldOffsets) {}

SWIFT_RUNTIME_ABI
const TypeMetadata *
swift_getTypeByMangledNameInContextInMetadataState(size_t metadataState,
                                                   const char *typeNameStart, 
                                                   size_t typeNameLength,
                                                   const void *context, 
                                                   const void *const *genericArgs) {
  return NULL;
}
