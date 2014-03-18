set(sscmake_patch_commands 
        ${CMAKE_COMMAND} -E copy_directory ${metis_source} <SOURCE_DIR>/metis &&
        ${CMAKE_COMMAND} -E copy_directory ${SuiteSparse_source} <SOURCE_DIR>/SuiteSparse)
        
if(WIN32)
    set(sscmake_patch_commands ${sscmake_patch_commands} &&
        ${MP_PATCH} -p0 -t -N < "${bfsCeres_PATCH_DIR}/sscmake.patch")
endif(WIN32)

if(${BUILD_SHARED_LIBS})
    set(sscmake_shared_arg "-DSHARED:BOOL=ON" CACHE INTERNAL "")
endif()

ExternalProject_Add(sscmake
    DOWNLOAD_DIR ${download_dir}
    URL ${sscmake_url}
    URL_MD5 ${sscmake_md5}
    PATCH_COMMAND 
		${sscmake_patch_commands}
    CMAKE_CACHE_ARGS
        ${bfsCeres_DEFAULT_ARGS}
        ${sscmake_shared_arg}
        "-DGKLIB_PATH:PATH=<SOURCE_DIR>/metis/GKlib"
        "-DLIB_POSTFIX:STRING="
    DEPENDS metis SuiteSparse)
