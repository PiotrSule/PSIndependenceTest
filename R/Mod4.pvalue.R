#' @title MOdular test for independence in four-way contingency table
#'
#' @description
#' Calculates the p-value of the modular test for independence in four-way contingency table
#'
#' @param stat a Logarithmic minimum statistic value
#' @param nr a number of rows
#' @param nc a number of columns
#' @param nt a number of tubes
#' @param nu a number of
#' @param n a sample size
#' @param B an integer specifying the number of replicates used in the Monte Carlo test (optional)
#' @return The function returns the p-value of the modular test.
#' @rdname Mod4.pvalue
#'
#' @details
#' The Critical value of the modular test for independence in r x c x t x u contingency table,
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' Extension of the information contained in {Sulewski, P. (2018). \emph{Power Analysis Of Independence Testing for the Three-Way Con-tingency Tables of Small Sizes.} Journal of Applied Statistics 45(13), 2481-2498}
#'
#' @examples
#' Mod4.pvalue(Mod4.stat(table6), 2, 2, 2, 2, 160, B = 1e2)
#' Mod4.pvalue(Mod4.stat(table6), 2, 2, 2, 2, 160, B = 1e3)
#'
#' @export

Mod4.pvalue <- function(stat, nr, nc, nt, nu, n, B = 1e4) {
  Q <- numeric(B)
  CDF <- numeric(B+1)
  for (i in 1:B) CDF[i] <- i / (B + 1)
  CDF[B+1] = 1
  pijtu <- array(1 / (nr * nc * nt * nu), dim = c(nr, nc, nt, nu))
  for (u in 1:B){
    nijtu <- GenTab4(pijtu, n)
    Q[u] <- Mod4.stat(nijtu)
  }
  Q <- sort(Q)
  poz <- B + 1
  for (i in B:1) {
    if (Q[i] > stat) poz = i else break
  }
  return(1 - CDF[poz])
}
