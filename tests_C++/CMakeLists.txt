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

set(EIGEN_PATH "")

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

