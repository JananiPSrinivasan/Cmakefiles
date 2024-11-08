# Minimum CMake version
cmake_minimum_required(VERSION 3.10)

# Project name and version
project(TopLevelProject VERSION 1.0 LANGUAGES CXX)

# Add subdirectories for mole_C++ and tests_C++
add_subdirectory(mole_C++)
add_subdirectory(tests_C++)

# Custom target to build everything
add_custom_target(all_build DEPENDS mole_C++ tests_C++)
