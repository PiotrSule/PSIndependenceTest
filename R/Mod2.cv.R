#' @title Modular test for independence in two-way contingency table
#'
#' @description
#' Calculates the critical value of the modular test for independence in two-way contingency table
#' see formula (9) in the article.
#'
#' @param nr a number of rows
#' @param nc a number of columns
#' @param n a sample size
#' @param alfa a significance level
#' @param B <optional> an integer specifying the number of replicates used in the Monte Carlo test
#'
#' @rdname Mod2.cv
#'
#' @details
#' The Critical value of the modular test for independence in r x c contingency table,
#' see formula (2) in the article.
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2016). \emph{Moc testów niezależności w tablicy dwudzielczej większej niż 2×2,} Przegląd statystyczny 63(2), 190-210}
#'
#' @examples
#' Mod2.cv(6, 2, 93, 0.05)
#' Mod2.cv(3, 2, 150, 0.1, B = 5*1e4)
#'
#' @export


Mod2.cv <- function(nr, nc, n, alfa, B = 1e4) {
  Q <- numeric(B)
  pij <- array(1 / (nr * nc), dim = c(nr, nc))
  for (u in 1:B){
    nij <- GenTab2(pij, n)
    Q[u] <- Mod2.stat(nij)
  }
  Q <- sort(Q)
  return(Q[(1 - alfa) * B])
}
