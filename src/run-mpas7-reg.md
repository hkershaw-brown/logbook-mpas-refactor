# MPAS 7 regional

Regional MPAS is also known as a "limited-area" simulation. 

Tool for MPAS-Limited-Area is https://github.com/MPAS-Dev/MPAS-Limited-Area.
I believe this is for either MPAS 7 or MPAS 8.

Following section 4 of https://www2.mmm.ucar.edu/projects/mpas/tutorial/Virtual2024/

Same build environment as in [building MPAS 7](./build-mpas7.md). Remember to 
reload gcc/12.

Uses the Metis tool:

`export PATH=/glade/campaign/mmm/wmr/mpas_tutorial/metis/bin:${PATH}`