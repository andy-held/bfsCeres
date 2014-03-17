option(USE_SYSTEM_CERES "Should we use the system ceres?" OFF)
option(USE_SYSTEM_METIS "Should we use the system metis?" OFF)
option(USE_SYSTEM_SUITESPARSE "Should we use the system Suitesparse?" OFF)
option(USE_SYSTEM_EIGEN "Should we use the system Eigen?" OFF)
option(USE_SYSTEM_GFLAGS "Should we use the system Eigen?" OFF)

if(USE_SYSTEM_EIGEN)
  find_package(Eigen3 REQUIRED)
  list(APPEND bfsCeres_THIRDPARTYLIBS_ARGS
    "-DEIGEN3_INCLUDE_DIR:PATH=${EIGEN3_INCLUDE_DIR}")
else()
  include(External_eigen)
endif()

if(USE_SYSTEM_SUITESPARSE)
  find_package(SuiteSparse REQUIRED)
  list(APPEND bfsCeres_THIRDPARTYLIBS_ARGS
    "-DSuiteSparse_INCLUDE_DIR:PATH=${SuiteSparse_INCLUDE_DIR}"
    "-DSuiteSparse_LIBRARY_DIR:PATH=${SuiteSparse_LIBRARYDIR}")
else()
  include(External_metis)
  include(External_SuiteSparse)
  include(External_sscmake)
endif()

if(USE_SYSTEM_GFLAGS)
  find_package(Gflags REQUIRED)
  list(APPEND bfsCeres_THIRDPARTYLIBS_ARGS
    "-DGflags_INCLUDE_DIR:PATH=${Gflags_INCLUDE_DIR}"
    "-DGflags_LIBRARY_DIR:PATH=${Gflags_LIBRARYDIR}")
else()
  include(External_Gflags)
endif()

if(USE_SYSTEM_CERES)
  find_package(Ceres REQUIRED)
  list(APPEND bfsCeres_THIRDPARTYLIBS_ARGS
    "-DCeres_INCLUDE_DIR:PATH=${Ceres_INCLUDE_DIR}"
    "-DCeres_LIBRARY_DIR:PATH=${Ceres_LIBRARYDIR}")
else()
  include(External_Ceres)
endif()
