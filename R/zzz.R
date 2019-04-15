#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    "CoRiverNF package currently includes 1906-2017 natural flows, released March 18, 2019."
  )
  Sys.setenv(TZ='UTC')
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
