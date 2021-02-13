μSwift[Core]
------------

The Swift language is implemented a small layer of sugar over LLVM IR.  This
includes the core types such as `Bool`.  In order to support even basic
constructs, the language requires the standard library to be available.  The
reference standard library is a large code base and has additional dependencies
such as [libicu](https://icu-project.org).  This makes the library inconvenient
for certain environments.

μSwift is a minimal standard library that provides a few of the core interfaces
required for using basic constructs in Swift.  The long term vision for this
library is to provide conditional control over the features that the
implementation vends.  This enables the use of Swift in embedded systems which
may not be amenable to large libraries and do not need the complete core
functionality from Swift (e.g. Unicode support).

## Components

1. `swiftCore`: the standard library.
2. `swiftOnoneSupport`: the support library for building with `-Onone`
3. `swiftRuntime`: the language runtime support (merged into `swiftCore`)

## Build Requirements
- clang compiler (11.0+)
- Swift compiler (5.4+)
- CMake (3.18+)
- Ninja (1.8+)

## Building

Building a dynamically linked version of the libraries is controlled by the
`BUILD_SHARED_LIBS` standard parameter.

Building with CMake requires the Ninja build tool.

> **NOTE**: There is some support which is required in the Swift compiler itself in
> order to build the Swift stanard library.  This includes support for the
> architecture and the OS spelling.  Without this, the target may not be
> recognised properly and the Standard Library may fail to compile.

The following builds a release (optimized) configuration of the statically
linked variant of the standard library for a freestanding ELF environment:
```
cmake -B out -D BUILD_SHARED_LIBS=NO -D CMAKE_BUILD_TYPE=Release -D CMAKE_Swift_COMPILER_TARGET=aarch64-unknown-none-elf -D CMAKE_Swift_COMPILER_WORKS=YES -G Ninja -S .
ninja -C out
```

> **NOTE**: This support requires patches to the Swift compiler which have not yet
> been merged.  The changes are available at
> [apple/swift#35970](https://github.com/apple/swift/pull/35970).

### Parameters

1. `BUILD_SHARED_LIBS`: Boolean<br/>
Indicates if the libraries should be shared (dynamically linked) or not.

1. `CMAKE_Swift_COMPILER_TARGET`: String<br/>
Identifiers the target triple of the platform that the standard library should
be built.  Defaults to the build.

1. `CMAKE_Swift_COMPILER_WORKS`: Boolean<br/>
Required parameter.  Must always specify a true boolean value.  This is required
to skip the checks that the compiler can build code for the target.  The swift
compiler cannot build code without the standrard library available.  Because we
are building the standard library, we must skip the checks and assume that the
compiler functions properly.

## Artifacts

<dl>
  <dt>swiftCore.dll/libswiftCore.so/libswiftCore.dylib</dt>
  <dd>The runtime component of the standard library.</dd>
  <dt>swiftCore.lib/libswiftCore.so/libswiftCore.dylib</dt>
  <dd>The build/SDK component of the standard library for linking.</dd>
  <dt>Swift.swiftmodule</dt>
  <dd>The build/SDK component of the standard library for building.</dd>
</dl>
