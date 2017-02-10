## CoRiverNF

[![Travis-CI Build Status](https://travis-ci.org/rabutler/CoRiverNF.svg?branch=master)](https://travis-ci.org/rabutler/CoRiverNF)

A data only R package containing natural flow data for the Colorado River Basin. Data is included at the natural flow basin nodal level used by the Colorado River Simulation (CRSS).

The package is a convenient way to access the Colorado River Natural Flow data available [here](http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html). Every effort will be made to update the package to include the most recent natural flow data.

__The current data is based on the 1906-2014 natural flow data with a data of September 20, 2016.__

## Using in R

The data can be accessed by installing this package from GitHub:

```
if(!require(devtools)){
    install.packages('devtools')
    library(devtools)
}
devtools::install_github('BoulderCodeHub/CoRiverNF')
```

The package includes monthly, calendary year, and water year data for total and intervening natural flow in 6 data sets:

- `monthlyTot`
- `monthlyInt`
- `cyAnnTot`
- `cyAnnInt`
- `wyAnnTot`
- `wyAnnInt`

You can easily access these data using natural flow node shorthand names, and the methods used by `xts` objects to subset time series data. For example, the 2000-2012 data at Lees Ferry can be accessed with `cyAnnTot$LeesFerry['2000/']`. For more examples see the vignette: `vignette('CoRivNatFlow', package = 'CoRiverNF')`.

## Reproducing the Data

The included data can be recreated by downloading the package code, or copying the code and Excel file located in [`data-raw`](data-raw).

To run the code, edit the path to the Excel file located in the "User Input" section of the `getHistoricalNFData.R` file and then source that file. 

## Log

- 2017-02-10: version 0.3 available - updated to 1906 - 2014 data
- 2016-10-18: version 0.2 available
- 2016-06-16: version 0.1 ready for use
