require <- function(name, prefix = 'r-') {

  # Turn the input into a file path.
  if (grepl('/',name)) {
    path <- name
  } else {
    path <- paste('node_modules', paste0(prefix, name), sep = .Platform$file.sep)
  }

  # http://stackoverflow.com/questions/8095294/sourcing-methods-to-an-environment-different-than-globalenv
  env <- new.env()
  eval(parse(file=path), envir=env)
  get('module', envir = env)$exports
}
