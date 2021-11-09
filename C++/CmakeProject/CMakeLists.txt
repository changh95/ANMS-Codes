project(ANMS_Codes)
cmake_minimum_required(VERSION 2.8.3)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wall")

message(STATUS "${CMAKE_CURRENT_SOURCE_DIR}")

if (CMAKE_BUILD_TYPE MATCHES "Debug")
  find_package(OpenCV REQUIRED HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../../opencv/install/Debug/lib/cmake/opencv4)
endif (CMAKE_BUILD_TYPE MATCHES "Debug")

if (CMAKE_BUILD_TYPE MATCHES "Release")
  find_package(OpenCV REQUIRED HINTS ${CMAKE_CURRENT_SOURCE_DIR}/../../opencv/install/Release/lib/cmake/opencv4)
endif (CMAKE_BUILD_TYPE MATCHES "Release")

if( OpenCV_FOUND )
list( APPEND ThirdParty_LIBS ${OpenCV_LIBS} )
    include_directories( ${OpenCV_INCLUDE_DIRS} )
endif( OpenCV_FOUND )

include_directories(
    "${CMAKE_SOURCE_DIR}/source"
    "${CMAKE_SOURCE_DIR}"
)

add_executable( ANMS_Codes 
		source/nanoflann.hpp
		source/range-tree/lrtypes.h
		source/range-tree/ranget.h
		source/anms.h
		source/main.cpp )

target_link_libraries( ANMS_Codes ${OpenCV_LIBS} )
