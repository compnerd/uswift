
#ifndef uSwift_Runtime_Types_h
#define uSwift_Runtime_Types_h

typedef struct Metadata Metadata;
typedef struct EnumMetadata EnumMetadata;
typedef struct ValueMetadata ValueMetadata;
typedef struct OpaqueValue OpaqueValue;

typedef struct ValueTypeDescriptor ValueTypeDescriptor;
typedef struct GenericValueMetadataPattern GenericValueMetadataPattern;

typedef struct MetdataRequest {
} MetadataRequest;
typedef struct MetdataResponse {
} MetadataResponse;

typedef struct TypeContextDescriptor TypeContextDescriptor;
typedef struct TypeLayout TypeLayout;

typedef struct HeapObject HeapObject;

typedef enum EnumLayoutFlags {
  invalid,
} EnumLayoutFlags;

typedef void(__attribute__((__swiftcall__)) *
             StoreExtraInhabitantTagFn)(OpaqueValue *value, unsigned store_case,
                                        unsigned extra_inhabitants,
                                        const Metadata *payload);

#endif
