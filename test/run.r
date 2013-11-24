library(testthat)
source('../npm.r')

expect_that(npm.require('./tau'), equals(2 * pi))
expect_that(exists('tau'), equals(FALSE))

expect_that(npm.require('tau'), equals(2 * pi))
expect_that(exists('tau'), equals(FALSE))
