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
include CMakeFiles/transport1D.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/transport1D.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/transport1D.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/transport1D.dir/flags.make

CMakeFiles/transport1D.dir/transport1D.cpp.o: CMakeFiles/transport1D.dir/flags.make
CMakeFiles/transport1D.dir/transport1D.cpp.o: ../transport1D.cpp
CMakeFiles/transport1D.dir/transport1D.cpp.o: CMakeFiles/transport1D.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/transport1D.dir/transport1D.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/transport1D.dir/transport1D.cpp.o -MF CMakeFiles/transport1D.dir/transport1D.cpp.o.d -o CMakeFiles/transport1D.dir/transport1D.cpp.o -c /home/oneapi/mole/Cmakefiles/examples_C++/transport1D.cpp

CMakeFiles/transport1D.dir/transport1D.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/transport1D.dir/transport1D.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oneapi/mole/Cmakefiles/examples_C++/transport1D.cpp > CMakeFiles/transport1D.dir/transport1D.cpp.i

CMakeFiles/transport1D.dir/transport1D.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/transport1D.dir/transport1D.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oneapi/mole/Cmakefiles/examples_C++/transport1D.cpp -o CMakeFiles/transport1D.dir/transport1D.cpp.s

# Object files for target transport1D
transport1D_OBJECTS = \
"CMakeFiles/transport1D.dir/transport1D.cpp.o"

# External object files for target transport1D
transport1D_EXTERNAL_OBJECTS =

transport1D: CMakeFiles/transport1D.dir/transport1D.cpp.o
transport1D: CMakeFiles/transport1D.dir/build.make
transport1D: /home/oneapi/mole/Cmakefiles/mole_C++/build/libmole_static.a
transport1D: /usr/lib/x86_64-linux-gnu/libopenblas.a
transport1D: /home/oneapi/superlu/superlu-master/build/SRC/libsuperlu.a
transport1D: /usr/lib/x86_64-linux-gnu/libarmadillo.so
transport1D: /usr/lib/x86_64-linux-gnu/libgfortran.so.5
transport1D: CMakeFiles/transport1D.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable transport1D"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/transport1D.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/transport1D.dir/build: transport1D
.PHONY : CMakeFiles/transport1D.dir/build

CMakeFiles/transport1D.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/transport1D.dir/cmake_clean.cmake
.PHONY : CMakeFiles/transport1D.dir/clean

CMakeFiles/transport1D.dir/depend:
	cd /home/oneapi/mole/Cmakefiles/examples_C++/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oneapi/mole/Cmakefiles/examples_C++ /home/oneapi/mole/Cmakefiles/examples_C++ /home/oneapi/mole/Cmakefiles/examples_C++/build /home/oneapi/mole/Cmakefiles/examples_C++/build /home/oneapi/mole/Cmakefiles/examples_C++/build/CMakeFiles/transport1D.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/transport1D.dir/depend

