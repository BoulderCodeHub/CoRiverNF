# script to get monthly and annual, intervening and total natural flow into R.

library(readxl)
library(CRSSIO) # github.com/BoulderCodeHub/CRSSIO
library(xts)
library(devtools)
library(dplyr)
library(magrittr)

# ---------------------------
# USER INPUT
# ---------------------------
# iFile downloaded from:
# http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html
httpSource <- 'http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html'
fName <- "NaturalFlows1906-2020_20221215.xlsx"
startYear <- 1906
endYear <- 2020
iFile <- file.path("data-raw", fName)
# ---------------------------
# END User Input
# ---------------------------

createNFMatrix <- function(sName, timeStep, cy)
{
  # read in the new Excel natural flow spreadsheet
  message("starting to read in ", sName, " worksheet.")

  ymJan1906 <- zoo::as.yearmon("Jan 1906")
  nyrs <- endYear - startYear + 1
  
  if (timeStep == "monthly") {
    skip_rows <- 3
    # add three for OND 1905, and 1 for the row that has the units in it
    n_max <- nyrs * 12 + 4
  } else {
    skip_rows <- 4
    n_max <- nyrs + 1
  }
  
  nf <- read_xlsx(iFile, sheet = sName, skip = skip_rows, n_max = n_max) %>%
    # going to take a lot of trimming, etc. to get rid of all the labels we 
    # don't need for the flow matrix
    dplyr::rename_at(
      .vars = "Natural Flow And Salt Calc model Object.Slot", 
      .funs = function(x) "date"
    ) 
  
  if (timeStep == "monthly")
    nf <- nf %>%
      dplyr::mutate_at("date", .funs = zoo::as.yearmon) %>%
      # get rid of the filler row at top, and the rows containing averages on 
      # bottom
      dplyr::filter_at("date", dplyr::any_vars(!is.na(.)))
  else
    nf <- nf %>%
      filter(date != "Calendar Year", date != "Water Year") %>%
      dplyr::mutate_at("date", .funs = as.numeric) %>%
      dplyr::filter_at("date", dplyr::any_vars(!is.na(.)))
      
   nf <- nf %>%
    dplyr::select(-dplyr::contains("...")) %>%
    dplyr::mutate_if(is.character, as.numeric) %>%
    dplyr::select(-dplyr::matches("date")) %>%
    as.data.frame()
   
   if (ncol(nf) != 29)
     stop("something went wrong and there not 29 columns")
   
   if (timeStep == "monthly" && nrow(nf) != (nyrs * 12 + 3))
     stop("Wrong number of rows")
   
   if (timeStep == "yearly" && nrow(nf) != nyrs)
     stop("Wrong number of rows")
  
  colnames(nf) <- CRSSIO::nf_gage_abbrv()
  
  # make into XTS object
  # set the system time zone to UTC
  Sys.setenv(TZ = 'UTC')
  if(timeStep == 'monthly'){
    # the natural flows start in Oct 1905
    nf.yearMon <- zoo::as.yearmon('1905-10') + seq(0,nrow(nf)-1)/12 
  } else if(timeStep == 'yearly'){
    if(cy){
      nf.yearMon <- zoo::as.yearmon('1906-12') + seq(0,nrow(nf)-1)
    } else{
      # water year ends in September of each year
      nf.yearMon <- zoo::as.yearmon('1906-09') + seq(0, nrow(nf)-1) 
    }
  } else{
    stop('invalid timeStep')
  }
  nfXts <- as.xts(read.zoo(data.frame(nf.yearMon, nf)))
  xtsAttributes(nfXts) <- list(
    source = httpSource, 
    sourceWorkbook = fName, 
    sheetName = sName,
    start_year = startYear,
    end_year = endYear
  )
  nfXts
}

sName <- c('InterveningNaturalFlow','TotalNaturalFlow')
nfMon <- lapply(sName,createNFMatrix, 'monthly',NA)

sName <- c('AnnualCYTotalNaturalFlow', 'AnnualCYIntervNaturalFlow')
nfCYAnn <- lapply(sName,createNFMatrix,'yearly', TRUE)

sName <- c('AnnualWYTotalNaturalFlow', 'AnnualWYIntervNaturalFlow')
nfWYAnn <- lapply(sName,createNFMatrix,'yearly', FALSE)

# save as r data files
monthlyInt = nfMon[[1]]
monthlyTot = nfMon[[2]]
cyAnnTot = nfCYAnn[[1]]
cyAnnInt = nfCYAnn[[2]]
wyAnnTot = nfWYAnn[[1]]
wyAnnInt = nfWYAnn[[2]]

usethis::use_data(monthlyInt, overwrite = TRUE)
usethis::use_data(monthlyTot, overwrite = TRUE)
usethis::use_data(cyAnnTot, overwrite = TRUE)
usethis::use_data(cyAnnInt, overwrite = TRUE)
usethis::use_data(wyAnnTot, overwrite = TRUE)
usethis::use_data(wyAnnInt, overwrite = TRUE)
