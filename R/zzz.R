#' @import xts

.onAttach <- function(libname, pkgname){
  packageStartupMessage('CoRiverNF package currently includes 1906-2014 natural flows, published September 20, 2016.')
  Sys.setenv(TZ='UTC')
}
