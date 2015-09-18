
library(lhs)
library(stringr)

# The sampling function takes (n, k) where n is the number of samples
# and k is the number of dimensions. The sampling functions should return
# samples in a 0-1 hypercube.
# sampling.func <- function(n, k)

lh.sample <- function(n,k) maximinLHS(n, k)
cartesian.sample <- function(n,k) {
  nums <- seq(0, 1, length.out=n)
  do.call(expand.grid, rep(list(nums), k))
}
random.sample <- function(n,k) matrix(runif(n*k), nrow=n, ncol=k)

map.range <- function(x, rng.min, rng.max, dom.min=0, dom.max=1) {
  (x-dom.min) / (dom.max-dom.min) * (rng.max-rng.min) + rng.min
}

sample.func <- function(FUN.name, n, k, method="lhs.sample", ...) {
  X <- match.fun(method)(n, k)
  func.info <- get_info(FUN.name)
  func <- func.info$func
  func.domain <- func.info$domain
  X <- map.range(X, func.domain$min, func.domain$max)
  Y <- func(X, ...)
  X.df <- data.frame(X)
  names(X.df) <- str_c("x", 1:k)
  Y.df <- data.frame(Y)
  names(Y.df) <- str_c("y", 1:ncol(Y.df))
  cbind(X.df, Y.df)
}
