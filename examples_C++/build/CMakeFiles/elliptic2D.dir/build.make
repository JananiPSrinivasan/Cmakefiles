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
CMAKE_SOURCE_DIR = /home/oneapi/mole/Cmakefiles/examples_C++

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oneapi/mole/Cmakefiles/examples_C++/build

# Include any dependencies generated for this target.
include CMakeFiles/elliptic2D.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/elliptic2D.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/elliptic2D.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/elliptic2D.dir/flags.make

CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: CMakeFiles/elliptic2D.dir/flags.make
CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: ../elliptic2D.cpp
CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o: CMakeFiles/elliptic2D.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o -MF CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o.d -o CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o -c /home/oneapi/mole/Cmakefiles/examples_C++/elliptic2D.cpp

CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oneapi/mole/Cmakefiles/examples_C++/elliptic2D.cpp > CMakeFiles/elliptic2D.dir/elliptic2D.cpp.i

CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oneapi/mole/Cmakefiles/examples_C++/elliptic2D.cpp -o CMakeFiles/elliptic2D.dir/elliptic2D.cpp.s

# Object files for target elliptic2D
elliptic2D_OBJECTS = \
"CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o"

# External object files for target elliptic2D
elliptic2D_EXTERNAL_OBJECTS =

elliptic2D: CMakeFiles/elliptic2D.dir/elliptic2D.cpp.o
elliptic2D: CMakeFiles/elliptic2D.dir/build.make
elliptic2D: /home/oneapi/mole/Cmakefiles/mole_C++/build/libmole_static.a
elliptic2D: /usr/lib/x86_64-linux-gnu/libopenblas.a
elliptic2D: /home/oneapi/superlu/superlu-master/build/SRC/libsuperlu.a
elliptic2D: /usr/lib/x86_64-linux-gnu/libarmadillo.so
elliptic2D: /usr/lib/x86_64-linux-gnu/libgfortran.so.5
elliptic2D: CMakeFiles/elliptic2D.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable elliptic2D"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/elliptic2D.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/elliptic2D.dir/build: elliptic2D
.PHONY : CMakeFiles/elliptic2D.dir/build

CMakeFiles/elliptic2D.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/elliptic2D.dir/cmake_clean.cmake
.PHONY : CMakeFiles/elliptic2D.dir/clean

CMakeFiles/elliptic2D.dir/depend:
	cd /home/oneapi/mole/Cmakefiles/examples_C++/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oneapi/mole/Cmakefiles/examples_C++ /home/oneapi/mole/Cmakefiles/examples_C++ /home/oneapi/mole/Cmakefiles/examples_C++/build /home/oneapi/mole/Cmakefiles/examples_C++/build /home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles/elliptic2D.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/elliptic2D.dir/depend

