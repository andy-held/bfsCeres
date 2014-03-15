ExternalProject_Add(metis
    DOWNLOAD_DIR ${download_dir}
    URL ${metis_url}
    URL_MD5 ${metis_md5}
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    )
    
ExternalProject_Get_Property(metis source_dir)
set(metis_source "${source_dir}" CACHE INTERNAL "")