# script to get the monthly and annual, intervening and total natural flow into R.

library(xlsx)
library(CRSSIO) # github.com/BoulderCodeHub/CRSSIO
library(xts)
library(devtools)

# ---------------------------
# USER INPUT
# ---------------------------
# iFile downloaded from http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html
httpSource <- 'http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html'
fName <- 'NaturalFlows1906-2015_withExtensions_8.14.2017.xlsx'
iFile <- file.path('data-raw',fName)
iFile <- file.path("data-raw", fName)
# ---------------------------
# END User Input
# ---------------------------

message('Before running code, be sure to clean up the Annual Worksheets in the Excel file.')
message('In the 1906-2012 data, AnnualCYTotal Natural Flow, column B, row 652 contained data. ',
        'This made the code not work.')

createNFMatrix <- function(sName, timeStep, cy)
{
  # read in the new Excel natural flow spreadsheet
  message('Starting to read in natural flow Excel file. Please be patient this may take several minutes.')

  nf <- xlsx::read.xlsx(iFile, sheetName = sName)
  # going to take a lot of trimming, etc. to get rid of all the labels we don't need for
  # the flow matrix
  message('Finsihed reading in natural flow Excel file.')
  # trim off extraneous data
  # know the first 7 rows are not needed
  nfHead <- as.matrix(nf[1:7,1:31])
  
  nf <- as.matrix(nf[5:(nrow(nf)),2:31]) 
  # remove any rows that are NA since there could be one or more at the bottom of the file
  notNaRows <- which(!is.na(nf[,1]))
  nf <- nf[notNaRows,]
  
  # now remove the bottom row since this is the average for the period
  nf <- nf[1:(nrow(nf)-1),]
  
  # remove gap column
  nf <- matrix(as.numeric(nf[,c(1:20,22:30)]),ncol = 29, byrow = F)
  colnames(nf) <- CRSSIO::nfShortNames()
  
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
  xtsAttributes(nfXts) <- list(source=httpSource, sourceWorkbook=fName, sheetName = sName)
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
cyAnnInt = round(nfCYAnn[[2]], 0) # spreadsheet includes non-rounded values
wyAnnTot = nfWYAnn[[1]]
wyAnnInt = nfWYAnn[[2]]

devtools::use_data(monthlyInt, overwrite = TRUE)
devtools::use_data(monthlyTot, overwrite = TRUE)
devtools::use_data(cyAnnTot, overwrite = TRUE)
devtools::use_data(cyAnnInt, overwrite = TRUE)
devtools::use_data(wyAnnTot, overwrite = TRUE)
devtools::use_data(wyAnnInt, overwrite = TRUE)
