
# TODO: make this automatically if possible
# TODO: more function info perhaps?
functions <- list(
  ackley=list(func=ackley,
              domain=list(min=-5, max=5)),
  rosenbrock=list(func=rosenbrock,
                  domain=list(min=-5, max=5)),
  spherical=list(func=spherical,
                 domain=list(min=-5, max=5)),
  schwefel=list(func=schwefel,
                domain=list(min=-500, max=500)),
  sinc=list(func=sinc,
            domain=list(min=-20, max=20)),
  zakharov=list(func=zakharov,
                domain=list(min=-5, max=5))
)

#' Lookup information about a function by name
#' 
#' @param fun.name Function name to lookup
#' @export
get_info <- function(fun.name) {
  # TODO: check for correct name
  functions[[fun.name]]
}
