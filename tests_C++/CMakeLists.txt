cmake_minimum_required(VERSION 3.10)

# Project definition
project(mole_tests VERSION 1.0 LANGUAGES CXX)

# Set C++ standard and flags
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp -DARMA_DONT_USE_WRAPPER -DARMA_USE_SUPERLU")




# Set paths for MOLE
message (WARNING "Change the MOLE_PATH in CMakefile to inclde Mole Libraries")
set(MOLE_PATH "/home/oneapi/mole/Cmakefiles/mole_C++")



#Finding Armadillo and setting ARMA_PATH
find_package(Armadillo REQUIRED)
if(NOT Armadillo_FOUND)
    message(FATAL_ERROR "Armadillo not found. Please install libarmadillo-dev.")
endif()
message (WARNING "Change the armadillo path in ARMA_PATH if not installed in the default location") 
set(ARMA_PATH "/usr/include")




#Finding Openblas and setting OPENBLAS_PATH
find_library(OPENBLAS NAMES openblas blas PATHS "/usr/lib/x86_64-linux-gnu")
if(NOT OPENBLAS)
    message(FATAL_ERROR "Openblas not found. Please install libopenblas-dev.")
else()
    message(STATUS "Openblas found at ${OPENBLAS}")
endif()
message (WARNING "Change the openblas path in OPENBLAS_PATH if not installed in the default location")
set(OPENBLAS_PATH "/usr/lib/x86_64-linux-gnu")




#Finding SUPERLU and setting SUPERLU_PATH
find_library(SUPERLU NAMES superlu superlu-master PATHS "/home/oneapi/superlu/superlu-master/build/SRC")
if(NOT SUPERLU)
    message(FATAL_ERROR "SuperLu not found. Please install SuperLu.")
else()
    message(STATUS "Openblas found at ${SUPERLU}")
endif()
message (WARNING "Change the superlu path in SUPERLU_PATH if not installed in the default location")
set(SUPERLU_PATH "/home/oneapi/superlu/superlu-master/build/SRC") 





find_path(EIGEN eigen3/Eigen PATHS "/usr/include" "/usr/local/include")
if(NOT EIGEN)
    message(FATAL_ERROR "Eigen not found. Please install libeigen3-dev.")
else()
    message(STATUS "Eigen found at ${EIGEN}")
endif()
message (WARNING "Change the eigen path in EIGEN_PATH if not installed in the default location")
set (EIGEN_PATH "/usr/include")





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

