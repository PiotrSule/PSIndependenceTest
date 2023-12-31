% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Lms4.test.R
\name{Lms4.test}
\alias{Lms4.test}
\title{Logarithmic minimum test for independence in four-way contingency table}
\usage{
Lms4.test(nijtu, B = 10000)
}
\arguments{
\item{nijtu}{a numeric matrix with non-negative values of the four-way contingency table cells}

\item{B}{an integer specifying the number of replicates used in the Monte Carlo test (optional)}
}
\value{
The function returns values of the test statistic and p-value of the logarithmic minimum test.
}
\description{
Calculates the test statistic and p-value of the Logarithmic minimum  test for independence in four-way contingency table
}
\details{
The test statistic and p-value of the Logarithmic minimum  test for independence in r x c x t x u contingency table,
}
\examples{
\donttest{Lms4.test(GenTab4(array(1/16, dim = c(2, 2, 2, 2)), 160), B = 1e2)}
\donttest{Lms4.test(table6, B = 1e3)}

}
\references{
Extension of the information contained in {Sulewski, P. (2021). \emph{Logarithmic Minimum Test for Independence in Three Way Con-tingency Table of Small Sizes,} Journal of Statistical Computation and Simulation 91(13), 2780-2799}
}
\author{
Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
}
