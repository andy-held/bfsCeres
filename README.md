## Build-from-scratch Ceres
![logo](https://www.igd.fraunhofer.de/sites/default/files/yaml_3col_standard_logo.gif)

Andreas Franek 2014.02.17

### Multi-platform build system for building ceres from scratch.

Works on:                   Dependencies
* Linux                   BLAS, LAPACK
* Windows (partly)        Git
* Mac OSX (untested)      BLAS, LAPACK

Using the following open source projects:
* eigen:                          http://eigen.tuxfamily.org/
* Metis:                          http://glaros.dtc.umn.edu/gkhome/metis/metis/changes
* SuiteSparse:                    http://www.cise.ufl.edu/research/sparse/SuiteSparse/
* suitesparse-metis-for-windows:  https://github.com/jlblancoc/suitesparse-metis-for-windows
* Ceres:                          https://code.google.com/p/ceres-solver/

### Dependencies on Windows

On windows you need to have Git for Windows installed because patch is needed for this build system. The script will search for the Git patch command in C:/Program Files/Git/bin and C:/Program Files(x86)/Git/bin . If you have installed Git anywhere else or want to use another patch command, please make MP_PATCH in cmake point to that patch command.
Also note, that, on windows, only Release builds will work (the ceres cmake system will not find the SuiteSparse Debug libs yet).
