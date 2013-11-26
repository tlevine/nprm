context("Modules required with nprm.require should not pollute the namespace.")

test_that('RCurl functions should not be exposed after we import treasury.io', {
  expect_that(is.function(nprm.require('treasury.io')), is_true())
  expect_that(exists('getURL'), is_false())
})
