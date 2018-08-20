#' Monthly and Annual; Total and Intervening Natural Flow
#' 
#' A data set containing the monthly and annual; total and intervening natural 
#' flow at 29 locations in the Colorado River Basin from October 1905 through 
#' December 2015. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' <http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html>.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., `"LeesFerry"` is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See [CRSSIO::nf_gage_names()]
#' for full gage names, and [CRSSIO::nf_gage_abbrv()] for the shorthand version used
#' to name the variables in these data.
#' 
#' The monthly data will sum to equal the annual data for each location as follows:
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
#' @format An xts matrix with 1323 (monthly data) or 110 (annual data) rows 
#' and 29 columns (locations). All values are in acre-ft. For annual data, each 
#' value is associated with December of the year for calendar year data and 
#' September of the year for water year data.
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
