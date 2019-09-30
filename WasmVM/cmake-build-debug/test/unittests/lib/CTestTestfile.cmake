# CMake generated Testfile for 
# Source directory: /Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib
# Build directory: /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Loader_unittest "/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/Loader_unittest")
set_tests_properties(Loader_unittest PROPERTIES  _BACKTRACE_TRIPLES "/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/CMakeLists.txt;34;add_test;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;4;add_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;7;add_lib_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;0;")
add_test(LoaderRequest_unittest "/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/LoaderRequest_unittest")
set_tests_properties(LoaderRequest_unittest PROPERTIES  _BACKTRACE_TRIPLES "/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/CMakeLists.txt;34;add_test;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;4;add_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;8;add_lib_unittest;/Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/CMakeLists.txt;0;")
subdirs("core")
subdirs("instance")
subdirs("dataTypes")
subdirs("decoder")
subdirs("validator")
subdirs("instanciator")
