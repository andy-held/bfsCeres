if(WIN32)
else(WIN32)
    set(glog_configure_cmd <SOURCE_DIR>/configure
    --prefix=${bfsCeres_INSTALL_PREFIX}
    --with-gflags=${bfsCeres_INSTALL_PREFIX} CACHE INTERNAL "")
    set(glog_build_cmd make CACHE INTERNAL "")
    set(glog_install_cmd make install CACHE INTERNAL "")
endif(WIN32)

ExternalProject_Add(glog
    DOWNLOAD_DIR ${download_dir}
    URL ${glog_url}
    URL_MD5 ${glog_md5}
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ${glog_configure_cmd}
    BUILD_COMMAND ${glog_build_cmd}
    INSTALL_COMMAND ${glog_install_cmd}
    CMAKE_CACHE_ARGS
        ${bfsCeres_DEFAULT_ARGS}
    DEPENDS Gflags)
        
set(glog_INCLUDE_DIR ${bfsCeres_INSTALL_PREFIX}/include/glog)
set(glog_LIBRARY_DIR ${bfsCeres_INSTALL_PREFIX}/lib)
