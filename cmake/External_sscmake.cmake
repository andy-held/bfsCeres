set(sscmake_source "${CMAKE_CURRENT_BINARY_DIR}/sscmake")



ExternalProject_Add(sscmake
    DOWNLOAD_DIR ${download_dir}
    SOURCE_DIR ${sscmake_source}
    URL ${sscmake_url}
    URL_MD5 ${sscmake_md5}
    PATCH_COMMAND 
		${MP_PATCH} -p0 -t -N < "${bfsCeres_PATCH_DIR}/sscmake.patch" &&
        ${CMAKE_COMMAND} -E copy_directory ${metis_source} ${sscmake_source}/metis &&
        ${CMAKE_COMMAND} -E copy_directory ${SuiteSparse_source} ${sscmake_source}/SuiteSparse
    CMAKE_CACHE_ARGS
        ${bfsCeres_DEFAULT_ARGS}
        "-DGKLIB_PATH:PATH=${sscmake_source}/metis/GKlib"
        "-DLIB_POSTFIX:STRING="
    DEPENDS metis SuiteSparse)
