#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    "CoRiverNF package currently includes 1906-2019 natural flows, released April 20, 2021."
  )
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
