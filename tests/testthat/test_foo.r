#!/usr/bin/env Rscript
# library(nprm)
# source('nprm.r')
# library(testthat)

expect_that('RJSONIO' %in% loadedNamespaces(), is_false())

expect_that(nprm.require('./tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

expect_that(nprm.require('tau'), equals(2 * pi))
expect_that(exists('tau'), is_false())

# expect_that(is.function(nprm.require('treasury.io')), is_true())
# expect_that(exists('getURL'), is_false())
