set(SuiteSparse_source  "${CMAKE_CURRENT_BINARY_DIR}/SuiteSparse")

ExternalProject_Add(SuiteSparse
    DOWNLOAD_DIR ${download_dir}
    SOURCE_DIR ${SuiteSparse_source}
    URL ${SuiteSparse_url}
    URL_MD5 ${SuiteSparse_md5}
    PATCH_COMMAND ${MP_PATCH} -p2 -t -N < "${bfsCeres_PATCH_DIR}/metis.patch"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    )

set(SuiteSparse_INCLUDE_DIR ${bfsCeres_INSTALL_PREFIX}/include/suitesparse)
set(SuiteSparse_LIBRARY_DIR ${bfsCeres_INSTALL_PREFIX}/lib)
