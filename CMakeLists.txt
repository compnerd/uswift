
cmake_minimum_required(VERSION 3.13)

project(uSwift LANGUAGES C)

add_library(swiftRuntime STATIC
            ${CMAKE_SOURCE_DIR}/Source/Runtime/KnownMetadata.c)

set(SwiftCore_SOURCES
    ${CMAKE_SOURCE_DIR}/Source/Core/Bool.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/CompilerProtocols.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/Equatable.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/Int8.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/Integers.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/Policy.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/Swift.swift
    ${CMAKE_SOURCE_DIR}/Source/Core/UInt8.swift)
add_custom_command(OUTPUT
                     ${CMAKE_CURRENT_BINARY_DIR}/Swift${CMAKE_C_OUTPUT_EXTENSION}
                   COMMAND
                     ${CMAKE_Swift_COMPILER} -frontend -target ${CMAKE_C_COMPILE_TARGET} -module-name Swift -parse-as-library -parse-stdlib -enable-resilience -c ${SwiftCore_SOURCES} -o ${CMAKE_CURRENT_BINARY_DIR}/Swift${CMAKE_C_OUTPUT_EXTENSION} -emit-module -emit-module-path ${CMAKE_CURRENT_BINARY_DIR}/Swift.swiftmodule
                   DEPENDS
                     ${SwiftCore_SOURCES})
add_custom_target(SwiftObject
                  DEPENDS
                    ${CMAKE_CURRENT_BINARY_DIR}/Swift${CMAKE_C_OUTPUT_EXTENSION})

add_library(swiftCore ${CMAKE_CURRENT_BINARY_DIR}/Swift${CMAKE_C_OUTPUT_EXTENSION})
target_link_libraries(swiftCore PRIVATE swiftRuntime)
set_target_properties(swiftCore PROPERTIES LINKER_LANGUAGE C)
target_link_options(swiftCore PRIVATE -nostdlib -fuse-ld=gold)

