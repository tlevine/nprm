context('Requiring file with a path')

test_that('I can require ./node_modules/r-tau', {
  expect_that(nprm.require('./node_modules/r-tau'), equals(2 * pi))
})
