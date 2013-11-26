context("Recursive requires should work")

test_that('I can require to one level of recursion', {
  foo <- nprm.require('foo')
  expect_that(is.data.frame(foo), is_true())
})
