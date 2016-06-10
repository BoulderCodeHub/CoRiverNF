#' Monthly Total Natural Flow
#' 
#' A data set containing the monthly total natural flow at 29 locations 
#' in the Colorado River Basin from October 1905 through December 2012. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 1287 rows (months) and 29 columns (locations).
#' All values are in acre-ft.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyInt}}, \code{\link{cyAnnTot}}, \code{\link{cyAnnInt}},
#' \code{\link{wyAnnTot}}, \code{\link{wyAnnInt}}
'monthlyTot'

#' Monthly Intervening Natural Flow
#' 
#' A data set containing the monthly intervening natural flow at 29 locations 
#' in the Colorado River Basin from October 1905 through December 2012.
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 1287 rows (months) and 29 columns (locations).
#' All values are in acre-ft.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyTot}}, \code{\link{cyAnnTot}}, \code{\link{cyAnnInt}},
#' \code{\link{wyAnnTot}}, \code{\link{wyAnnInt}}
'monthlyInt'

#' Calendar Year Total Natural Flow
#' 
#' A data set containing the annual (calendar year) total natural flow at 29 locations 
#' in the Colorado River Basin from 1906 through 2012. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}. 
#' 
#' Summing \code{\link{monthlyTot}} each year from January 1906 through December 2012
#' will equal these data.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 107 rows (years) and 29 columns (locations).
#' All values are in acre-ft. Each value is associated with December of the year.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyTot}}, \code{\link{monthlyInt}}, \code{\link{cyAnnInt}},
#' \code{\link{wyAnnTot}}, \code{\link{wyAnnInt}}
'cyAnnTot'

#' Calendar Year Intervening Natural Flow
#' 
#' A data set containing the annual (calendar year) intervening natural flow at 29 locations 
#' in the Colorado River Basin 1906 through 2012. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}. 
#' 
#' Summing \code{\link{monthlyInt}} each year from January 1906 through December 2012
#' will equal these data.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 107 rows (years) and 29 columns (locations).
#' All values are in acre-ft. Each value is associated with December of the year.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyTot}}, \code{\link{monthlyInt}}, \code{\link{cyAnnTot}},
#' \code{\link{wyAnnTot}}, \code{\link{wyAnnInt}}
'cyAnnInt'

#' Water Year Total Natural Flow
#' 
#' A data set containing the annual (water year [October - September]) total natural flow at 29 locations 
#' in the Colorado River Basinfrom 1906 through 2012. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}. 
#' 
#' Summing \code{\link{monthlyTot}} each water year from October 1905 through September 2012
#' will equal these data.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 107 rows (years) and 29 columns (locations).
#' All values are in acre-ft. Each value is associated with September of the year.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyTot}}, \code{\link{monthlyInt}}, \code{\link{cyAnnInt}},
#' \code{\link{cyAnnTot}}, \code{\link{wyAnnInt}}
'wyAnnTot'

#' Water Year Intervening Natural Flow
#' 
#' A data set containing the annual (water year [October - September]) intervening natural flow at 29 locations 
#' in the Colorado River Basin from 1906 through 2012. 
#' 
#' Natural flow represents the flow that would have  occurred at a location, had 
#' depletions and reservoir regulation not been present upstream of that location. 
#' The total natural flow represents the total flow in the entire basin above a given 
#' gage. The intervening natural flow represents only the flow that originates 
#' upstream of a given gage, but below all upstream gage locations.
#' 
#' The natural flows are recomputed annually and are subject
#' to change without notice. All methods are fully desribed at 
#' \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}. 
#' 
#' Summing \code{\link{monthlyInt}} each water year from October 1905 through September 2012
#' will equal these data.
#' 
#' Each of the 29 locations are represented by one variable (column). The variable
#' names use a shorthand name of each gage location, e.g., \code{LeesFerry} is
#' shorthand for the "Colorado River at Lees Ferry, AZ". See \code{CRSSIO::nfGageNames()}
#' for full gage names, and \code{CRSSIO::nfShortNames()} for the shorthand version used
#' to name the variables in these data.
#' 
#' The data includes xts attributes (\code{xtsAttributes(monthlyTot)}) for the
#' source, the source workbook, and the sheet name the data were created from.
#' 
#' @format An xts matrix with 107 rows (years) and 29 columns (locations).
#' All values are in acre-ft. Each value is associated with September of the year.
#' 
#' @source \url{http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html}
#' 
#' @seealso \code{\link[CRSSIO]{nfShortNames}}, \code{\link[CRSSIO]{nfGageNames}}, 
#' \code{\link{monthlyTot}}, \code{\link{monthlyInt}}, \code{\link{cyAnnInt}},
#' \code{\link{cyAnnTot}}, \code{\link{wyAnnTot}}
'wyAnnInt'
