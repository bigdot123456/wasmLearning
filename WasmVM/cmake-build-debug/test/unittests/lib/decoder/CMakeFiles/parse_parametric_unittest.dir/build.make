# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = "/Users/liqinghua/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/192.6603.37/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/liqinghua/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/192.6603.37/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/liqinghua/git/wasmLearning/WasmVM

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug

# Include any dependencies generated for this target.
include test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/depend.make

# Include the progress variables for this target.
include test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/progress.make

# Include the compile flags for this target's objects.
include test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/flags.make

test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o: test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/flags.make
test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o: test/unittests/lib/decoder/parse_parametric_unittest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o"
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o -c /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder/parse_parametric_unittest.cpp

test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.i"
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder/parse_parametric_unittest.cpp > CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.i

test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.s"
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder/parse_parametric_unittest.cpp -o CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.s

# Object files for target parse_parametric_unittest
parse_parametric_unittest_OBJECTS = \
"CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o"

# External object files for target parse_parametric_unittest
parse_parametric_unittest_EXTERNAL_OBJECTS =

test/unittests/lib/decoder/parse_parametric_unittest: test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/parse_parametric_unittest.cpp.o
test/unittests/lib/decoder/parse_parametric_unittest: test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/build.make
test/unittests/lib/decoder/parse_parametric_unittest: src/lib/libwasmvm_core.a
test/unittests/lib/decoder/parse_parametric_unittest: test/unittests/libwasmvm_unittest_util.a
test/unittests/lib/decoder/parse_parametric_unittest: test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable parse_parametric_unittest"
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parse_parametric_unittest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/build: test/unittests/lib/decoder/parse_parametric_unittest

.PHONY : test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/build

test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/clean:
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder && $(CMAKE_COMMAND) -P CMakeFiles/parse_parametric_unittest.dir/cmake_clean.cmake
.PHONY : test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/clean

test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/depend:
	cd /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/liqinghua/git/wasmLearning/WasmVM /Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/decoder /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder /Users/liqinghua/git/wasmLearning/WasmVM/cmake-build-debug/test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/unittests/lib/decoder/CMakeFiles/parse_parametric_unittest.dir/depend

