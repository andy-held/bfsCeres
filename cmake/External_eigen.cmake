ExternalProject_Add(eigen
    DOWNLOAD_DIR ${download_dir}
    URL ${eigen_url}
    URL_MD5 ${eigen_md5}
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
  )

ExternalProject_Get_Property(eigen source_dir)
set(eigen_INCLUDE_DIR "${source_dir}" CACHE INTERNAL "")
