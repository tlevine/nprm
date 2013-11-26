context('Requiring file with a path')

test_that('I can require ./tau.r', {
  expect_that(nprm.require('./tau.r'), equals(2 * pi))
  expect_that(exists('tau'), is_false())
})
