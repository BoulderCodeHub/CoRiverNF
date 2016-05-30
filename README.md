## CoRiverNF
A data only R package containing natural flow data for the Colorado River Basin. Data is included at the natural flow basin nodal level used by the Colorado River Simulation (CRSS).

The package is a convenient way to access the Colorado River Natural Flow data available [here](http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html). Every effort will be made to update the package to include the most recent natural flow data.

__The current data is based on the 1906-2012 natural flow data with a data of January 8, 2015.__

## Using in R

The data can be accessed by installing this package from GitHub:

```
if(!require(devtools)){
    install.packages('devtools')
    library(devtools)
}
devtools::install_github('BoulderCodeHub/CoRiverNF')
```

## Log:

- 2016-06-xx: version 0.1 ready for use
