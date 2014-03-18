if(WIN32)
    set(Gflags_cmake_args
        "-DGFLAGS_NAMESPACE:STRING=google"
        "-DBUILD_TESTING:BOOL=OFF" CACHE INTERNAL "")
else(WIN32)
    set(Gflags_cmake_args
        "-DGFLAGS_NAMESPACE:STRING=google"
        "-DGFLAGS_INTTYPES_FORMAT:STRING=C99"
        "-DBUILD_TESTING:BOOL=OFF" CACHE INTERNAL "")
endif(WIN32)

ExternalProject_Add(Gflags
    GIT_REPOSITORY ${Gflags_url}
    GIT_TAG ${Gflags_git_tag}
    CMAKE_CACHE_ARGS 
        ${bfsCeres_DEFAULT_ARGS}
        ${Gflags_cmake_args}
    )
    
set(Gflags_INCLUDE_DIR ${bfsCeres_INSTALL_PREFIX}/include)
set(Gflags_LIBRARY_DIR ${bfsCeres_INSTALL_PREFIX}/lib)
