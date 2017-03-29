
library(lhs)
library(randtoolbox)
library(stringr)

#' The sampling functions take (n, k) where n is the number of samples
#' and k is the number of dimensions. The sampling functions should return
#' samples in a 0-1 hypercube.
#' sampling.func <- function(n, k)
#'
#' @param n The number of samples.
#' @param k The number of dimensions.
#' @param ... Additional arguments for the sampling (e.g. \code{seed}).
#' @name samplingf
NULL

#' @rdname samplingf
#' @export
lh.sample <- function(n,k,...) lhs::maximinLHS(n, k)
#' @rdname samplingf
#' @export
cartesian.sample <- function(n,k,...) {
  nums <- seq(0, 1, length.out=n)
  do.call(expand.grid, rep(list(nums), k))
}
#' @rdname samplingf
#' @export
random.sample <- function(n,k,...) matrix(runif(n*k), nrow=n, ncol=k)
#' @rdname samplingf
#' @export
hexagonal.sample <- function(n,k,...) {
  if(k != 2) stop("cannot do hexagonal sampling on k!=2 dimensions")
  c <- cartesian.sample(n, 2)
  V <- array(c(1, 0, 0.5, sqrt(3)/2), c(2,2))
  pts <- t(as.matrix(V %*% t(c)))
  unique(pts %% 1) # wrap everything
}
#' @rdname samplingf
#' @export
torus.sample <- function(n,k,...) randtoolbox::torus(n, k, ...)
#' @rdname samplingf
#' @export
sobol.sample <- function(n,k,...) randtoolbox::sobol(n, k, ...)
#' @rdname samplingf
#' @export
halton.sample <- function(n,k,...) randtoolbox::halton(n, k, ...)

map.range <- function(x, rng.min, rng.max, dom.min=0, dom.max=1) {
  (x-dom.min) / (dom.max-dom.min) * (rng.max-rng.min) + rng.min
}

#' Unified function sampling interface.
#' 
#' Provides a unified interface to sampling all functions. One just needs to
#' specify the name of the function to sample, the number of samples, the
#' dimensionality, and the sampling method and the library will take care
#' of the rest.
#' 
#' @param FUN.name The name of the function to sample.
#' @param n        The number of sample points.
#' @param k        The number of dimensions to sample.
#' @param method   The sampling method.
#' @param ...      Additional arguments passed to \code{FUN.name}.
#' @return         A data frame consisting of n rows with columns x1..xk and 
#'                 y1..yz where z is the number of outputs of the function.
#' @export
sample.func <- function(FUN.name, n, k, method="lh.sample", ...) {
  X <- match.fun(method)(n, k, seed=0)
  func.info <- get_info(FUN.name)
  func <- func.info$func
  func.domain <- func.info$domain
  X <- map.range(X, func.domain$min, func.domain$max)
  Y <- func(X, ...)
  X.df <- data.frame(X)
  names(X.df) <- stringr::str_c("x", 1:k)
  Y.df <- data.frame(Y)
  names(Y.df) <- stringr::str_c("y", 1:ncol(Y.df))
  cbind(X.df, Y.df)
}
