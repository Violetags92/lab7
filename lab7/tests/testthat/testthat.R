context("Ridge Regression")
test_that("Ridge Regression",{
  expect_that(ridgereg(Sepal.Length ~ Species, iris)$coef(), equals(c(5.006, 0.930, 1.582) ))
})