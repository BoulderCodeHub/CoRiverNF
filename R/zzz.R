#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    "CoRiverNF package currently includes 1906-2020 natural flows, released April 19, 2023."
  )
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
