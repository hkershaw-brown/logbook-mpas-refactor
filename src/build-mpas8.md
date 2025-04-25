# Building MPAS 8

On Derecho:

```
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

Requires change to Registry.xml to output uv reconstructed:

```diff
diff --git a/src/core_atmosphere/Registry.xml b/src/core_atmosphere/Registry.xml
index 637859679..85bde7e66 100644
--- a/src/core_atmosphere/Registry.xml
+++ b/src/core_atmosphere/Registry.xml
@@ -592,6 +592,8 @@
                        <var name="xtime"/>
                        <var name="Time"/>
                        <var name="u"/>
+                        <var name="uReconstructZonal"/>
+                        <var name="uReconstructMeridional"/>
                        <var name="w"/>
                        <var name="rho_zz"/>
                        <var name="theta_m"/>
diff --git a/src/core_init_atmosphere/Registry.xml b/src/core_init_atmosphere/Registry.xml
index 778b64c05..8984f8fa3 100644
--- a/src/core_init_atmosphere/Registry.xml
+++ b/src/core_init_atmosphere/Registry.xml
@@ -572,6 +572,8 @@
                         <var name="qv_init" packages="met_stage_out"/>
                         <var_array name="scalars" packages="met_stage_out;mp_thompson_aers_in"/>
                         <var name="u" packages="met_stage_out"/>
+                        <var name="uReconstructZonal" packages="met_stage_out"/>
+                        <var name="uReconstructMeridional" packages="met_stage_out"/>
                         <var name="w" packages="met_stage_out"/>
                         <var name="dz" packages="met_stage_out"/>
                         <var name="dzs" packages="met_stage_out"/>
```


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
make -j 8 gnu CORE=atmosphere  
```