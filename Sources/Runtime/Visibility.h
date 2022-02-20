// Copyright © 2018 μSwift Authors.  All Rights Reserved.
// SPDX-License-Identifier: BSD-3

#ifndef uSwift_Runtime_Visibility_h
#define uSwift_Runtime_Visibility_h

#if defined(__ELF__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__MACH__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#elif defined(__WASM__)
#define SWIFT_RUNTIME_ABI __attribute__((__visibility__("default")))
#else
#define SWIFT_RUNTIME_ABI __declspec(dllexport)
#endif

#endif
