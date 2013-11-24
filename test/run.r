library(testthat)
source('../nprm.r')

expect_that('RJSONIO' %in% loadedNamespaces(), is_false())

expect_that(nprm.require('./tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

expect_that(nprm.require('tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

expect_that(is.function(nprm.require('treasury.io')), is_true())
expect_that(exists('getURL'), is_false())
