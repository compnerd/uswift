// Copyright © 2018 Saleem Abdulrasool <compnerd@compnerd.org>.
// All Rights Reserved.
// SPDX-License-Identifier: BSD-3

#if defined(__ELF__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__MACH__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__WASM__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#else
#define SWIFT_RUNTIME_ABI __declspec(dllexport)
#endif

struct ValueWitnessTable {};

struct TypeMetadata {};

SWIFT_RUNTIME_ABI
struct ValueWitnessTable $sBi8_WV;

SWIFT_RUNTIME_ABI
struct ValueWitnessTable $sBi32_WV;

SWIFT_RUNTIME_ABI
struct ValueWitnessTable $sytWV;

SWIFT_RUNTIME_ABI
struct TypeMetadata $sBi1_N;

SWIFT_RUNTIME_ABI
struct TypeMetadata $sBi8_N;

SWIFT_RUNTIME_ABI
struct TypeMetadata $sBi32_N;
