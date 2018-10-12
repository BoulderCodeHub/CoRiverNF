#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    "CoRiverNF package currently includes 1906-2016 natural flows, released September 28, 2018."
  )
  Sys.setenv(TZ='UTC')
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
