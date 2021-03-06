# evmone: Fast Ethereum Virtual Machine implementation
# Copyright 2019 The evmone Authors.
# Licensed under the Apache License, Version 2.0.

include(CheckIncludeFileCXX)
include(ExternalProject)


hunter_add_package(benchmark)
find_package(benchmark CONFIG REQUIRED)

add_executable(evmone-bench bench.cpp)

target_include_directories(evmone-bench PRIVATE ${evmone_private_include_dir})
target_link_libraries(evmone-bench PRIVATE evmone testutils evmc::loader benchmark::benchmark)

check_include_file_cxx(filesystem HAVE_FILESYSTEM)
if(NOT HAVE_FILESYSTEM)
    ExternalProject_Add(
        ghcfilesystem
        URL https://raw.githubusercontent.com/gulrak/filesystem/v1.1.4/include/ghc/filesystem.hpp
        URL_HASH SHA256=d0d073e7191e7a5e9242de8f571ad59c789b6a3abaae0f976a2543307f71aa59
        DOWNLOAD_NO_EXTRACT 1
        DOWNLOAD_NO_PROGRESS 1
        PREFIX ${CMAKE_CURRENT_BINARY_DIR}
        DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
    )

    target_include_directories(evmone-bench SYSTEM PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
    add_dependencies(evmone-bench ghcfilesystem)
elseif(UNIX AND NOT APPLE)
    target_link_libraries(evmone-bench PRIVATE stdc++fs)
endif()
