ExternalProject_Add(Gflags
    GIT_REPOSITORY ${Gflags_url}
    GIT_TAG ${Gflags_git_tag}
    CMAKE_CACHE_ARGS 
        ${bfsCeres_DEFAULT_ARGS}
    )
    
set(Gflags_INCLUDE_DIR ${bfsCeres_INSTALL_PREFIX}/include/gflags)
set(Gflags_LIBRARY_DIR ${bfsCeres_INSTALL_PREFIX}/lib)