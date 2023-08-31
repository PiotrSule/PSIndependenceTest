#' @title Modular test for independence in two-way contingency table
#'
#' @description
#' Calculates the statistic of the modular test for independence in two-way contingency table
#' (see Sulewski P. (2016)).
#'
#' @param nij a numeric matrix with non-negative values of the two-way contingency table cells
#'
#' @rdname Mod2.stat
#'
#' @details
#' The statistic of the modular test for independence in r x c contingency table,
#' see formula (2) in the article.
#'
#' @author
#' Piotr Sulewski, \email{piotr.sulewski@apsl.edu.pl}, Pomeranian University in Slupsk.
#'
#' @references
#' {Sulewski, P. (2016). \emph{Moc testów niezależności w tablicy dwudzielczej większej niż 2×2,} Przegląd statystyczny 63(2), 190-210}
#'
#' @examples
#' pij=matrix(1/12, nrow = 3, ncol = 4)
#' tab5=GenTab2(pij, 60)
#' Mod2.stat(tab5)
#' iris$size <- ifelse(iris$Sepal.Length < median(iris$Sepal.Length),"small", "big")
#' Mod2.stat(table(iris$Species, iris$size))
#'
#' @export

Mod2.stat <- function(nij) {
  nik <- rowSums(nij)
  nkj <- colSums(nij)
  E <- outer(nik, nkj, "*") / sum(nij)
  return (sum(abs(nij - E) / E))
}
