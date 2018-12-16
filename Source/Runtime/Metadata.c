
#if defined(__ELF__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__MACH__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__WASM__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#else
#define SWIFT_RUNTIME_ABI __declspec(dllexport)
#endif

SWIFT_RUNTIME_ABI
void swift_addNewDSOImage() {
}

