ExternalProject_Add(glog
    DOWNLOAD_DIR ${download_dir}
    URL ${glog_url}
    URL_MD5 ${glog_md5}
    CMAKE_CACHE_ARGS
        ${bfsCeres_DEFAULT_ARGS})
        
set(glog_INCLUDE_DIR ${bfsCeres_INSTALL_PREFIX}/include/glog)
set(glog_LIBRARY_DIR ${bfsCeres_INSTALL_PREFIX}/lib)