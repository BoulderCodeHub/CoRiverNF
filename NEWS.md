CoRiverNF v0.4.1.9000
======================

*In development*

* Added a `NEWS.md` file to track changes to the package.

CoRiverNF v0.4.1
=====================

## Minor changes and bug fixes

- added `end_year` and `start_year`  as a attributes to the xts matrix (#8)
- `cyAnnInt` data contained the average (1906-2015) and labeled it as 2016; this was removed which fixed (#6 and #7)
    - to do this, switched from xlsx to readxl and dplyr
- added a local only test to make sure that CRSS files created from the excel file match those created by using this package

