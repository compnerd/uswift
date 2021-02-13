
#include "Types.h"
#include "Visibility.h"
#include <stdlib.h>

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
