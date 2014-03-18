cmake_minimum_required(VERSION 2.8)
project(bfsCeres)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

include(BuildType)

if(WIN32)
    find_program(MP_PATCH patch "C:/Program Files (x86)/Git/bin/" "C:/Program Files/Git/bin")
    if(NOT EXISTS ${MP_PATCH})
        message(FATAL_ERROR "bfsCeres needs patch command line tool. You can simply install Git for windows and enter the patch command that comes with it in MP_PATCH")
    endif()
else(WIN32)
	set(MP_PATCH patch CACHE STRING "The patch command on your system")
endif(WIN32)

include(ExternalProject)
include(projects)
include(setDownloadDir)
set(bfsCeres_PATCH_DIR "${bfsCeres_SOURCE_DIR}/thirdparty/patches")
option(BUILD_SHARED_LIBS "Should shared libs be built?" ON)

set(bfsCeres_INSTALL_PREFIX "${bfsCeres_BINARY_DIR}/install")
set(bfsCeres_DEFAULT_ARGS
    "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}"
    "-DCMAKE_PREFIX_PATH:PATH=${bfsCeres_INSTALL_PREFIX}"
    "-DCMAKE_INSTALL_PREFIX:PATH=${bfsCeres_INSTALL_PREFIX}")
 
# If there is a CMAKE_BUILD_TYPE it is important to ensure it is passed down.
if(CMAKE_BUILD_TYPE)
    list(APPEND bfsCeres_DEFAULT_ARGS "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}")
endif()

if(${BUILD_SHARED_LIBS})
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
    #list(APPEND bfsCeres_DEFAULT_ARGS "-DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}")
endif()

add_subdirectory(thirdparty)

