// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

#ifndef uSwift_Runtime_Types_h
#define uSwift_Runtime_Types_h

typedef struct Metadata Metadata;
typedef struct OpaqueValue OpaqueValue;

typedef enum EnumLayoutFlags {
  invalid,
} EnumLayoutFlags;
typedef struct EnumMetadata EnumMetadata;

typedef struct GenericValueMetadataPattern GenericValueMetadataPattern;

typedef struct HeapObject HeapObject;

typedef struct MetdataRequest {
} MetadataRequest;
typedef struct MetdataResponse {
} MetadataResponse;

typedef struct TypeContextDescriptor TypeContextDescriptor;
typedef struct TypeLayout TypeLayout;
typedef struct TypeMetadata {
} TypeMetadata;

typedef struct StructLayoutFlags {
} StructLayoutFlags;
typedef struct StructMetadata {
} StructMetadata;

typedef struct ValueMetadata ValueMetadata;
typedef struct ValueTypeDescriptor ValueTypeDescriptor;
typedef struct ValueWitnessTable {
} ValueWitnessTable;

typedef void(__attribute__((__swiftcall__)) *
             StoreExtraInhabitantTagFn)(OpaqueValue *value, unsigned store_case,
                                        unsigned extra_inhabitants,
                                        const Metadata *payload);

#endif
