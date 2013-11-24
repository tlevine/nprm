library(testthat)
source('../npm.r')

expect_that(npm.require('./tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

expect_that(npm.require('tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

expect_that(is.function(npm.require('treasury.io')), is_true())
expect_that(exists('getURL'), is_false())
