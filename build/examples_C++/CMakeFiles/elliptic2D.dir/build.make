# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/oneapi/topLevel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oneapi/topLevel/build

# Include any dependencies generated for this target.
include examples_C++/CMakeFiles/elliptic2D.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples_C++/CMakeFiles/elliptic2D.dir/compiler_depend.make

# Include the progress variables for this target.
include examples_C++/CMakeFiles/elliptic2D.dir/progress.make

# Include the compile flags for this target's objects.
include examples_C++/CMakeFiles/elliptic2D.dir/flags.make

examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: examples_C++/CMakeFiles/elliptic2D.dir/flags.make
examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: ../examples_C++/elliptic2D.cpp
examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: examples_C++/CMakeFiles/elliptic2D.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oneapi/topLevel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o"
	cd /home/oneapi/topLevel/build/examples_C++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o -MF CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o.d -o CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o -c /home/oneapi/topLevel/examples_C++/elliptic2D.cpp

examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i"
	cd /home/oneapi/topLevel/build/examples_C++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oneapi/topLevel/examples_C++/elliptic2D.cpp > CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i

examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s"
	cd /home/oneapi/topLevel/build/examples_C++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oneapi/topLevel/examples_C++/elliptic2D.cpp -o CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s

# Object files for target elliptic2D
elliptic2D_OBJECTS = \
"CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o"

# External object files for target elliptic2D
elliptic2D_EXTERNAL_OBJECTS =

examples_C++/elliptic2D: examples_C++/CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o
examples_C++/elliptic2D: examples_C++/CMakeFiles/elliptic2D.dir/build.make
examples_C++/elliptic2D: mole_C++/libmole_C++.a
examples_C++/elliptic2D: /usr/lib/x86_64-linux-gnu/libarmadillo.so
examples_C++/elliptic2D: /opt/OpenBLAS/lib/libopenblas.so
examples_C++/elliptic2D: /usr/local/lib/libsuperlu.a
examples_C++/elliptic2D: examples_C++/CMakeFiles/elliptic2D.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oneapi/topLevel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable elliptic2D"
	cd /home/oneapi/topLevel/build/examples_C++ && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/elliptic2D.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples_C++/CMakeFiles/elliptic2D.dir/build: examples_C++/elliptic2D
.PHONY : examples_C++/CMakeFiles/elliptic2D.dir/build

examples_C++/CMakeFiles/elliptic2D.dir/clean:
	cd /home/oneapi/topLevel/build/examples_C++ && $(CMAKE_COMMAND) -P CMakeFiles/elliptic2D.dir/cmake_clean.cmake
.PHONY : examples_C++/CMakeFiles/elliptic2D.dir/clean

examples_C++/CMakeFiles/elliptic2D.dir/depend:
	cd /home/oneapi/topLevel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oneapi/topLevel /home/oneapi/topLevel/examples_C++ /home/oneapi/topLevel/build /home/oneapi/topLevel/build/examples_C++ /home/oneapi/topLevel/build/examples_C++/CMakeFiles/elliptic2D.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples_C++/CMakeFiles/elliptic2D.dir/depend
