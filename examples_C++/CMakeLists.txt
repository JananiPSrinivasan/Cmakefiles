cmake_minimum_required(VERSION 3.10)

# Project definition
project(mole_tests VERSION 1.0 LANGUAGES CXX)

# Set C++ standard and flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp -DARMA_DONT_USE_WRAPPER -DARMA_USE_SUPERLU")

# Set paths for MOLE, Armadillo, OpenBLAS, and SuperLU
set(MOLE_PATH "/home/oneapi/mole/Cmakefiles/mole_C++") 
set(ARMA_PATH "/usr/include")
set(OPENBLAS_PATH "/usr/lib/x86_64-linux-gnu")
set(SUPERLU_PATH "/home/oneapi/superlu/superlu-master/build/SRC") 


# Include directories
include_directories(${MOLE_PATH})
include_directories(${ARMA_PATH})

# Link libraries
set(LIBS)
list(APPEND LIBS ${MOLE_PATH}/build/libmole_static.a)  # Include libmole.a
list(APPEND LIBS ${OPENBLAS_PATH}/libopenblas.a)
list(APPEND LIBS ${SUPERLU_PATH}/libsuperlu.a)
list(APPEND LIBS /usr/lib/x86_64-linux-gnu/libarmadillo.so)
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
