% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GenTab2.R
\name{GenTab2}
\alias{GenTab2}
\title{Two-way contingency table r x c  - generation}
\usage{
GenTab2(pij, n)
}
\arguments{
\item{pij}{a numeric matrix with non-negative probability values of the two-way contingency table}

\item{n}{a sample size}
}
\value{
The function returns the two-way contingency table r x c
}
\description{
Generating a two-way contingency table r x c
}
\details{
Generating a two-way contingency table r x c using the probability matrix pij.
If Ho is true then pij equals 1 / r / c.
}
\examples{
r = 6; c = 2
GenTab2(array(1 / r / c, dim = c(r, c)), 93)
GenTab2(matrix(c(0.125,0.25,0.25,0.375), nrow=2), 100)

}
\references{
{Sulewski, P. (2016). \emph{Moc testów niezależności w tablicy dwudzielczej większej niż 2×2,} Przegląd statystyczny 63(2), 190-210}
}
\author{
Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
}
