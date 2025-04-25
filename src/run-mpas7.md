# Running MPAS 7

The tutorial run_in

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