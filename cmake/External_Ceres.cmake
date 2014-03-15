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
    DOWNLOAD_DIR ${download_dir}
    URL ${ceres_url}
    URL_MD5 ${ceres_md5}
    CMAKE_CACHE_ARGS 
        ${bfsCeres_DEFAULT_ARGS}
        "-DMINIGLOG:BOOL=ON"
        "-DMETIS_FOUND:BOOL=ON"
        "-DSUITESPARSE_INCLUDE_DIR_HINTS:PATH=${SuiteSparse_INCLUDE_DIR}"
        "-DSUITESPARSE_LIBRARY_DIR_HINTS:PATH=${SuiteSparse_LIBRARY_DIR}"
		"-DEIGEN_INCLUDE_DIR:PATH=${eigen_INCLUDE_DIR}"
        ${CERES_DEFINES}
    DEPENDS sscmake eigen)
