#' Monthly and Annual; Total and Intervening Natural Flow
#' 
#' A data set containing the monthly and annual; total and intervening natural 
#' flow at 29 locations in the Colorado River Basin beginning in October 1905. 
#' The data go through December of the last year of computed natural flows. 
#' Typically, natural flows are released on a two year delay, i.e., natural 
#' flow through 2018 is released in 2020. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that 
#' location. The total natural flow represents the total flow in the entire 
#' basin above a given gage. The intervening natural flow represents only the 
#' flow that originates upstream of a given gage, but below all upstream gage 
#' locations.
#' 
#' The natural flows are recomputed annually and are subject to change without 
#' notice. All methods are fully desribed at 
#' <http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html>.
#' 
#' Each of the 29 locations are represented by one variable (column). The 
#' variable names use a shorthand name of each gage location, e.g., 
#' `"LeesFerry"` is shorthand for the "Colorado River at Lees Ferry, AZ". See 
#' the "CoRivNatFlow" vignette for a list of the full gage names and their 
#' respective shorthand versions.
#' 
#' The monthly data will sum to equal the annual data for each location as 
#' follows:
#' 
#' * Summing `monthlyTot` each year from January through December
#'   will equal `cyAnnTot`
#' * Summing `monthlyInt` each year from January through December 
#'   will equal `cyAnnInt`
#' * Summing `monthlyTot` each water year from October through 
#'   September of the following year will equal `wyAnnTot`
#' * Summing `monthlyInt` each water year from October through 
#'   September of the following year will equal `wyAnnInt`
#' 
#' The data include xts attributes (ex: `xtsAttributes(monthlyTot)`) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 29 columns (locations). Annual data include
#' n-years rows, where n-years are the number of years in the natural flow 
#' record. Monthly data include (n-years * 12) + 3 rows. All values are in 
#' acre-feet. For annual data, each value is associated with December of the 
#' year for calendar year data and September of the year for water year data.
#' 
#' @source <http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html>
'monthlyTot'

#' @rdname monthlyTot
'monthlyInt'

#' @rdname monthlyTot
'cyAnnTot'

#' @rdname monthlyTot
'cyAnnInt'

#' @rdname monthlyTot
'wyAnnTot'

#' @rdname monthlyTot
'wyAnnInt'
