#' @title Logarithmic minimum test for independence in two-way contingency table
#'
#' @description
#' Calculates the critical values of the logarithmic minimum test.
#'
#' @param nr a number of rows
#' @param nc a number of columns
#' @param n a sample size
#' @param alfa a significance level
#' @param B <optional> an integer specifying the number of replicates used in the Monte Carlo test
#'
#' @rdname Lms2.cv
#'
#' @details
#' The Critical value of the logarithmic minimum test for independence in r x c contingency table,
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2019). \emph{The LMS for Testing Independence in Two-way Contingency Tables.} Biometrical Letters 56(1), 17-43} #'
#'
#' @examples
#' Lms2.cv(6, 2, 93, 0.05)
#' Lms2.cv(3, 2, 150, 0.1, B = 5*1e4)
#'
#' @export

Lms2.cv <- function(nr, nc, n, alfa, B=1e4) {
  Q <- numeric(B)
  pij <- array(1 / (nr * nc), dim = c(nr, nc))
  for (u in 1:B){
    nij <- GenTab2(pij, n)
    Q[u] <- Lms2.stat(nij)
  }
  Q <- sort(Q)
  return(Q[(1 - alfa) * B])
}

