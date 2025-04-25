# Building MPAS 8

On Derecho:

module -t list
ncarenv/23.09
craype/2.7.23
gcc/12.2.0
ncarcompilers/1.0.0
cray-mpich/8.1.27
parallel-netcdf/1.12.3
hdf5/1.12.2
netcdf/4.9.2
parallelio/2.6.2

```
module --force purge
module load ncarenv/23.09
module load craype/2.7.23
module load gcc/13.2.0
module load ncarcompilers/1.0.0
module load cray-mpich/8.1.27
module load parallel-netcdf/1.12.3
module load netcdf/4.9.2
module load gcc/12
module load parallelio/2.6.2 
make -j 8 gnu CORE=init_atmosphere 
make clean CORE=atmosphere
make -j 8 gnu CORE=atmosphere_model  
```