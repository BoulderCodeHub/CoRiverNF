#' CoRiverNF: A data only package containing natural flow data for the Colorado River Basin
#' 
#' The CoRiverNF package provides total and intervening natural flow data for 29 locations 
#' in the Colorado River Basin.  
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations. 
#' 
#' The package provides 6 differnt data sets:
#' \itemize{
#'   \item monthly total natural flow (\code{\link{monthlyTot}})
#'   \item monthly intervening natural flow (\code{\link{monthlyInt}})
#'   \item calendar year total natural flow (\code{\link{cyAnnTot}})
#'   \item calendar year intervening natural flow (\code{\link{cyAnnInt}})
#'   \item water year total natural flow (\code{\link{wyAnnTot}})
#'   \item water year intervening natural flow (\code{\link{wyAnnInt}})
#' }
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @docType package
#' @name CoRiverNF
NULL
