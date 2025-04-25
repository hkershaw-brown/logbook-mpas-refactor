# Building MPAS 7

On Derecho:


Following 2024 MPAS Tutorial


```
module --force purge
module load ncarenv/23.09
module load craype/2.7.23
module load ncarcompilers/1.0.0
module load cray-mpich/8.1.27
module load parallel-netcdf/1.12.3
module load netcdf/4.9.2
module load parallelio
module load gcc/12
```

Added `-fallow-argument-mismatch` flag to makefile for gfortran

```diff
diff --git a/Makefile b/Makefile
index 9b84f0c01..26fb4d534 100644
--- a/Makefile
+++ b/Makefile
@@ -218,12 +218,12 @@ gfortran:
        "FC_SERIAL = gfortran" \
        "CC_SERIAL = gcc" \
        "CXX_SERIAL = g++" \
-       "FFLAGS_PROMOTION = -fdefault-real-8 -fdefault-double-8" \
-       "FFLAGS_OPT = -O3 -ffree-line-length-none -fconvert=big-endian -ffree-form" \
+       "FFLAGS_PROMOTION = -fallow-argument-mismatch -fdefault-real-8 -fdefault-double-8" \
+       "FFLAGS_OPT = -fallow-argument-mismatch -O3 -ffree-line-length-none -fconvert=big-endian -ffree-form" \
        "CFLAGS_OPT = -O3" \
        "CXXFLAGS_OPT = -O3" \
        "LDFLAGS_OPT = -O3" \
-       "FFLAGS_DEBUG = -g -ffree-line-length-none -fconvert=big-endian -ffree-form -fcheck=all -fbacktrace -ffpe-trap=invalid,zero,overflow" \
+       "FFLAGS_DEBUG = -fallow-argument-mismatch -g -ffree-line-length-none -fconvert=big-endian -ffree-form -fcheck=all -fbacktrace -ffpe-trap=invalid,zero,overflow" \
        "CFLAGS_DEBUG = -g" \
        "CXXFLAGS_DEBUG = -g" \
        "LDFLAGS_DEBUG = -g" \
```

Compiled with:

```
make CORE=init_atmosphere clean
make -j 8 gfortran CORE=init_atmosphere USE_PIO2=true 
```

```
make clean CORE=init_atmosphere_model
make -j 8 gfortran CORE=atmosphere USE_PIO2=true 
```

```
module load conda
conda activate npl
export PYTHONPATH=/glade/campaign/mmm/wmr/mpas_tutorial/python_scripts
module load ncview
```

