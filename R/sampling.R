
library(lhs)
library(stringr)

# The sampling function takes (n, k) where n is the number of samples
# and k is the number of dimensions. The sampling functions should return
# samples in a 0-1 hypercube.
# sampling.func <- function(n, k)

lh.sample <- function(n,k) maximinLHS(n, k)

map.range <- function(x, rng.min, rng.max, dom.min=0, dom.max=1) {
  (x-dom.min) / (dom.max-dom.min) * (rng.max-rng.min) + rng.min
}

sample <- function(FUN.name, n, k, method="lhs.sample", ...) {
  X <- match.fun(method)
  func.info <- get_info(FUN.name)
  func <- func.info$function
  func.domain <- func.info$domain
  Y <- func(map.range(X, func.domain$min, func.domain$max), ...)
  X.df <- data.frame(X)
  names(out) <- str_c("x", 1:k)
  Y.df <- data.frame(Y)
  names(Y) <- str_c("y", 1:ncol(Y))
  cbind(X.df, Y.df)
}
