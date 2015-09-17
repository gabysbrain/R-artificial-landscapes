library(artificial.landscapes)
context("function sampling")

test_that("cartesian sampling generates the correct shape of samples", {
  expect_equal(dim(cartesian.sample(5, 4)), c(5**4, 4))
})

test_that("sampling a function works as expected", {
  sampled.func <- sample.func("spherical", 10, 5, "lh.sample")
  expect_equal(dim(sampled.func), c(10, 6))
})

