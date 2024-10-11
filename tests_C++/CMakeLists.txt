cmake_minimum_required(VERSION 3.10)

# Project definition
project(mole_tests VERSION 1.0 LANGUAGES CXX)

# Set C++ standard and flags
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp -DARMA_DONT_USE_WRAPPER -DARMA_USE_SUPERLU")

# Set paths for MOLE, Armadillo, OpenBLAS, and SuperLU
set(MOLE_PATH "../mole_C++")
set(ARMA_PATH "/home/janani/armadillo-14.0.2/")
set(OPENBLAS_PATH "/home/janani/openblas")
set(SUPERLU_PATH "/home/janani/superlu")
set(EIGEN_PATH "")

# Include directories
include_directories(${MOLE_PATH})
include_directories(${ARMA_PATH}/include)

# Optionally include Eigen
option(USE_EIGEN "Use Eigen library" OFF)
if(USE_EIGEN AND EIGEN_PATH)
    add_definitions(-DEIGEN)
    include_directories(${EIGEN_PATH})
endif()

# Link libraries (MOLE, OpenBLAS, SuperLU, and Armadillo)
set(LIBS mole)
list(APPEND LIBS ${OPENBLAS_PATH}/lib/libopenblas.a)
#list(APPEND LIBS ${SUPERLU_PATH}/lib/libsuperlu.a)
list(APPEND LIBS ${ARMA_PATH}/lib/libarmadillo.so)

# Add executable tests
foreach(TEST_NUM RANGE 1 5)
    add_executable(test${TEST_NUM} test${TEST_NUM}.cpp)
    target_link_libraries(test${TEST_NUM} PRIVATE ${LIBS})
endforeach()

# Run all tests
add_custom_target(run
    COMMAND LD_LIBRARY_PATH=${MOLE_PATH} ./test1
    COMMAND LD_LIBRARY_PATH=${MOLE_PATH} ./test2
    COMMAND LD_LIBRARY_PATH=${MOLE_PATH} ./test3
    COMMAND LD_LIBRARY_PATH=${MOLE_PATH} ./test4
    COMMAND LD_LIBRARY_PATH=${MOLE_PATH} ./test5
    DEPENDS test1 test2 test3 test4 test5
)

