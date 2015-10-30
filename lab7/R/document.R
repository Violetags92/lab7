#' A function for ridge regression.
#'
#' @param formula A formula (e.g. y ~ x)
#' @param data data frame
#' @param lambda lambda
#' @return ridgereg object.
#' @examples
#' a <- ridgereg1(Sepal.Length ~ Sepal.Width + Petal.Length, iris, 0)
#' @export
"ridgereg1"



#' A method that prints out the fitted values of the ridge regression model, possibly for new data.
#'
#' @param x A ridgereg object.
#' @param newdata Optional. 
#' @examples
#' a <- ridgereg1(Petal.Length~Sepal.Width+Sepal.Length, data=iris, lambda=0)
#' predict(a) # The fitted values
#' @return a numeric vector.
#' @export
"predict.ridgereg1"


#' Print a ridgereg object
#'
#' @param x A ridgereg object.
#' @examples
#' a <- ridgereg1(Petal.Length~Sepal.Width+Sepal.Length, data=iris, lambda=0)
#' print(a)
#' @return coefficients.
#' @export
"print.ridgereg1"


#' Print the estimated coefficient values of a ridgereg object
#'
#' @param x A ridgereg object.
#' @examples
#' a <- ridgereg1(Petal.Length~Sepal.Width+Sepal.Length, data=iris, lambda=10)
#' coef(a)
#' @return a coefficients values.
#' @export
"coef.ridgereg1"


#' Handling large datasets with dplyr
#' @examples
#' library("dplyr")
#' library("ggplot2")
#' library("nycflights13")
#' visualize_airport_delays()
#' @return A plot.
#' @export
"visualize_airport_delays"