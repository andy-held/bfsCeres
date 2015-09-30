unset(projects)

# Eigen
list(APPEND projects eigen)
set(eigen_version "3.2.0")
set(eigen_url "http://bitbucket.org/eigen/eigen/get/${eigen_version}.tar.gz")
set(eigen_md5 "9559c34af203dde5f3f1d976d859c5b3")

list(APPEND projects metis)
set(metis_version "5.0.1")
set(metis_url "http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-${metis_version}.tar.gz")
set(metis_md5 "6daba5e64ed86d46e038437eda720532")

list(APPEND projects SuiteSparse)
set(SuiteSparse_version "4.2.1")
set(SuiteSparse_url "http://ftp.mcs.anl.gov/pub/petsc/externalpackages/SuiteSparse-${SuiteSparse_version}.tar.gz")
set(SuiteSparse_md5 "4628df9eeae10ae5f0c486f1ac982fce")

list(APPEND projects sscmake)
set(sscmake_version "1.1.0")
set(sscmake_url https://github.com/jlblancoc/suitesparse-metis-for-windows/releases/download/v${sscmake_version}/suitesparse-metis-for-windows-${sscmake_version}.tar.gz)
set(sscmake_md5 d5426f450d1310e5bf42482ba5774eec)

list(APPEND projects ceres)
set(ceres_version "1.8.0")
set(ceres_url http://ceres-solver.googlecode.com/files/ceres-solver-${ceres_version}.tar.gz)
set(ceres_md5 bb23731db88b789476b615ff5b850837)

