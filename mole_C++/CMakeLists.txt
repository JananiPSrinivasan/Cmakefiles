cmake_minimum_required(VERSION 3.10)

project(mole_project VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp")




find_package(Armadillo REQUIRED)
if(NOT Armadillo_FOUND)
    message(FATAL_ERROR "Armadillo not found. Please install libarmadillo-dev.")
endif()

message (WARNING "Change the armadillo path in ARMA_PATH if not installed in the default location")

set(ARMA_PATH "/usr/include")


find_path(EIGEN eigen3/Eigen PATHS "/usr/include" "/usr/local/include")
if(NOT EIGEN)
    message(FATAL_ERROR "Eigen not found. Please install libeigen3-dev.")
else()
    message(STATUS "Eigen found at ${EIGEN}")
endif()
message (WARNING "Change the eigen path in EIGEN_PATH if not installed in the default location")
set (EIGEN_PATH "/usr/include")


include_directories(${ARMA_PATH}/include )
include_directories(${EIGEN_PATH}/eigen3 )

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp")

set(SOURCES
    utils.cpp
    divergence.cpp 
    gradient.cpp 
    laplacian.cpp 
    interpol.cpp 
    mixedbc.cpp 
    robinbc.cpp
)


add_library(mole_static STATIC ${SOURCES})

add_library(mole_shared SHARED ${SOURCES})

set_target_properties(mole_static PROPERTIES OUTPUT_NAME "mole_static")
set_target_properties(mole_shared PROPERTIES OUTPUT_NAME "mole_shared")

