# CMake generated Testfile for 
# Source directory: /Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core
# Build directory: /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/core
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(stack_unittest "/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/core/stack_unittest")
set_tests_properties(stack_unittest PROPERTIES  _BACKTRACE_TRIPLES "/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/CMakeLists.txt;34;add_test;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;2;add_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;5;add_core_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;0;")
add_test(store_unittest "/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/core/store_unittest")
set_tests_properties(store_unittest PROPERTIES  _BACKTRACE_TRIPLES "/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/CMakeLists.txt;34;add_test;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;2;add_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;6;add_core_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;0;")
add_test(core_unittest "/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/core/core_unittest")
set_tests_properties(core_unittest PROPERTIES  _BACKTRACE_TRIPLES "/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/CMakeLists.txt;34;add_test;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;2;add_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;7;add_core_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/CMakeLists.txt;0;")
subdirs("runtime")
