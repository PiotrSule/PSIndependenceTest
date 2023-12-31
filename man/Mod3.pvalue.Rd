% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Mod3.pvalue.R
\name{Mod3.pvalue}
\alias{Mod3.pvalue}
\title{Modular test for independence in three-way contingency table}
\usage{
Mod3.pvalue(stat, nr, nc, nt, n, B = 10000)
}
\arguments{
\item{stat}{a modular statistic value}

\item{nr}{a number of rows}

\item{nc}{a number of columns}

\item{nt}{a number of tubes}

\item{n}{a sample size}

\item{B}{an integer specifying the number of replicates used in the Monte Carlo test (optional)}
}
\value{
The function returns the p-value of the modular test.
}
\description{
Calculates the p-value of the modular test for independence in three-way contingency table
}
\details{
The Critical value of the modular test for independence in r x c x t contingency table,
}
\examples{
data = GenTab3(array(0.125, dim = c(2, 2, 2)), 80)
Mod3.pvalue(Mod3.stat(data), 2, 2, 2, 80, B = 1e2)
Mod3.pvalue(Mod3.stat(table4), 2, 2, 2, 80, B = 1e3)

}
\references{
{Sulewski, P. (2018). \emph{Power Analysis Of Independence Testing for the Three-Way Con-tingency Tables of Small Sizes.} Journal of Applied Statistics 45(13), 2481-2498}
}
\author{
Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
}
