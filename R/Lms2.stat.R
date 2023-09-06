#' @title Logarithmic Minimum Test for Independence in Two-Way Contingency Table
#'
#' @description
#' Calculates the logarithmic minimum statistics (see Sulewski P. (2019)).
#'
#' @param nij a numeric matrix with non-negative values of the two-way contingency table cells
#' @return The function returns the value of the logarithmic minimum test statistic
#' @rdname Lms2.stat
#'
#' @details
#' The statistic of the logarithmic minimum test for independence in r x c contingency table,
#' see formula (4) and example 3 in the article.
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2019). \emph{The LMS for Testing Independence in Two-way Contingency Tables.} Biometrical Letters 56(1), 17-43}
#'
#' @examples
#' pij=matrix(1/6, nrow = 2, ncol = 3)
#' Lms2.stat(GenTab2(pij, 50))
#' iris$size <- ifelse(iris$Sepal.Length < median(iris$Sepal.Length),"small", "big")
#' Lms2.stat(table(iris$Species, iris$size))
#'
#' @export

Lms2.stat <- function(nij) {
  nr <- nrow(nij)
  nc <- ncol(nij)
  nik <- rowSums(nij)
  nkj <- colSums(nij)
  E <- outer(nik, nkj, "*") / sum(nij)
  S <- 0
  for(j in 1:nc) for(i in 1:nr) S <- S + log(min(nij[i, j], E[i, j]) /
                              max(nij[i, j], E[i, j]) + 1e-5)
  return (-S)
}



