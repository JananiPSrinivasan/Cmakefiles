cmake_minimum_required(VERSION 3.10)
project(mole_project VERSION 1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp")



# Required Libraries
find_package(Armadillo 12.6.6 REQUIRED)
find_package(Eigen3 3.3.7 REQUIRED)
find_package(OpenBLAS 0.3.8 REQUIRED)

# Find the SuperLU headers
find_path(SUPERLU_INCLUDE_DIR
    NAMES slu_ddefs.h
    PATHS "/home/oneapi/superlu/superlu-master/build/SRC" "/usr/local/include" "/usr/include"
    NO_DEFAULT_PATH
)

# Find the SuperLU library
find_library(SUPERLU_LIBRARY
    NAMES superlu
    PATHS "/home/oneapi/superlu/superlu-master/build/lib" "/usr/local/lib" "/usr/lib"
    NO_DEFAULT_PATH
)

# Check if both the library and include directory were found
if(NOT SUPERLU_INCLUDE_DIR OR NOT SUPERLU_LIBRARY)
    message(FATAL_ERROR "SuperLU not found. Please make sure SuperLU is installed.")
else()
    message(STATUS "SuperLU found at ${SUPERLU_INCLUDE_DIR} and ${SUPERLU_LIBRARY}")
endif()

# Link to the SuperLU library
include_directories(${SUPERLU_INCLUDE_DIR})
set(SUPERLU_LIBRARIES ${SUPERLU_LIBRARY})

set(SOURCES utils.cpp divergence.cpp gradient.cpp laplacian.cpp interpol.cpp mixedbc.cpp robinbc.cpp)

add_library(mole_C++ ${SOURCES})


# Include directories
target_include_directories(mole_C++ PUBLIC ${ARMADILLO_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIRS} ${OpenBLAS_INCLUDE_DIRS} ${SUPERLU_INCLUDE_DIR})

# Link libraries
target_link_libraries(mole_C++ PUBLIC ${ARMADILLO_LIBRARIES} ${OpenBLAS_LIBRARIES} ${SUPERLU_LIBRARY})


# Install mole library and headers for easy inclusion in other projects
install(TARGETS mole_C++  DESTINATION "${CMAKE_BINARY_DIR}/install")

