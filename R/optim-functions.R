
#' optim-functions: A collection of standard optimization functions along with
#'                  a standard interface to call and sample those functions.
#'
#' @section Sampling functions:
#' The sampling functions all need to have a standard interface. They all must
#' take 2 parameters: \code{n}, the number of samples to generate and \code{k},
#' the number of dimensions to sample. They all return a matrix-like object
#' containing \code{n} rows of \code{k} columns of samples.
#' 
#' @docType package
#' @name optim-functions
NULL