cmake_minimum_required(VERSION 3.10)

# Project definition
project(tests_C++ VERSION 1.0 LANGUAGES CXX)

# Set C++ standard and flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp -DARMA_DONT_USE_WRAPPER -DARMA_USE_SUPERLU")

# Add mole library as a subdirectory
add_subdirectory("../mole_C++" mole_build)
set(MOLE_PATH "../mole_C++" mole_build) 

# Required Libraries
find_package(Armadillo 12.6.6 REQUIRED)
find_package(Eigen3 3.3.7 REQUIRED)
find_package(OpenBLAS 0.3.8 REQUIRED)


# Find the SuperLU headers and library manually
find_path(SUPERLU_INCLUDE_DIR slu_ddefs.h PATHS /usr/local/include /usr/include)
find_library(SUPERLU_LIBRARY superlu PATHS /usr/local/lib /usr/lib)

# If SuperLU is not found, download and build it with ExternalProject
if (NOT SUPERLU_INCLUDE_DIR OR NOT SUPERLU_LIBRARY)
    include(ExternalProject)
    message(STATUS "SuperLU not found. Downloading and installing in /usr/local.")

    ExternalProject_Add(superlu
        URL https://github.com/xiaoyeli/superlu/archive/refs/tags/v5.2.1.tar.gz
        PREFIX ${CMAKE_BINARY_DIR}/superlu
        CONFIGURE_COMMAND ""
        BUILD_COMMAND make lib
        INSTALL_COMMAND sudo make install PREFIX=/usr/local
        BUILD_IN_SOURCE 1
    )

    # Specify where to find the installed SuperLU library and headers
    set(SUPERLU_INCLUDE_DIR /usr/local/include)
    set(SUPERLU_LIBRARIES /usr/local/lib/libsuperlu.a)

    # Ensure targets that need SuperLU depend on this ExternalProject
    add_dependencies(tests_C++ superlu)
endif()

# Include SuperLU in the include directories
include_directories(${SUPERLU_INCLUDE_DIR})
set(SUPERLU_LIBRARIES ${SUPERLU_LIBRARY})



# Include directories for all libraries
include_directories(${ARMADILLO_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIRS} ${OpenBLAS_INCLUDE_DIRS} ${SUPERLU_INCLUDE_DIR} ${MOLE_PATH}/include)

# Add executable tests and link libraries
foreach(TEST_NUM RANGE 1 5)
    add_executable(test${TEST_NUM} test${TEST_NUM}.cpp)
    target_link_libraries(test${TEST_NUM} PUBLIC mole_C++ ${ARMADILLO_LIBRARIES} ${OpenBLAS_LIBRARIES} ${SUPERLU_LIBRARIES})
endforeach()

# Custom target to run all tests
add_custom_target(run
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/mole_C++ ./test1
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/mole_C++ ./test2
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/mole_C++ ./test3
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/mole_C++ ./test4
    COMMAND ${CMAKE_COMMAND} -E env LD_LIBRARY_PATH=${CMAKE_BINARY_DIR}/mole_C++ ./test5
    DEPENDS test1 test2 test3 test4 test5
)

