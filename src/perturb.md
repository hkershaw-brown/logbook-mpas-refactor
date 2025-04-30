# Perturb A Single Instance to Make an Ensemble

Used `perturb_single_instance`.  Need to copy a restart to the 50 files, 
then run perturb_single_instance in order for the restart files to have all
the necessary info. 

```
&perturb_single_instance_nml
   ens_size               = 50
   input_files            = init.nc
   output_files           = ''
   output_file_list       = 'restart_files.txt'
   perturbation_amplitude = 0.01
   single_restart_file_in = .false.
  /
```

```
&mpas_vars_nml
   mpas_state_variables = 'theta',                 'QTY_POTENTIAL_TEMPERATURE',
                          'rho',                   'QTY_DENSITY',
                          'uReconstructZonal',     'QTY_U_WIND_COMPONENT',
                          'uReconstructMeridional','QTY_V_WIND_COMPONENT',
                          'w',                     'QTY_VERTICAL_VELOCITY',
                          'qv',                    'QTY_VAPOR_MIXING_RATIO',
                          'surface_pressure',      'QTY_SURFACE_PRESSURE',
   mpas_state_bounds    = 'qv','0.0','NULL','CLAMP',
  /
```

## Differences:

```
nccmp -dfqS init.nc restart0050.nc
Variable               Group  Count         Sum  AbsSum          Min         Max       Range         Mean      StdDev
qv                     /     563275 -0.00707984 0.99817 -1.10413e-05  9.6038e-06 2.06451e-05 -1.25691e-08 2.21788e-06
uReconstructZonal      /     563290     7.25646 6847.97   -0.0674953   0.0780535    0.145549  1.28823e-05    0.015238
uReconstructMeridional /     563304     7.77697 6915.38   -0.0744001   0.0721083    0.146508   1.3806e-05   0.0153901
w                      /     573548   0.0248899 24.7701 -0.000231495 0.000239512 0.000471008  4.33964e-08 5.41325e-05
rho                    /     563239   0.0535826 67.5617 -0.000663405 0.000673205  0.00133661  9.51329e-08 0.000150359
theta                  /     563183     30.3947   28432    -0.279877    0.289856    0.569733  5.39695e-05   0.0632552
surface_pressure       /      10238    -833.113 40291.4     -18.1562     21.8438          40   -0.0813746     4.92951
```