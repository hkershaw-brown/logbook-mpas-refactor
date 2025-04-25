# Running MPAS 7

The tutorial init_real.pbs errors out if you use multiple processors.

```
----------------------------------------------------------------------
Beginning MPAS-init_atmosphere Error Log File for task      15 of      16
    Opened at 2024/10/07 13:06:21
----------------------------------------------------------------------

ERROR: ****************************************************************
ERROR: Error: Interpolation of static fields does not work in parallel.
ERROR: Please run the static_interp step using only a single MPI task.
CRITICAL ERROR: ****************************************************************
Logging complete.  Closing file at 2024/10/07 13:06:21
```

So run with 1 mpi process

## Namelists corresponding to sections of tutorial

### 1.3 Static, terrestrial field processing
1.3.namelist.init_atmosphere  
1.3.streams.init_atmosphere  
init_real.pbs

### 2.1 Interpolating real-data initial condition
2.1.namelist.init_atmosphere  
2.1.streams.init_atmosphere  
init_real.pbs

### 2.2 Generating SST and sea-ice update files
2.2.namelist.init_atmosphere  
2.2.streams.init_atmosphere  
init_real.pbs

### 2.3 model integration 
namelist.atmosphere  
run_model.pbs

    