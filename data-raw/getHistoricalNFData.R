# script to get the monthly and annual, intervening and total natural flow into R.

library(readxl)
library(CRSSIO) # github.com/BoulderCodeHub/CRSSIO
library(xts)
library(devtools)
library(dplyr)

# ---------------------------
# USER INPUT
# ---------------------------
# iFile downloaded from http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html
httpSource <- 'http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html'
fName <- 'NaturalFlows1906-2015_withExtensions_8.14.2017.xlsx'
startYear <- 1906
endYear <- 2015
iFile <- file.path("data-raw", fName)
# ---------------------------
# END User Input
# ---------------------------

createNFMatrix <- function(sName, timeStep, cy)
{
  # read in the new Excel natural flow spreadsheet
  message("starting to read in ", sName, " worksheet.")

  ymJan1906 <- zoo::as.yearmon("Jan 1906")
  
  nf <- readxl::read_xlsx(iFile, sheet = sName, skip = 3) %>%
    # going to take a lot of trimming, etc. to get rid of all the labels we don't 
    # need for the flow matrix
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
    dplyr::select(-dplyr::matches("X__1")) %>%
    dplyr::mutate_if(is.character, as.numeric) %>%
    dplyr::select(-dplyr::matches("date")) %>%
    as.data.frame()
  
  colnames(nf) <- CRSSIO::nf_gage_abbrv()
  
  # make into XTS object
  # set the system time zone to UTC
  Sys.setenv(TZ = 'UTC')
  if(timeStep == 'monthly'){
    nf.yearMon <- zoo::as.yearmon('1905-10') + seq(0,nrow(nf)-1)/12 # the natural flows start in Oct 31, 1905
  } else if(timeStep == 'yearly'){
    if(cy){
      nf.yearMon <- zoo::as.yearmon('1906-12') + seq(0,nrow(nf)-1)
    } else{
      nf.yearMon <- zoo::as.yearmon('1906-09') + seq(0, nrow(nf)-1) # water year ends in September of each year
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

sName <- c('Intervening Natural Flow','Total Natural Flow')
nfMon <- lapply(sName,createNFMatrix, 'monthly',NA)

sName <- c('AnnualCYTotal Natural Flow', 'AnnualCYInterv Natural Flow')
nfCYAnn <- lapply(sName,createNFMatrix,'yearly', TRUE)

sName <- c('AnnualWYTotal Natural Flow', 'AnnualWYInterv Natural Flow')
nfWYAnn <- lapply(sName,createNFMatrix,'yearly', FALSE)

# save as r data files
monthlyInt = nfMon[[1]]
monthlyTot = nfMon[[2]]
cyAnnTot = nfCYAnn[[1]]
cyAnnInt = nfCYAnn[[2]]
wyAnnTot = nfWYAnn[[1]]
wyAnnInt = nfWYAnn[[2]]

devtools::use_data(monthlyInt, overwrite = TRUE)
devtools::use_data(monthlyTot, overwrite = TRUE)
devtools::use_data(cyAnnTot, overwrite = TRUE)
devtools::use_data(cyAnnInt, overwrite = TRUE)
devtools::use_data(wyAnnTot, overwrite = TRUE)
devtools::use_data(wyAnnInt, overwrite = TRUE)
