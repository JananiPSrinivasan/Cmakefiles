cmake_minimum_required(VERSION 3.10)
project(mole_project VERSION 1.0 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fopenmp")



# Required Libraries
# Armadillo
find_package(Armadillo 12.6.6 QUIET)
if (NOT Armadillo_FOUND)
    message(STATUS "Armadillo not found. Downloading and building it.")
    ExternalProject_Add(armadillo
        URL https://gitlab.com/conradsnicta/armadillo-code/-/archive/12.6.6/armadillo-code-12.6.6.tar.gz
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${LOCAL_INSTALL_DIR}
    )
    set(ARMADILLO_INCLUDE_DIRS ${LOCAL_INSTALL_DIR}/include)
    set(ARMADILLO_LIBRARIES ${LOCAL_INSTALL_DIR}/lib/libarmadillo.so)
else()
    message(STATUS "Armadillo found.")
endif()

set(SOURCES utils.cpp divergence.cpp gradient.cpp laplacian.cpp interpol.cpp mixedbc.cpp robinbc.cpp)

add_library(mole_C++ ${SOURCES})


# Include directories
target_include_directories(mole_C++ PUBLIC ${ARMADILLO_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIRS} ${OpenBLAS_INCLUDE_DIRS} ${SUPERLU_INCLUDE_DIR})

# Link libraries
target_link_libraries(mole_C++ PUBLIC ${ARMADILLO_LIBRARIES} ${OpenBLAS_LIBRARIES} ${SUPERLU_LIBRARY})


# Install mole library and headers for easy inclusion in other projects
install(TARGETS mole_C++  DESTINATION "${CMAKE_BINARY_DIR}/install")

