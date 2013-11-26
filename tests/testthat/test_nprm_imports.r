context("Don't pollute the namespace.")

test_that('RJSONIO should not appear in loadedNamespaces()', {
  expect_that('RJSONIO' %in% loadedNamespaces(), is_false())
})
