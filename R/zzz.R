#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage(
    "CoRiverNF package currently includes 1906-2018 natural flows, released January 10, 2020."
  )
}

release_questions <- function() 
{
  c(
    "Did you run CRSSIO tests with this new package?"
  )
}
