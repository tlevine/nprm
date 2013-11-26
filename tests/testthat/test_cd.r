context("The directory should change for relative file reads within requires")

test_that('I can read the dummy csv in a required package', {
  dummy <- nprm.require('dummy.csv')
  expect_that(is.data.frame(dummy), is_true())
})
