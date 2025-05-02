# MPAS 7 regional

Regional MPAS is also known as a "limited-area" simulation. 

Tool for MPAS-Limited-Area is [MPAS-Dev/MPAS-Limited-Area](https://github.com/MPAS-Dev/MPAS-Limited-Area).
I believe this is for either MPAS 7 or MPAS 8.

Following section 4 of [2024 Virtual Tutorial](https://www2.mmm.ucar.edu/projects/mpas/tutorial/Virtual2024/)

Same build environment as in [building MPAS 7](./build-mpas7.md). Remember to 
reload gcc/12.

```
git clone https://github.com/MPAS-Dev/MPAS-Limited-Area.git
cd MPAS-Limited-Area
cp docs/points-examples/japan.ellipse.pts mediterranean.pts
```

Edit the .pts file to cover the Mediterranean.

```
ln -s /glade/campaign/mmm/wmr/mpas_tutorial/meshes/x1.163842.static.nc .
./create_region mediterranean.pts x1.163842.static.nc
```

This creates Mediterranean.static.nc Mediterranean.graph.info


Create a directory regional-mediterranean for your region run. You will need the 
static and graph files. 

```
mkdir regional-mediterranean
mv ..../Mediterranean.static.nc .
mv ..../Mediterranean.graph.info .
```

```
ln -s ../MPAS-Model/init_atmosphere_model .
cp ../MPAS-Model/namelist.init_atmosphere .
cp ../MPAS-Model/streams.init_atmosphere .
ln -s /glade/campaign/mmm/wmr/mpas_tutorial/met_data/CFSV2:2019-09-01_00 .
```

Uses the Metis tool:

Add to your path:  
`export PATH=/glade/campaign/mmm/wmr/mpas_tutorial/metis/bin:${PATH}`

Run the tool:  
gpmetis -minconn -contig -niter=200 Mediterranean.graph.info 128


Run `init_atmosphere_model`:

## 4.2 Interpolating regional initial conditions (ICs)

Namelist settings should be:  
4.2.namelist.init_atmosphere
4.2.streams.init_atmosphere
qsub init_parallel.pbs 


Get underflow & denormal  

## 4.3 Interpolating regional lateral boundary conditions (LBCs)

Namelist settings should be:  
4.3.namelist.init_atmosphere
4.3.streams.init_atmosphere
qsub init_parallel.pbs 

RAN OUT OF TIME WITH 30 MINUTES, changed to 02:00:00
**Runnning MPAS8

## 4.4. Running a regional simulation

4.4.namelist.atmosphere
4.4.streams.atmosphere
qsub run_model.ps
