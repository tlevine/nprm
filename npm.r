library(RJSONIO)

npm.require <- function(name, prefix = 'r-') {

  # Turn the input into a file path.
  if (grepl('/',name)) {
    main <- name
  } else {
    directory <- file.path('node_modules', paste0(prefix, name))
    package.json <- file.path(directory, 'package.json')
    package <- fromJSON(package.json)
    main <- file.path(directory, package$main)
    readChar(main, file.info(main)$size) 
  }

  # http://stackoverflow.com/questions/8095294/sourcing-methods-to-an-environment-different-than-globalenv
  env <- new.env()
  eval(module <- list(), envir=env)
  eval(parse(file=main), envir=env)
  get('module', envir = env)$exports
}
