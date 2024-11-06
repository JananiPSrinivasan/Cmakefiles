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

# Link libraries
set(LIBS)
list(APPEND LIBS ${ARMADILLO_LIBRARIES} ${OpenBLAS_LIBRARIES} ${SUPERLU_LIBRARIES} mole_C++)  # Include libmole.a
list(APPEND LIBS /usr/lib/x86_64-linux-gnu/libgfortran.so.5) 


# Executable definitions
add_executable(transport1D transport1D.cpp)
target_link_libraries(transport1D ${LIBS})

add_executable(schrodinger1D schrodinger1D.cpp)
target_link_libraries(schrodinger1D ${LIBS})

add_executable(elliptic1D elliptic1D.cpp)
target_link_libraries(elliptic1D ${LIBS})

add_executable(elliptic2D elliptic2D.cpp)
target_link_libraries(elliptic2D ${LIBS})
