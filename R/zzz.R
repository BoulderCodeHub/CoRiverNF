#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage('CoRiverNF package currently includes 1906-2015 natural flows, released August 14, 2017.')
  Sys.setenv(TZ='UTC')
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
