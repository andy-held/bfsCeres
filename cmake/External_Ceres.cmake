if(WIN32)
	set(CERES_DEFINES 
        "-DBLAS_goto2_LIBRARY:FILEPATH=${bfsCeres_INSTALL_PREFIX}/lib/lapack_blas_windows/libblas.lib"
		"-DBLAS_FOUND:BOOL=ON"
        "-DLAPACK_goto2_LIBRARY:FILEPATH=${bfsCeres_INSTALL_PREFIX}/lib/lapack_blas_windows/liblapack.lib"
		"-DLAPACK_FOUND:BOOL=ON"
		"-DSUITESPARSE_CONFIG_LIBRARY:FILEPATH=${SuiteSparse_LIBRARY_DIR}/SuiteSparse_config.lib") # ceres FindSuiteSparse script buggy?
else(WIN32)
	set(CERES_DEFINES
	"-DSUITESPARSE_CONFIG_LIBRARY:FILEPATH=${SuiteSparse_LIBRARY_DIR}/libSuiteSparse_config.a") # ceres FindSuiteSparse script buggy?
endif(WIN32)

ExternalProject_Add(ceres
    GIT_REPOSITORY ${ceres_url}
    PATCH_COMMAND
        ${CMAKE_COMMAND} -E copy_directory ${Gflags_INCLUDE_DIR}/google ${Gflags_INCLUDE_DIR}/gflags #to compensate the nameing of gflags according to its namespace
        ${CMAKE_COMMAND} -E copy ${Gflags_LIBRARY_DIR}/libgflags_nothreads.a ${Gflags_LIBRARY_DIR}/libgflags.a # only necessary right now, until the gflags-cmake branch is fixed
    CMAKE_CACHE_ARGS 
        ${bfsCeres_DEFAULT_ARGS}
        "-DMETIS_FOUND:BOOL=ON"
        "-DSUITESPARSE_INCLUDE_DIR_HINTS:PATH=${SuiteSparse_INCLUDE_DIR}"
        "-DSUITESPARSE_LIBRARY_DIR_HINTS:PATH=${SuiteSparse_LIBRARY_DIR}"
		"-DEIGEN_INCLUDE_DIR:PATH=${eigen_INCLUDE_DIR}"
		"-DGFLAGS_INCLUDE_HINTS:PATH=${Gflags_INCLUDE_DIR}"
		"-DGFLAGS_LIBRARY_HINTS:PATH=${Gflags_LIBRARY_DIR}"
        "-DGLOG_INCLUDE_DIR_HINTS:PATH=${glog_INCLUDE_DIR}"
        "-DGLOG_LIBRARY_DIR_HINTS:PATH=${glog_LIBRARY_DIR}"
        ${CERES_DEFINES}
    DEPENDS glog Gflags sscmake eigen)
