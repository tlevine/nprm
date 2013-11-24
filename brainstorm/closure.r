# Make sure that scope works as I expect
(function() {
  a <- 8
  b <- function() { print(a) }
  b
})()()
