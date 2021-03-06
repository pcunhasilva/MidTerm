% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fisherRasch.R
\name{fisherRasch}
\alias{ANY-method}
\alias{fisherRasch}
\alias{fisherRasch,}
\title{Fisher Rasch}
\usage{
fisherRasch(raschObj, theta, ...)
}
\arguments{
\item{raschObj}{An object of class Rasch}

\item{theta}{A proposed value of theta}
}
\value{
A numeric vector with Fisher Information for each item given the proposed value of theta
}
\description{
Calculate the Fisher Information for a given value of theta
}
\examples{
set.seed(1235)
Maggie <- new("Rasch", name = "Maggie", 
a = sample(-3:3, size = 7, replace = TRUE),
y = sample(c(0,1), size = 7, replace = TRUE))
fisherRasch(raschObj = Maggie, theta = 2)
}
\author{
Patrick C. Silva: \email{pcunhasilva@wustl.edu}
}

