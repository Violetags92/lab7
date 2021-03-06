% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/document.R
\name{predict.ridgereg1}
\alias{predict.ridgereg1}
\title{A method that prints out the fitted values of the ridge regression model, possibly for new data.}
\usage{
\method{predict}{ridgereg1}(x, newdata = "default")
}
\arguments{
\item{x}{A ridgereg object.}

\item{newdata}{Optional.}
}
\value{
a numeric vector.
}
\description{
A method that prints out the fitted values of the ridge regression model, possibly for new data.
}
\examples{
a <- ridgereg1(Petal.Length~Sepal.Width+Sepal.Length, data=iris, lambda=0)
predict(a) # The fitted values
}

