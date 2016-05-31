# script to get the monthly and annual, intervening and total natural flow into R.

library(xlsx)

# ---------------------------
# USER INPUT
# ---------------------------
# iFile downloaded from http://www.usbr.gov/lc/region/g4000/NaturalFlow/current.html
iFile <- 'data-raw/NaturalFlows1906-2012_withExtensions_1.8.15.xlsx'
# ---------------------------
# END User Input
# ---------------------------

# need to either: modify createNFMatrix function to take in timestep as an argument and be
# able to handle the annual data sheets, or create the annual data from the monthly data

createNFMatrix <- function(sName)
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
  nf.yearMon <- zoo::as.yearmon('1905-10') + seq(0,nrow(nf)-1)/12 # the natural flows start in Jan 31, 1906
  nfXts <- as.xts(read.zoo(data.frame(nf.yearMon, nf)))
}

sName <- c('Intervening Natural Flow','Total Natural Flow')

nf <- lapply(sName,createNFMatrix)
