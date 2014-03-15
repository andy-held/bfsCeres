## Build-from-scratch Ceres
![logo](https://www.igd.fraunhofer.de/sites/default/files/yaml_3col_standard_logo.gif)

Andreas Franek 2014.02.17

### Multi-platform build system for building ceres from scratch.

| System    | Dependencies          | Status |
|-----------|-----------------------|--------|
| Linux     | BLAS, LAPACK, CMake   | Working |
| Windows   | Git, CMake            | (see [Windows specifics](#windows specifics)) |
| Mac OSX   | BLAS, LAPACK, CMake   | Untested |

Using the following open source projects:
* eigen:                          http://eigen.tuxfamily.org/
* Metis:                          http://glaros.dtc.umn.edu/gkhome/metis/metis/changes
* SuiteSparse:                    http://www.cise.ufl.edu/research/sparse/SuiteSparse/
* suitesparse-metis-for-windows:  https://github.com/jlblancoc/suitesparse-metis-for-windows
* Ceres:                          https://code.google.com/p/ceres-solver/

### How to build

#### Linux/Mac
```bash
git clone https://github.com/andy-held/bfsCeres.git bfsCeres
cd bfsCeres
mkdir build
cd build
cmake .. # or 'cmake-gui' if you want to change build settings
make
```
####Windows
* Install 'Git for Windows' and 'CMake'
* clone this project
* create a 'build' folder in the bfsCeres directory
* execute CMake in the build directory, setting your Visual Studio version
* open the created .sln in the build directory
* in VS, set the build type to Release
* press F6 to build

### Windows specifics

On windows you need to have Git for Windows installed because patch is needed for this build system. The script will search for the Git patch command in C:/Program Files/Git/bin and C:/Program Files(x86)/Git/bin . If you have installed Git anywhere else or want to use another patch command, please make MP_PATCH in cmake point to that patch command.
Also note, that, on windows, only Release builds will work (the ceres cmake system will not find the SuiteSparse Debug libs yet).
