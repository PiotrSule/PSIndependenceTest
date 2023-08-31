#' @title Modular test for independence in three-way contingency table
#'
#' @description
#' Calculates the p-value of the modular test for independence in three-way contingency table
#'
#' @param stat a modular statistic value
#' @param nr a number of rows
#' @param nc a number of columns
#' @param nt a number of tubes
#' @param n a sample size
#' @param B <optional> an integer specifying the number of replicates used in the Monte Carlo test
#'
#' @rdname Mod3.pvalue
#'
#' @details
#' The Critical value of the modular test for independence in r x c x t contingency table,
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2018). \emph{Power Analysis Of Independence Testing for the Three-Way Con-tingency Tables of Small Sizes.} Journal of Applied Statistics 45(13), 2481-2498}
#'
#' @examples
#' tab7 = GenTab3(array(0.125, dim = c(2, 2, 2)), 100)
#' Mod3.pvalue(Mod3.stat(tab7), 2, 2, 2, 100)
#' Mod3.pvalue(1.333, 2, 3, 4, 200, 8*1e3)
#'
#' @export

Mod3.pvalue <- function(stat, nr, nc, nt, n, B = 1e4) {
  Q <- numeric(B)
  CDF <- numeric(B+1)
  for (i in 1:B) CDF[i] <- i / (B + 1)
  CDF[B+1] <- 1
  pijt <- array(1 / (nr * nc * nt), dim = c(nr, nc, nt))
  for (u in 1:B){
    nijt <- GenTab3(pijt, n)
    Q[u] <- Mod3.stat(nijt)
  }
  Q <- sort(Q)
  poz <- B + 1
  for (i in B:1) {
    if (Q[i] > stat) poz = i
  }
  return(1 - CDF[poz])
}
