context("Ridge Regression")
test_that("Ridge Regression",{
  a <- ridgereg1(Sepal.Length ~ Species, iris)
  expect_that(class(coef(a)), equals("numeric"))
})