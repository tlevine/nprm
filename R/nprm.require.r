#' Load R code with npm
#'
#' @param The name of the packages
#'
#' @return
#' The package exports
#'
#' @export
#'
#' @examples
#' nprm.requrire('treasury.io')

library(RJSONIO)
unloadNamespace('RJSONIO')

nprm.require <- function(name, prefix = 'r-') {

  # Turn the input into a file path.
  if (grepl('/',name)) {
    # Relative path
    dir <- '.'
    if (file.info(name)$isdir) {
      # Path to a package directory
      main <- .main(name)
    } else {
      # Path to a file
      main <- name
    }
  } else {
    # Absolute package name
    dir <- file.path('node_modules', paste0(prefix, name))
    main <- .main(dir)
  }

  prevwd <- getwd()
  setwd(dir)

  # http://stackoverflow.com/questions/8095294/sourcing-methods-to-an-environment-different-than-globalenv
  env <- new.env()
  eval(parse(file=main), envir=env)
  get('exports', envir = env)

  setwd(prevwd)
}

# Given the directory of a package, find the main file.
.main <- function(directory) {
  package.json <- file.path(directory, 'package.json')
  readChar(package.json, file.info(package.json)$size) 
  package <- RJSONIO::fromJSON(package.json)
  package$main
}
