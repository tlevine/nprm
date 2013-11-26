library(RJSONIO)
unloadNamespace('RJSONIO')

# Given the directory of a package, find the main file.
.main <- function(directory) {
  package.json <- file.path(directory, 'package.json')
  readChar(package.json, file.info(package.json)$size) 
  package <- RJSONIO::fromJSON(package.json)
  main <- file.path(directory, package$main)
  main
}

nprm.require <- function(name, prefix = 'r-') {

  # Turn the input into a file path.
  if (grepl('/',name)) {
    # Relative path
    if (file.info(name)$isdir) {
      # Path to a package directory
      main <- .main(name)
    } else {
      # Path to a file
      main <- name
    }
  } else {
    # Absolute package name
    main <- .main(file.path('node_modules', paste0(prefix, name)))
  }

  # http://stackoverflow.com/questions/8095294/sourcing-methods-to-an-environment-different-than-globalenv
  env <- new.env()
  eval(module <- list(), envir=env)
  eval(parse(file=main), envir=env)
  get('module.exports', envir = env)
}
