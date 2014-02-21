set(metis_source  "${CMAKE_CURRENT_BINARY_DIR}/metis")

ExternalProject_Add(metis
    DOWNLOAD_DIR ${download_dir}
    SOURCE_DIR ${metis_source}
    URL ${metis_url}
    URL_MD5 ${metis_md5}
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    )
