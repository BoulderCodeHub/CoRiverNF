CoRiverNF v2020.0
======================

**1906-2020 Released**

Released 2020 natural flows. No other changes.


CoRiverNF v2019.0
======================

**1906-2019 Released**

This release marks the change in version numbering. Version numbers now indicate the last year of the natural flow data included in the release, e.g., v2019.0 includes natural flows through 2019. Minor version numbers will be used if data are updated and or this package is changed.   

CoRiverNF v0.7.0
======================

**1906-2018 Released**

## Additional changes

* No longer set the time zone to "UTC" when the package is attached. This seemed like a bad practice.
* Minor updates to documentation and vignette.


CoRiverNF v0.6.0
======================

**1906-2017 Released**

CoRiverNF v0.5.0
======================

**1906-2016 Released**

## Behind the hood updates

* Added a `NEWS.md` file to track changes to the package.
* Added tests to ensure structure is correct, dimensions are as expected, and the monthly data correctly sums to annual values. (#9)
* Fixed Rd build warnings by referencing correct .Rd file from CRSSIO (#12)
* Removed dependency on CRSSIO (#14)
* Minor updates to vignette 

CoRiverNF v0.4.1
=====================

## Minor changes and bug fixes

- added `end_year` and `start_year`  as a attributes to the xts matrix (#8)
- `cyAnnInt` data contained the average (1906-2015) and labeled it as 2016; this was removed which fixed (#6 and #7)
    - to do this, switched from xlsx to readxl and dplyr
- added a local only test to make sure that CRSS files created from the excel file match those created by using this package

