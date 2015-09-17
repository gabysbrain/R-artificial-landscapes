
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
                domain=list(min=-5, max=5)),
  zakharov=list(func=zakharov,
                domain=list(min=-5, max=5))
)

get_info <- function(fun.name) {
  # TODO: check for correct name
  functions[[fun.name]]
}
