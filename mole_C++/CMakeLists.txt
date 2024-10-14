cmake_minimum_required(VERSION 3.10)

project(mole_project VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp")


set(ARMA_PATH "/home/oneapi/arma/armadillo-14.0.2/")



include_directories(${ARMA_PATH}/include )

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

